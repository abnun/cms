package de.webmpuls.cms.section

class TrainingszeitController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [trainingszeitInstanceList: Trainingszeit.list(params), trainingszeitInstanceTotal: Trainingszeit.count()]
    }

    def create = {
        def trainingszeitInstance = new Trainingszeit()
        trainingszeitInstance.properties = params
        return [trainingszeitInstance: trainingszeitInstance]
    }

    def save = {
        def trainingszeitInstance = new Trainingszeit(params)
        if (trainingszeitInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), trainingszeitInstance.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "create", model: [trainingszeitInstance: trainingszeitInstance])
        }
    }

    def show = {
        def trainingszeitInstance = Trainingszeit.get(params.id)
        if (!trainingszeitInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), params.id])}"
            redirect(action: "list")
        }
        else {
            [trainingszeitInstance: trainingszeitInstance]
        }
    }

    def edit = {
        def trainingszeitInstance = Trainingszeit.get(params.id)
        if (!trainingszeitInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [trainingszeitInstance: trainingszeitInstance]
        }
    }

    def update = {
        def trainingszeitInstance = Trainingszeit.get(params.id)
        if (trainingszeitInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (trainingszeitInstance.version > version) {
                    
                    trainingszeitInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'trainingszeit.label', default: 'Trainingszeit')] as Object[], "Another user has updated this Trainingszeit while you were editing")
                    render(view: "edit", model: [trainingszeitInstance: trainingszeitInstance])
                    return
                }
            }
            trainingszeitInstance.properties = params
            if (!trainingszeitInstance.hasErrors() && trainingszeitInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), trainingszeitInstance.id])}"
                redirect(action: "list")
            }
            else {
                render(view: "edit", model: [trainingszeitInstance: trainingszeitInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def trainingszeitInstance = Trainingszeit.get(params.id)
        if (trainingszeitInstance) {
            try {

				Long abteilungId = params.long('abteilung.id')
				Abteilung tmpAbteilung = null
				if(abteilungId)
				{
					tmpAbteilung = Abteilung.get(abteilungId)

					if(tmpAbteilung.trainingszeiten*.id.contains(trainingszeitInstance.id))
					{
						tmpAbteilung.removeFromTrainingszeiten(trainingszeitInstance)
						if (flash.message)
						{
							flash.message += "<br />Trainingszeiten-Zuordnung '${trainingszeitInstance}' von Abteilung '${tmpAbteilung}' entfernt."
						}
						else
						{
							flash.message = "Trainingszeiten-Zuordnung '${trainingszeitInstance}' von Abteilung '${tmpAbteilung}' entfernt."
						}
					}
				}
				else
				{
					def abteilungList = Abteilung.list([cache: true])
					for(Abteilung tmpAbteilung0 in abteilungList)
					{
						if(tmpAbteilung.trainingszeiten*.id.contains(trainingszeitInstance.id))
						{
							tmpAbteilung.removeFromTrainingszeiten(trainingszeitInstance)
							if(flash.message)
							{
								flash.message += "<br />Trainingszeiten-Zuordnung '${trainingszeitInstance}' von Abteilung '${tmpAbteilung}' entfernt."
							}
							else
							{
								flash.message = "Trainingszeiten-Zuordnung '${trainingszeitInstance}' von Abteilung '${tmpAbteilung}' entfernt."
							}
						}
					}
				}

                trainingszeitInstance.delete(flush: true)
				if (flash.message)
				{
					flash.message += "<br />${message(code: 'default.deleted.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), params.id])}"
				}
				else
				{
					flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), params.id])}"
				}
				if(abteilungId)
				{
					redirect(controller: 'abteilung', action: "berichte", params: [code: tmpAbteilung.code])
					return false
				}
				else
				{
					redirect(action: "list")
					return false
				}
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), params.id])}"
            redirect(action: "list")
        }
    }

	def createTrainingszeitFromAbteilung =
	{
		println params

		String abteilungId = params['abteilung.id']

		if(abteilungId)
		{
			try
			{
				Abteilung abteilung = Abteilung.get(abteilungId)

				if(abteilung)
				{
					String bezeichnung = params.bezeichnung
					String ort = params.ort

					def tag = params.tag
					String uhrzeiten = params.von?.trim() + " - " + params.bis?.trim()

					if(tag && uhrzeiten)
					{
						Trainingstag trainingstag = Trainingstag.findByTagAndUhrzeiten(tag, uhrzeiten)

						if(!trainingstag)
						{
							trainingstag = new Trainingstag(tag: tag, uhrzeiten: uhrzeiten, ort: ort)
						}

						Trainingszeit trainingszeit = Trainingszeit.findByBezeichnung(bezeichnung)

						if(!trainingszeit)
						{
							trainingszeit = new Trainingszeit(bezeichnung: bezeichnung)
						}

						if(trainingszeit)
						{

							/*(ort)
							{
								trainingszeit.ort = ort
							}*/

							trainingszeit.addToTrainingstage(trainingstag)
							trainingstag.trainingszeit = trainingszeit
							if(trainingszeit.save())
							{
								abteilung.addToTrainingszeiten(trainingszeit)
								abteilung.save()
								flash.message = "${message(code: 'default.created.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), trainingszeit.bezeichnung])}"
								redirect(controller: 'abteilung', action: 'berichte', params: [code: abteilung.code])
								return false
							}
							else
							{
								flash.error = "${message(code: 'default.save.not.possible', args: [message(code: 'abteilung.label', default: 'Abteilung')])}"
								redirect(controller: 'abteilung', action: 'list')
								return false
							}
						}
						else
						{
							flash.error = "${message(code: 'default.save.not.possible', args: [message(code: 'abteilung.label', default: 'Abteilung')])}"
							redirect(controller: 'abteilung', action: 'list')
							return false
						}
					}
					else
					{
						trainingstag.errors.allErrors.each
						{
							println it
						}

						flash.error = "${message(code: 'default.save.not.possible', args: [message(code: 'trainingstag.label', default: 'Trainingstag')])}"
						redirect(controller: 'abteilung', action: 'list')
						return false
					}
				}
				else
				{
					flash.error = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), abteilungId])}"
					redirect(controller: 'abteilung', action: 'list')
					return false
				}
			}
			catch(Exception e)
			{
				e.printStackTrace()

				flash.error = "${message(code: 'default.save.not.possible', args: [message(code: 'abteilung.label', default: 'Abteilung')])}"
				redirect(controller: 'abteilung', action: 'edit', id: abteilungId)
				return false
			}
		}
		else
		{
			flash.error = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), abteilungId])}"
			redirect(controller: 'abteilung', action: 'list')
			return false
		}
	}

	def removeTrainingstag =
	{
		println("params -> $params")

		String id = params.id

		if(id)
		{
			Trainingszeit trainingszeit = Trainingszeit.get(id)

			if(trainingszeit)
			{
				Long trainingstagId = params.long('trainingstag.id')

				if(trainingstagId)
				{
					Trainingstag tmpTrainingstag = Trainingstag.get(trainingstagId)

					if(tmpTrainingstag)
					{
						trainingszeit.removeFromTrainingstage(tmpTrainingstag)
						tmpTrainingstag.delete()

						if (!trainingszeit.hasErrors() && trainingszeit.save(flush: true))
						{
							flash.message = "${message(code: 'default.updated.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), trainingszeit.id])}"
							redirect(action: "edit", id: trainingszeit.id)
						}
					}
				}
			}
		}

	}

	def createTrainingstagFromTrainingszeit =
	{
		println params

		String trainingszeitId = params['trainingszeit.id']

		if(trainingszeitId)
		{
			Trainingszeit trainingszeit = Trainingszeit.get(trainingszeitId)

			if (trainingszeit)
			{
				def tag = params.tag
				def ort = params.ort
				String uhrzeiten = params.von?.trim() + " - " + params.bis?.trim()

				if (tag && uhrzeiten)
				{
					Trainingstag trainingstag = null//Trainingstag.findByTagAndUhrzeiten(tag, uhrzeiten)

					if (!trainingstag)
					{
						trainingstag = new Trainingstag(tag: tag, uhrzeiten: uhrzeiten, ort: ort, trainingszeit: trainingszeit)
					}

					if (trainingstag.save())
					{
						trainingszeit.addToTrainingstage(trainingstag)
						if (trainingszeit.save())
						{
							flash.message = "${message(code: 'default.created.message', args: [message(code: 'trainingstag.label', default: 'Trainingstag'), trainingstag.toString()])}"
							redirect(controller: 'trainingszeit', action: 'edit', id: trainingszeit.id)
							return false
						}
						else
						{
							flash.error = "${message(code: 'default.save.not.possible', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit')])}"
							redirect(controller: 'abteilung', action: 'list')
							return false
						}
					}
				}
			}
			else
			{
				flash.error = "${message(code: 'default.not.found.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), trainingszeitId])}"
				redirect(controller: 'abteilung', action: 'list')
				return false
			}
		}
	}
}
