package de.webmpuls.cms.section

class BerichtController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [berichtInstanceList: Bericht.list(params), berichtInstanceTotal: Bericht.count()]
    }

    def create = {
        def berichtInstance = new Bericht()
        berichtInstance.properties = params
        return [berichtInstance: berichtInstance, params: params]
    }

    def save = {
        def berichtInstance = new Bericht(params)
		if (params.abteilungId)
		{
			Abteilung tmpAbteilung = Abteilung.get(params.abteilungId)
			if (tmpAbteilung)
			{
				berichtInstance.abteilung = tmpAbteilung
				tmpAbteilung.addToBerichte(berichtInstance)
				tmpAbteilung.save()

				flash.message = "${message(code: 'default.created.message', args: [message(code: 'bericht.label', default: 'Bericht'), berichtInstance?.ueberschrift ?: berichtInstance?.abteilung?.name])}"
				redirect(controller: 'abteilung', action: "show", id: tmpAbteilung.id)
				return false
			}
		}
		else if (berichtInstance.save(flush: true))
		{
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'bericht.label', default: 'Bericht'), berichtInstance?.ueberschrift ?: berichtInstance?.abteilung?.name])}"

			redirect(action: "list")
			return false
		}
        else {
            render(view: "create", model: [berichtInstance: berichtInstance])
        }
    }

    def show = {
        def berichtInstance = Bericht.get(params.id)
        if (!berichtInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bericht.label', default: 'Bericht'), params.id])}"
            redirect(action: "list")
        }
        else {
            [berichtInstance: berichtInstance]
        }
    }

    def edit = {
        def berichtInstance = Bericht.get(params.id)
        if (!berichtInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bericht.label', default: 'Bericht'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [berichtInstance: berichtInstance]
        }
    }

    def update = {
        def berichtInstance = Bericht.get(params.id)
        if (berichtInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (berichtInstance.version > version) {
                    
                    berichtInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bericht.label', default: 'Bericht')] as Object[], "Another user has updated this Bericht while you were editing")
                    render(view: "edit", model: [berichtInstance: berichtInstance])
                    return
                }
            }
            berichtInstance.properties = params
			if (params.abteilungId)
			{
				Abteilung tmpAbteilung = Abteilung.get(params.abteilungId)
				if (tmpAbteilung)
				{
					berichtInstance.abteilung = tmpAbteilung
					tmpAbteilung.addToBerichte(berichtInstance)
					tmpAbteilung.save()

					flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bericht.label', default: 'Bericht'), berichtInstance?.ueberschrift ?: berichtInstance?.abteilung?.name])}"
					redirect(controller: 'abteilung', action: "show", id: tmpAbteilung.id)
					return false
				}
			}
            else if (!berichtInstance.hasErrors() && berichtInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bericht.label', default: 'Bericht'), berichtInstance?.ueberschrift ?: berichtInstance?.abteilung?.name])}"

				redirect(action: "list")
				return false
            }
            else {
                render(view: "edit", model: [berichtInstance: berichtInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bericht.label', default: 'Bericht'), params.id])}"
            redirect(action: "list")
			return false
        }
    }

    def delete = {
        def berichtInstance = Bericht.get(params.id)
        if (berichtInstance) {
            try {
                berichtInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bericht.label', default: 'Bericht'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bericht.label', default: 'Bericht'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bericht.label', default: 'Bericht'), params.id])}"
            redirect(action: "list")
        }
    }
}
