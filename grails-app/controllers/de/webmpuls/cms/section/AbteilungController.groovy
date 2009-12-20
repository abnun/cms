package de.webmpuls.cms.section

class AbteilungController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), abteilungInstance.id])}"
            redirect(action: "show", id: abteilungInstance.id)
        }
        else {
            render(view: "create", model: [abteilungInstance: abteilungInstance])
        }
    }

    def show = {
        def abteilungInstance = Abteilung.get(params.id)
        if (!abteilungInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
            redirect(action: "list")
        }
        else {
            [abteilungInstance: abteilungInstance]
        }
    }

    def edit = {
        def abteilungInstance = Abteilung.get(params.id)
        if (!abteilungInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [abteilungInstance: abteilungInstance]
        }
    }

    def update = {
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
            abteilungInstance.properties = params
            if (!abteilungInstance.hasErrors() && abteilungInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), abteilungInstance.id])}"
                redirect(action: "show", id: abteilungInstance.id)
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
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'abteilung.label', default: 'Abteilung'), params.id])}"
            redirect(action: "list")
        }
    }

	def start =
	{
		String name = params.name
		if(name)
		{
			Abteilung abteilung = Abteilung.findByName(name)
			if(abteilung)
			{
//				return[abteilung: abteilung]
				render("${abteilung.name} - ${abteilung.code}")
			}
			re
		}
	}
}
