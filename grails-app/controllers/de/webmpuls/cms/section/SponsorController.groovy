package de.webmpuls.cms.section

import de.webmpuls.cms.media.MediaHelper
import de.webmpuls.photo_album.Album
import de.webmpuls.photo_album.Picture

class SponsorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [sponsorInstanceList: Sponsor.list([cache: true]), sponsorInstanceTotal: Sponsor.count()]
    }

    def create = {
        def sponsorInstance = new Sponsor()
        sponsorInstance.properties = params
        return [sponsorInstance: sponsorInstance]
    }

    def save = {
        def sponsorInstance = new Sponsor(params)
        if (sponsorInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), sponsorInstance.id])}"
            redirect(action: "edit", id: sponsorInstance.id)
        }
        else {
            render(view: "create", model: [sponsorInstance: sponsorInstance])
        }
    }

    def show = {
        def sponsorInstance = Sponsor.get(params.id)
        if (!sponsorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sponsorInstance: sponsorInstance]
        }
    }

    def edit = {
        def sponsorInstance = Sponsor.get(params.id)
        if (!sponsorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])}"
            redirect(action: "list")
        }
        else {
			Album tmpAlbum = de.webmpuls.photo_album.Album.withName(MediaHelper.ALBUM_SPONSOREN).list().first()

			String albumDate = ""
			if(tmpAlbum) {
				albumDate = formatDate(date: tmpAlbum.dateCreated, format: 'ddMMyyyy')
			}
            return [sponsorInstance: sponsorInstance, album: tmpAlbum, albumDate: albumDate]
        }
    }

    def update = {
        def sponsorInstance = Sponsor.get(params.id)
        if (sponsorInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sponsorInstance.version > version) {
                    
                    sponsorInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'sponsor.label', default: 'Sponsor')], "Another user has updated this Sponsor while you were editing")
                    render(view: "edit", model: [sponsorInstance: sponsorInstance])
                    return
                }
            }
            sponsorInstance.properties = params
            if (!sponsorInstance.hasErrors() && sponsorInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), sponsorInstance.name])}"
                redirect(action: "list")
            }
            else {
                render(view: "edit", model: [sponsorInstance: sponsorInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sponsorInstance = Sponsor.get(params.id)
        if (sponsorInstance) {
            try {
                sponsorInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])}"
            redirect(action: "list")
        }
    }

	def images =
	{
		render(view: '/global/menu/sponsoren', model:[sponsorInstanceList: Sponsor.list([cache: true])])
	}

	def setPicture =
	{
		String id = params.id
		if(id)
		{
			Sponsor tmpSponsor = Sponsor.get(id)

			String pictureBaseName = "${MediaHelper.formatNameForDisk(tmpSponsor.name.toLowerCase() + de.webmpuls.photo_album.util.MediaUtils.SUFFIX)}"
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
			if(tmpSponsor)
			{
				Picture tmpPicture = Picture.findByBaseName(pictureBaseName)
				if(tmpPicture)
				{
					tmpSponsor.setBild(tmpPicture)

					if (!tmpSponsor.hasErrors() && tmpSponsor.save(flush: true))
					{
						flash.message = "${message(code: 'default.updated.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), tmpSponsor.toString()])}"
						redirect(action: "edit", id: tmpSponsor.id)
					}
					else
					{
						tmpSponsor.errors.allErrors.each
						{
							println it
						}

						redirect(action: "edit", id: id)
					}
				}
				else
				{
					redirect(action: "edit", id: id)
				}
			}
		}
	}
}
