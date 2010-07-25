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

			String vorname = MediaHelper.formatNameForDisk(tmpPerson.vorname)
			String nachname = MediaHelper.formatNameForDisk(tmpPerson.nachname)
			String pictureBaseName = "${vorname}_${nachname}${de.webmpuls.photo_album.util.MediaUtils.SUFFIX}"
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

	def vorstand =
	{
		Funktion vorsitzender1 = Funktion.findByCode(Funktion.VORSITZENDER1)
		Funktion vorsitzender2 = Funktion.findByCode(Funktion.VORSITZENDER2)
		Funktion vorsitzender3 = Funktion.findByCode(Funktion.VORSITZENDER3)
		Funktion beisitzer = Funktion.findByCode(Funktion.BEISITZER)
		Funktion webmaster = Funktion.findByCode(Funktion.WEBMASTER)
		Funktion referent = Funktion.findByCode(Funktion.REFERENT)
		Funktion geschaeftsstelle = Funktion.findByCode(Funktion.GESCHAEFTSSTELLE)
		Funktion jugendleiter = Funktion.findByCode(Funktion.JUGENDLEITER)
		Funktion jugendsprecher = Funktion.findByCode(Funktion.JUGENDSPRECHER)
		Funktion kassierer = Funktion.findByCode(Funktion.KASSIERER)
		Funktion leiter_tech_sport = Funktion.findByCode(Funktion.LEITER_TECH_SPORT)
		Funktion leiter_tech_wirt = Funktion.findByCode(Funktion.LEITER_TECH_WIRT)
		Funktion schriftfuehrer = Funktion.findByCode(Funktion.SCHRIFTFUEHRER)
		Funktion seniorenbeauftrager = Funktion.findByCode(Funktion.SENIONERBEAUFTRAGTER)
		Funktion frauenbeauftragter = Funktion.findByCode(Funktion.FRAUENBEAUFTRAGTER)

		Person vorsitzender1Person = vorsitzender1.personen ? vorsitzender1.personen.iterator().next() : null
		Person vorsitzender2Person = vorsitzender2.personen ? vorsitzender2.personen.iterator().next() : null
		Person vorsitzender3Person = vorsitzender3.personen ? vorsitzender3.personen.iterator().next() : null
		Person beisitzerPerson = beisitzer.personen ? beisitzer.personen.iterator().next() : null
		Person webmasterPerson = webmaster.personen ? webmaster.personen.iterator().next() : null
		Person referentPerson = referent.personen ? referent.personen.iterator().next() : null

		Iterator geschaeftsstellePersonIterator = geschaeftsstelle.personen ? geschaeftsstelle.personen.iterator() : null
		Person geschaeftsstellePerson1 = geschaeftsstellePersonIterator?.hasNext() ? geschaeftsstellePersonIterator?.next() : null
		Person geschaeftsstellePerson2 = geschaeftsstellePersonIterator?.hasNext() ? geschaeftsstellePersonIterator?.next() : null

		Person jugendleiterPerson = jugendleiter.personen ? jugendleiter.personen.iterator().next() : null
		Person jugendsprecherPerson = jugendsprecher.personen ? jugendsprecher.personen.iterator().next() : null
		Person kassiererPerson = kassierer.personen ? kassierer.personen.iterator().next() : null
		Person leiter_tech_sportPerson = leiter_tech_sport.personen ? leiter_tech_sport.personen.iterator().next() : null
		Person leiter_tech_wirtPerson = leiter_tech_wirt.personen ? leiter_tech_wirt.personen.iterator().next() : null
		Person schriftfuehrerPerson = schriftfuehrer.personen ? schriftfuehrer.personen.iterator().next() : null
		Person seniorenbeauftragerPerson = seniorenbeauftrager.personen ? seniorenbeauftrager.personen.iterator().next() : null
		Person frauenbeauftragterPerson = frauenbeauftragter.personen ? frauenbeauftragter.personen.iterator().next() : null

		return[vorsitzender1: vorsitzender1,
				vorsitzender2: vorsitzender2,
				vorsitzender3: vorsitzender3,
				kassierer: kassierer,
				beisitzer: beisitzer,
				webmaster: webmaster,
				referent: referent,
				geschaeftsstelle: geschaeftsstelle,
				jugendleiter: jugendleiter,
				jugendsprecher: jugendsprecher,
				leiter_tech_sport: leiter_tech_sport,
				leiter_tech_wirt: leiter_tech_wirt,
				schriftfuehrer: schriftfuehrer,
				seniorenbeauftrager: seniorenbeauftrager,
				frauenbeauftragter: frauenbeauftragter,
				vorsitzender1Person: vorsitzender1Person,
				vorsitzender2Person: vorsitzender2Person,
				vorsitzender3Person: vorsitzender3Person,
				kassiererPerson: kassiererPerson,
				beisitzerPerson: beisitzerPerson,
				webmasterPerson: webmasterPerson,
				referentPerson: referentPerson,
				geschaeftsstellePerson1: geschaeftsstellePerson1,
				geschaeftsstellePerson2: geschaeftsstellePerson2,
				jugendleiterPerson: jugendleiterPerson,
				jugendsprecherPerson: jugendsprecherPerson,
				leiter_tech_sportPerson: leiter_tech_sportPerson,
				leiter_tech_wirtPerson: leiter_tech_wirtPerson,
				schriftfuehrerPerson: schriftfuehrerPerson,
				seniorenbeauftragerPerson: seniorenbeauftragerPerson,
				frauenbeauftragterPerson: frauenbeauftragterPerson
		]
	}

	def jugend_vorstand =
	{
		Funktion jugendleiter = Funktion.findByCode(Funktion.JUGENDLEITER)
		Funktion jugendsprecher = Funktion.findByCode(Funktion.JUGENDSPRECHER)

		Person jugendleiterPerson = jugendleiter.personen ? jugendleiter.personen.iterator().next() : null
		Person jugendsprecherPerson = jugendsprecher.personen ? jugendsprecher.personen.iterator().next() : null

		[jugendleiterPerson: jugendleiterPerson,
				jugendsprecherPerson: jugendsprecherPerson,
				jugendleiter: jugendleiter,
				jugendsprecher: jugendsprecher]
	}

	def delegierte =
	{
		
	}
}
