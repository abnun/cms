package de.webmpuls.cms.section

import de.webmpuls.cms.people.Funktion
import de.webmpuls.cms.people.Person
import de.webmpuls.cms.result.Tabelle
import de.webmpuls.cms.result.TabelleHelper
import de.webmpuls.cms.media.MediaHelper
import de.webmpuls.photo_album.Album

class AbteilungController {

	def spielplanService
	def resultService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	static List allowedCodes = [AbteilungHelper.CODE_FUSSBALL_DAMEN, AbteilungHelper.CODE_FUSSBALL_HERREN, AbteilungHelper.CODE_FUSSBALL_JUGEND]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [abteilungInstanceList: Abteilung.list(params), abteilungInstanceTotal: Abteilung.count()]
    }

    def create = {
        def abteilungInstance = new Abteilung()
        abteilungInstance.properties = params
        return [abteilungInstance: abteilungInstance]
    }

    def save = {
        def abteilungInstance = new Abteilung(params)
        if (abteilungInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), abteilungInstance.name])}"
            redirect(action: "show", id: abteilungInstance.id)
        }
        else {
            render(view: "create", model: [abteilungInstance: abteilungInstance])
        }
    }

    def berichte =
	{
		println("params -> $params")

		def abteilungInstance = Abteilung.get(params.id)
        if (!abteilungInstance) {
			abteilungInstance = Abteilung.findByCode(params.code)
		}
        if (!abteilungInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
            redirect(action: "list")
        }
        else
		{
			ArrayList abteilungBerichte = new ArrayList()
			abteilungBerichte.addAll(abteilungInstance.berichte)

			String spielplanInhalt = params['spielplan.inhalt']

			boolean showPortraits = !abteilungInstance.code.startsWith(AbteilungHelper.CODE_FUSSBALL_JUGEND)

			return [abteilungInstance: abteilungInstance, berichte: abteilungBerichte.sort{Bericht a, Bericht b -> a.ueberschrift.toLowerCase() <=> b.ueberschrift.toLowerCase()}, spielplanInhalt: spielplanInhalt, showPortraits: showPortraits]
		}
    }

    def edit = {
        def abteilungInstance = Abteilung.get(params.id)
        if (!abteilungInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
            redirect(action: "list")
        }
        else
		{

			def funktionList = de.webmpuls.cms.people.Funktion.normaleFunktionen().list([cache: true])

			StringBuilder fBuilder = new StringBuilder()
			for (de.webmpuls.cms.people.Funktion funktion: funktionList)
			{
				//if(!abteilungInstance.mitarbeiterfunktionen.contains(funktion))
				//{
					if (fBuilder.length() == 0)
					{
						fBuilder.append("\"${funktion.name}\"")
					}
					else
					{
						fBuilder.append(",\"${funktion.name}\"")
					}
				//}
			}

			def personList = de.webmpuls.cms.people.Person.list([cache: true])

			StringBuilder pBuilder = new StringBuilder()
			for (Person person: personList)
			{
				//if(!abteilungInstance.personen.contains(person))
				//{
					if (pBuilder.length() == 0)
					{
						pBuilder.append("\"${person.vorname} ${person.nachname}\"")
					}
					else
					{
						pBuilder.append(",\"${person.vorname} ${person.nachname}\"")
					}
				//}
			}

			String spielplanInhalt = params['spielplan.inhalt']

            return [abteilungInstance: abteilungInstance, fBuilder: fBuilder.toString(), pBuilder: pBuilder.toString(), spielplanInhalt: spielplanInhalt]
        }
    }

    def update = {
		println("params -> $params")
        def abteilungInstance = Abteilung.get(params.id)
        if (abteilungInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (abteilungInstance.version > version) {
                    
                    abteilungInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'abteilung.label', default: 'Abteilung')], "Another user has updated this Abteilung while you were editing")
                    render(view: "edit", model: [abteilungInstance: abteilungInstance])
                    return
                }
            }

			ArrayList personList = params.list('personen')
			ArrayList funktionList = params.list('funktionen')

			if(personList && !personList.isEmpty() && funktionList && !funktionList.isEmpty())
			{
				for(String personString in personList)
				{
					if(personString)
					{
						String tmpVorname = personString.split(" ")[0]
						String tmpNachname = personString.split(" ")[1]

						Person tmpPerson = Person.findByVornameAndNachname(tmpVorname, tmpNachname)

						if(tmpPerson)
						{
							for (String funktionString in funktionList)
							{
								Funktion tmpFunktion = Funktion.findByName(funktionString)

								if (tmpFunktion)
								{
									tmpPerson.addToFunktionen(tmpFunktion)
									tmpFunktion.addToPersonen(tmpPerson)

									if(!abteilungInstance.mitarbeiterfunktionen.contains(tmpFunktion))
									{
										abteilungInstance.addToMitarbeiterfunktionen(tmpFunktion)
									}
								}
							}

							if(!abteilungInstance.personen.contains(tmpPerson))
							{
								abteilungInstance.addToPersonen(tmpPerson)
							}
						}
					}
				}
				params.remove('personen')
				params.remove('funktionen')
			}
			/*else if (!params.list('personen'))
			{
				abteilungInstance.personen = []
			}
			else if (!params.list('funktionen'))
			{
				abteilungInstance.mitarbeiterfunktionen = []
			}*/

            abteilungInstance.properties = params

			if (!params.list('unterabteilungen'))
			{
				abteilungInstance.unterabteilungen = []
			}
            if (!abteilungInstance.hasErrors() && abteilungInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), abteilungInstance.name])}"
                redirect(action: "edit", id: abteilungInstance.id)
            }
            else {
                render(view: "edit", model: [abteilungInstance: abteilungInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def abteilungInstance = Abteilung.get(params.id)
        if (abteilungInstance) {
            try {
                abteilungInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
                redirect(action: "edit", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
            redirect(action: "list")
        }
    }

	def menu =
	{
		def abteilungList = Abteilung.hauptAbteilungen().listOrderByName([cache: true])
		render(view: '/global/menu/abteilung', model:[abteilungInstanceList: abteilungList])
	}

	def removePerson =
	{
		println("params -> $params")

		String id = params.id

		if(id)
		{
			Abteilung abteilung = Abteilung.get(id)

			if(abteilung)
			{
				String personId = params['person.id']

				if(personId)
				{
					Person tmpPerson = Person.get(personId)

					if(tmpPerson)
					{
						abteilung.removeFromPersonen(tmpPerson)
						tmpPerson.removeFromAbteilungen(abteilung)

						Collection funktionenToDelete = tmpPerson.funktionen.findAll
						{
							Funktion tmpFunktion ->

							boolean noOtherDependency = true

							for(Abteilung tmpAbteilung in tmpPerson.abteilungen)
							{
								if (tmpAbteilung.mitarbeiterfunktionen.contains(tmpFunktion))
								{
									noOtherDependency = false
								}
							}

							if(abteilung.mitarbeiterfunktionen.contains(tmpFunktion) && noOtherDependency)
							{
								return true
							}
						}

						for(Funktion tmpFunktion in funktionenToDelete)
						{
							tmpPerson.removeFromFunktionen(tmpFunktion)

							if (tmpPerson.hasErrors() && !tmpPerson.save(flush: true))
							{
								tmpPerson.errors.allErrors.each
								{
									println it
								}
							}
						}

						if (!abteilung.hasErrors() && abteilung.save(flush: true))
						{
							flash.message = "${message(code: 'default.updated.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), abteilung.id])}"
							redirect(action: "edit", id: abteilung.id)
						}
					}
				}
			}
		}

	}

	def removeUnterAbteilung =
	{
		println("params -> $params")

		String id = params.id
		String idToRemove = params["abteilung.id"]

		if(id)
		{
			Abteilung abteilung = Abteilung.get(id)

			if(abteilung)
			{
				Abteilung removeAbteilung = Abteilung.get(idToRemove)

				if (removeAbteilung)
				{
					abteilung.removeFromUnterabteilungen(removeAbteilung)

					if (!abteilung.hasErrors() && abteilung.save(flush: true))
					{
						flash.message = "${message(code: 'default.updated.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), abteilung.id])}"
						redirect(action: "edit", id: abteilung.id)
					}
				}
			}
		}
	}

	def removeSpielplan =
	{
		println("params -> $params")

		String id = params.id

		if(id)
		{
			Abteilung abteilung = Abteilung.get(id)

			if(abteilung)
			{
				String spielplanId = params['spielplan.id']

				if(spielplanId)
				{
					Spielplan tmpSpielplan = Spielplan.get(spielplanId)

					if(tmpSpielplan)
					{
						abteilung.removeFromSpielplaene(tmpSpielplan)

						if (!abteilung.hasErrors() && abteilung.save(flush: true))
						{
							flash.message = "${message(code: 'default.updated.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), abteilung.id])}"
							redirect(action: "edit", id: abteilung.id)
						}
					}
				}
			}
		}

	}

	def aktuelles =
	{
		println("params -> $params")

		def abteilungInstance = Abteilung.get(params.id)
        if (!abteilungInstance)
		{
			abteilungInstance = Abteilung.findByCode(params.code)
		}

        if (!abteilungInstance)
		{
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
            redirect(uri: "/")
        }
        else
		{
			boolean redirectToOldPage = true

			//println abteilungInstance.code
			for(String code in allowedCodes)
			{
				if(code.startsWith(abteilungInstance.code))
				{
					redirectToOldPage = false
				}
			}

			if (redirectToOldPage)
			{
				response.sendRedirect("${request.getContextPath()}/sites/abteilungen/${abteilungInstance.code}.gsp")
				return false
			}
			else
			{
				ArrayList ergebnisse = []
				ArrayList vorschau = []
				ArrayList abteilungBerichte = []

				if(abteilungInstance.hasUnterAbteilungen())
				{
					for(Abteilung unterAbteilung in abteilungInstance.unterabteilungen)
					{
						ergebnisse.addAll(resultService.fetchResultsForAbteilung(unterAbteilung))
						vorschau.addAll(spielplanService.fetchPlayDaysForAbteilung(unterAbteilung))

						/*for(Bericht bericht in unterAbteilung.berichte)
						{
							abteilungBerichte.add(bericht)
						}*/
					}
				}
				else
				{
					ergebnisse.addAll(resultService.fetchResultsForAbteilung(abteilungInstance))
					vorschau.addAll(spielplanService.fetchPlayDaysForAbteilung(abteilungInstance))
					abteilungBerichte.addAll(abteilungInstance.berichte)
				}

				def funktionList = de.webmpuls.cms.people.Funktion.normaleFunktionen().list([cache: true])

			StringBuilder fBuilder = new StringBuilder()
			for (de.webmpuls.cms.people.Funktion funktion: funktionList)
			{
				//if(!abteilungInstance.mitarbeiterfunktionen.contains(funktion))
				//{
					if (fBuilder.length() == 0)
					{
						fBuilder.append("\"${funktion.name}\"")
					}
					else
					{
						fBuilder.append(",\"${funktion.name}\"")
					}
				//}
			}

			def personList = de.webmpuls.cms.people.Person.list([cache: true])

			StringBuilder pBuilder = new StringBuilder()
			for (Person person: personList)
			{
				//if(!abteilungInstance.personen.contains(person))
				//{
					if (pBuilder.length() == 0)
					{
						pBuilder.append("\"${person.vorname} ${person.nachname}\"")
					}
					else
					{
						pBuilder.append(",\"${person.vorname} ${person.nachname}\"")
					}
				//}
			}

				return [abteilungInstance: abteilungInstance, ergebnisse: ergebnisse, vorschau: vorschau, berichte: abteilungBerichte.sort{Bericht a, Bericht b -> a.ueberschrift.toLowerCase() <=> b.ueberschrift.toLowerCase()}, fBuilder: fBuilder.toString(), pBuilder: pBuilder.toString()]
			}
		}
	}

	def abteilungsLeiter =
	{
		def abteilungInstance = Abteilung.get(params.id)
		if (!abteilungInstance)
		{
			abteilungInstance = Abteilung.findByCode(params.code)
		}

		if (!abteilungInstance)
		{
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
			redirect(uri: "/")
		}
		else
		{
			if(abteilungInstance.oberAbteilung)
			{
				abteilungInstance = abteilungInstance.oberAbteilung
			}
			
			Funktion abteilungsLeiterFunktion = abteilungInstance.mitarbeiterfunktionen.find
			{
				Funktion funktion ->

				if (funktion.code == Funktion.ABTEILUNGSLEITER)
				{
					funktion
				}
			}

			Collection abteilungsLeiterCollection = null

			if (abteilungsLeiterFunktion)
			{
				abteilungsLeiterCollection = abteilungInstance.personen.findAll
				{
					Person tmpPerson ->
					abteilungsLeiterFunktion.personen.contains(tmpPerson)
				}
			}

			if (abteilungsLeiterCollection)
			{
				abteilungsLeiterCollection = abteilungsLeiterCollection.sort {a, b -> a.nachname <=> b.nachname}
			}

			return [abteilungInstance: abteilungInstance, abteilungsLeiterCollection: abteilungsLeiterCollection]
		}
	}

	def trainingszeiten =
	{
		def abteilungInstance = Abteilung.get(params.id)
		if (!abteilungInstance)
		{
			abteilungInstance = Abteilung.findByCode(params.code)
		}

		if (!abteilungInstance)
		{
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
			redirect(uri: "/")
		}
		else
		{
			return [abteilungInstance: abteilungInstance, trainingszeiten: abteilungInstance.trainingszeiten.sort{ Trainingszeit a, Trainingszeit b -> a.bezeichnung <=> b.bezeichnung }]
		}
	}

	def spielplan =
	{
		def abteilungInstance = Abteilung.get(params.id)

		if (!abteilungInstance)
		{
			abteilungInstance = Abteilung.findByCode(params.code)
		}

		if(abteilungInstance)
		{
			return [abteilungInstance: abteilungInstance]
		}
		else
		{
			redirect(controller: 'abteilung', action: 'show', id: params.id)
			return false
		}
	}

	def portraits =
	{
		def abteilungInstance = Abteilung.get(params.id)

		if (!abteilungInstance)
		{
			abteilungInstance = Abteilung.findByCode(params.code)
		}

		if(abteilungInstance)
		{
			boolean showPortraits = !abteilungInstance.code.startsWith(AbteilungHelper.CODE_FUSSBALL_JUGEND)

			return [abteilungInstance: abteilungInstance, showPortraits: showPortraits]
		}
		else
		{
			redirect(controller: 'abteilung', action: 'show', id: params.id)
			return false
		}
	}

	def tabelle =
	{
		def abteilungInstance = Abteilung.get(params.id)

		if (!abteilungInstance)
		{
			abteilungInstance = Abteilung.findByCode(params.code)
		}

		if(abteilungInstance)
		{
			boolean showPortraits = !abteilungInstance.code.startsWith(AbteilungHelper.CODE_FUSSBALL_JUGEND)

			return [abteilungInstance: abteilungInstance, showPortraits: showPortraits]
		}
		else
		{
			redirect(controller: 'abteilung', action: 'show', id: params.id)
			return false
		}
	}

	def team =
	{
		def abteilungInstance = Abteilung.get(params.id)

		if (!abteilungInstance)
		{
			abteilungInstance = Abteilung.findByCode(params.code)
		}

		if(abteilungInstance)
		{
			boolean showPortraits = !abteilungInstance.code.startsWith(AbteilungHelper.CODE_FUSSBALL_JUGEND)

			return [abteilungInstance: abteilungInstance, showPortraits: showPortraits]
		}
		else
		{
			redirect(controller: 'abteilung', action: 'show', id: params.id)
			return false
		}
	}

	def jufukids_menu =
	{
		Abteilung abteilung = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M_W)

		if(abteilung && abteilung.hasUnterAbteilungen())
		{
			render(view: '/global/section/menu/fussball_-_jugend_m_w_menu', model: [jufukids: abteilung.unterabteilungen.sort{Abteilung a, Abteilung b -> a.anzeigeName.toLowerCase() <=> b.anzeigeName.toLowerCase()}])
		}
		else
		{
			render ""
		}
	}

	def jufujungs_menu =
	{
		Abteilung abteilung = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M)

		if(abteilung && abteilung.hasUnterAbteilungen())
		{
			render(view: '/global/section/menu/fussball_-_jugend_m_menu', model: [jufujungs: abteilung.unterabteilungen.sort{Abteilung a, Abteilung b -> a.anzeigeName.toLowerCase() <=> b.anzeigeName.toLowerCase()}])
		}
		else
		{
			render ""
		}
	}

	def jufugirls_menu =
	{
		Abteilung abteilung = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_F)

		if(abteilung && abteilung.hasUnterAbteilungen())
		{
			render(view: '/global/section/menu/fussball_-_jugend_f_menu', model: [jufugirls: abteilung.unterabteilungen.sort{Abteilung a, Abteilung b -> a.anzeigeName.toLowerCase() <=> b.anzeigeName.toLowerCase()}])
		}
		else
		{
			render ""
		}
	}

}
