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
                trainingszeitInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), params.id])}"
                redirect(action: "list")
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
			Abteilung abteilung = Abteilung.get(abteilungId)

			if(abteilung)
			{
				String name = params.name
				String ort = params.ort

				def tag = params.tag
				String uhrzeiten = params.uhrzeiten

				if(tag && uhrzeiten)
				{
					Trainingstag trainingstag = Trainingstag.findByTagAndUhrzeiten(tag, uhrzeiten)

					if(!trainingstag)
					{
						trainingstag = new Trainingstag(tag: tag, uhrzeiten: uhrzeiten)
					}

					if(trainingstag.save())
					{
						Trainingszeit trainingszeit = null // TODO

						if(!trainingszeit)
						{
							trainingszeit = new Trainingszeit()
						}

						if(name)
						{
							trainingszeit.name = name
						}

						if(ort)
						{
							trainingszeit.ort
						}

						trainingszeit.addToTrainingstage(trainingstag)
						if(trainingszeit.save())
						{
							abteilung.addToTrainingszeiten(trainingszeit)
							abteilung.save()
							flash.message = "${message(code: 'default.created.message', args: [message(code: 'trainingszeit.label', default: 'Trainingszeit'), trainingszeit.name])}"
							redirect(controller: 'abteilung', action: 'edit', id: abteilung.id)
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
			else
			{
				flash.error = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), abteilungId])}"
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
}
