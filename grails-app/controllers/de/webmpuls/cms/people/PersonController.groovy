package de.webmpuls.cms.people

import de.webmpuls.cms.section.Abteilung

import de.webmpuls.cms.media.MediaHelper
import de.webmpuls.photo_album.Album
import de.webmpuls.photo_album.Picture

class PersonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [personInstanceList: Person.list([cache: true]), personInstanceTotal: Person.count()]
    }

    def create = {
        def personInstance = new Person()
        personInstance.properties = params
        return [personInstance: personInstance]
    }

    def save = {
        def personInstance = new Person(params)
        if (personInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.toString()])}"
            redirect(action: "edit", id: personInstance.id)
        }
        else {
            render(view: "create", model: [personInstance: personInstance])
        }
    }

    def show = {
        def personInstance = Person.get(params.id)
        if (!personInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
            redirect(action: "list")
        }
        else {
            [personInstance: personInstance]
        }
    }

    def edit = {
        def personInstance = Person.get(params.id)
        if (!personInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
            redirect(action: "list")
        }
        else {
			Album tmpAlbum = de.webmpuls.photo_album.Album.withName(MediaHelper.ALBUM_PERSONEN).list().first()

			String albumDate = ""
			if(tmpAlbum) {
				albumDate = formatDate(date: tmpAlbum.dateCreated, format: 'ddMMyyyy')
			}
            return [personInstance: personInstance, album: tmpAlbum, albumDate: albumDate]
        }
    }

    def update = {
		println params
        def personInstance = Person.get(params.id)
        if (personInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (personInstance.version > version) {
                    
                    personInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'person.label', default: 'Person')], "Another user has updated this Person while you were editing")
                    render(view: "edit", model: [personInstance: personInstance])
                    return
                }
            }
            personInstance.properties = params

			ArrayList vorstandsFunktionList = params.list('funktionen.vorstand')
			if(vorstandsFunktionList)
			{
				for(String vFunktionId in vorstandsFunktionList)
				{
					Funktion tmpVFunktion = Funktion.get(vFunktionId)

					if(tmpVFunktion && !personInstance.funktionen.contains(tmpVFunktion))
					{
						personInstance.addToFunktionen(tmpVFunktion)
					}
				}
			}
			if (!params.list('funktionen'))
			{
				personInstance.funktionen = []
			}
			if (!params.list('abteilungen'))
			{
				personInstance.abteilungen = []
			}
            if (!personInstance.hasErrors() && personInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personInstance.toString()])}"
                redirect(action: "edit", id: personInstance.id)
            }
            else {
                render(view: "edit", model: [personInstance: personInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def personInstance = Person.get(params.id)
        if (personInstance) {
            try {
				def abteilungList = Abteilung.list()
				def funktionList = Funktion.list()
				def abteilungenToAlter = abteilungList.findAll
				{
					Abteilung abteilung ->
					abteilung.personen.contains(personInstance)
				}
				abteilungenToAlter*.removeFromPersonen(personInstance)
				abteilungenToAlter*.save(flush: true)

				def funktionenToAlter = funktionList.findAll
				{
					Funktion funktion ->
					funktion.personen.contains(personInstance)
				}
				funktionenToAlter*.removeFromPersonen(personInstance)
				funktionenToAlter*.save(flush: true)

                personInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'person.label', default: 'Person'), personInstance.toString()])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
            redirect(action: "list")
        }
    }

	def setPicture =
	{
		String id = params.id
		if(id)
		{
			Person tmpPerson = Person.get(id)

			String pictureBaseName = "${tmpPerson.vorname.toLowerCase()}_${tmpPerson.nachname.toLowerCase()}${de.webmpuls.photo_album.util.MediaUtils.SUFFIX}"
			String tmpPictureBaseName = params["bild.id"] 
			if(tmpPictureBaseName)
			{
				pictureBaseName = tmpPictureBaseName

				int indexOf = pictureBaseName.indexOf(de.webmpuls.photo_album.util.MediaUtils.NORMAL)
				if(indexOf != -1)
				{
					String suffix = pictureBaseName.substring(pictureBaseName.indexOf("."), pictureBaseName.size())
					String baseName = pictureBaseName.substring(0, indexOf)
					pictureBaseName = baseName + suffix
				}
			}
			if(tmpPerson)
			{
				Picture tmpPicture = Picture.findByBaseName(pictureBaseName)
				if(tmpPicture)
				{
					tmpPerson.setBild(tmpPicture)

					if (!tmpPerson.hasErrors() && tmpPerson.save(flush: true))
					{
						flash.message = "${message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), tmpPerson.toString()])}"
						redirect(action: "edit", id: tmpPerson.id)
					}
					else
					{
						render(view: "edit", model: [personInstance: tmpPerson])
					}
				}
				else
				{
					render(view: "edit", model: [personInstance: tmpPerson])
				}
			}
		}
	}
}
