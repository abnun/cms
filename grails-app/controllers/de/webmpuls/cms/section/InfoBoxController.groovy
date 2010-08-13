package de.webmpuls.cms.section

class InfoBoxController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [infoBoxInstanceList: InfoBox.list(params), infoBoxInstanceTotal: InfoBox.count()]
    }

    def create = {
        def infoBoxInstance = new InfoBox()
        infoBoxInstance.properties = params
        return [infoBoxInstance: infoBoxInstance]
    }

    def save = {
        def infoBoxInstance = new InfoBox(params)
        if (infoBoxInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'infoBox.label', default: 'InfoBox'), infoBoxInstance.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "create", model: [infoBoxInstance: infoBoxInstance])
        }
    }

    def show = {
        def infoBoxInstance = InfoBox.get(params.id)
        if (!infoBoxInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'infoBox.label', default: 'InfoBox'), params.id])}"
            redirect(action: "list")
        }
        else {
            [infoBoxInstance: infoBoxInstance]
        }
    }

    def edit = {
        def infoBoxInstance = InfoBox.get(params.id)
        if (!infoBoxInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'infoBox.label', default: 'InfoBox'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [infoBoxInstance: infoBoxInstance]
        }
    }

    def update = {
        def infoBoxInstance = InfoBox.get(params.id)
        if (infoBoxInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (infoBoxInstance.version > version) {
                    
                    infoBoxInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'infoBox.label', default: 'InfoBox')] as Object[], "Another user has updated this InfoBox while you were editing")
                    render(view: "edit", model: [infoBoxInstance: infoBoxInstance])
                    return
                }
            }
            infoBoxInstance.properties = params
            if (!infoBoxInstance.hasErrors() && infoBoxInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'infoBox.label', default: 'InfoBox'), infoBoxInstance.id])}"
                redirect(action: "list")
            }
            else {
                render(view: "edit", model: [infoBoxInstance: infoBoxInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'infoBox.label', default: 'InfoBox'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def infoBoxInstance = InfoBox.get(params.id)
        if (infoBoxInstance) {
            try {
                infoBoxInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'infoBox.label', default: 'InfoBox'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'infoBox.label', default: 'InfoBox'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'infoBox.label', default: 'InfoBox'), params.id])}"
            redirect(action: "list")
        }
    }

	def createInfoBoxFromAbteilung =
	{
		println params
		String inhalt = params.ueberschrift
		String ueberschrift = params.inhalt
		Integer position = params.int('position')

		if(inhalt && ueberschrift && position)
		{
			Abteilung abteilung = Abteilung.get(params.abteilung.id)

			InfoBox infoBox = new InfoBox(ueberschrift: ueberschrift, inhalt: inhalt.trim(), position: position)

			println infoBox

			try
			{
				infoBox.save()
				
				if (abteilung)
				{
					if (!abteilung.infoBoxen.contains(infoBox))
					{
						abteilung.addToInfoBoxen(infoBox)

						if (abteilung.save())
						{
							if (flash.message)
							{
								flash.message += "<br />Neue Infobox '$infoBox' gespeichert."
							}
							else
							{
								flash.message = "Neue Infobox '$infoBox' gespeichert."
							}

							redirect(controller: 'abteilung', action: 'edit', id: params.abteilung.id)
							return false
						}
						else
						{
							if (flash.error)
							{
								flash.error += "<br />Abteilung '$abteilung' konnte nicht gespeichert werden."
							}
							else
							{
								flash.error = "Abteilung '$abteilung' konnte nicht gespeichert werden."
							}
						}
					}
					else
					{
						if (flash.error)
						{
							flash.error += "<br />Diese Infobox '$sp' exisitiert bereits."
						}
						else
						{
							flash.error = "Diese Infobox '$sp' exisitiert bereits."
						}
					}
				}
				else
				{
					if (flash.message)
					{
						flash.message += "<br />Abteilung mit ID '${params.abteilung.id}' konnte nicht gefunden werden."
					}
					else
					{
						flash.message = "Abteilung mit ID '${params.abteilung.id}' konnte nicht gefunden werden."
					}
				}
			}
			catch(Exception e)
			{
				e.printStackTrace()
			}
		}
		redirect(controller: 'abteilung', action: 'edit', id: params.abteilung.id, params: ['infoBox.inhalt': params.inhalt])
		return false
	}
}
