package de.webmpuls.cms.section

import java.util.regex.Matcher
import java.text.SimpleDateFormat

class SpielplanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [spielplanInstanceList: Spielplan.list(params), spielplanInstanceTotal: Spielplan.count()]
    }

    def create = {
        def spielplanInstance = new Spielplan()
        spielplanInstance.properties = params
        return [spielplanInstance: spielplanInstance]
    }

    def save = {
        def spielplanInstance = new Spielplan(params)
        if (spielplanInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'spielplan.label', default: 'Spielplan'), spielplanInstance.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "create", model: [spielplanInstance: spielplanInstance])
        }
    }

    def show = {
        def spielplanInstance = Spielplan.get(params.id)
        if (!spielplanInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'spielplan.label', default: 'Spielplan'), params.id])}"
            redirect(action: "list")
        }
        else {
            [spielplanInstance: spielplanInstance]
        }
    }

    def edit = {
        def spielplanInstance = Spielplan.get(params.id)
        if (!spielplanInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'spielplan.label', default: 'Spielplan'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [spielplanInstance: spielplanInstance]
        }
    }

    def update = {
        def spielplanInstance = Spielplan.get(params.id)
        if (spielplanInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (spielplanInstance.version > version) {
                    
                    spielplanInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'spielplan.label', default: 'Spielplan')] as Object[], "Another user has updated this Spielplan while you were editing")
                    render(view: "edit", model: [spielplanInstance: spielplanInstance])
                    return
                }
            }
            spielplanInstance.properties = params
            if (!spielplanInstance.hasErrors() && spielplanInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'spielplan.label', default: 'Spielplan'), spielplanInstance.id])}"
                redirect(action: "list")
            }
            else {
                render(view: "edit", model: [spielplanInstance: spielplanInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'spielplan.label', default: 'Spielplan'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def spielplanInstance = Spielplan.get(params.id)
        if (spielplanInstance) {
            try {
                spielplanInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'spielplan.label', default: 'Spielplan'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'spielplan.label', default: 'Spielplan'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'spielplan.label', default: 'Spielplan'), params.id])}"
            redirect(action: "list")
        }
    }

	def createSpielplanFromAbteilung =
	{
		println params
		String inhalt = params.inhalt
		def regex = /^(.+) ([\.\d]+) ((.+) - (.+)) ([\.\d]+)?/
		//def regex = /^(.+) (.+) (.+ - .+) (.+)?/

		if(inhalt)
		{
			def array = inhalt.split("\n")

			Collection spielplaeneToSave = []

			println array.size()

			array.each
			{
				Matcher matcher = it =~ regex

				Spielplan spielplan = new Spielplan()

				println("matcher -> ${matcher[0]}")

				println matcher[0][1]
				println matcher[0][2]
				println matcher[0][3]
				println matcher[0][4]
				println matcher[0][5]
				println matcher[0][6]

				spielplan.abteilungKuerzel = matcher[0][1]

				spielplan.spieldatum = new SimpleDateFormat("dd.MM.yyyy").parse(matcher[0][2].toString())

				spielplan.heimmannschaft = matcher[0][4]

				spielplan.gastmannschaft = matcher[0][5]
				
				spielplan.anstoss = matcher[0][6]

				Spielplan tmpSpielplan = Spielplan.find(spielplan)

				if(tmpSpielplan)
				{
					spielplan = tmpSpielplan
				}

				spielplaeneToSave.add(spielplan)

			}

			Abteilung abteilung = Abteilung.get(params.abteilung.id)

			if (spielplaeneToSave)
			{
				for (Spielplan sp in spielplaeneToSave)
				{
					if (sp.save())
					{
						println sp

						if (abteilung)
						{
							if (!abteilung.spielplaene.contains(sp))
							{
								abteilung.addToSpielplaene(sp)

								if (abteilung.save())
								{
									if (flash.message)
									{
										flash.message += "<br />Spielplan '$sp' gespeichert."
									}
									else
									{
										flash.message = "Spielplan '$sp' gespeichert."
									}
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
								if(flash.error)
								{
									flash.error += "<br />Spielplan '$sp' exisitiert bereits."
								}
								else
								{
									flash.error = "Spielplan '$sp' exisitiert bereits."
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
				}
				redirect(controller: 'abteilung', action: 'edit', id: abteilung.id)
				return false
			}
		}
		redirect(uri: "/")
		return false
	}
}
