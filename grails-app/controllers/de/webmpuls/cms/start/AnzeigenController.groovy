package de.webmpuls.cms.start

class AnzeigenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [anzeigenInstanceList: Anzeigen.list(params), anzeigenInstanceTotal: Anzeigen.count()]
    }

    def create = {
        def anzeigenInstance = new Anzeigen()
        anzeigenInstance.properties = params
        return [anzeigenInstance: anzeigenInstance]
    }

    def save = {
        def anzeigenInstance = new Anzeigen(params)
        if (anzeigenInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'anzeigen.label', default: 'Anzeige'), anzeigenInstance.ueberschrift1 + anzeigenInstance.ueberschrift2])}"
            redirect(controller: 'inhalt', action: "aktuelles")
        }
        else {
            render(view: "create", model: [anzeigenInstance: anzeigenInstance])
        }
    }

    def show = {
        def anzeigenInstance = Anzeigen.get(params.id)
        if (!anzeigenInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anzeigen.label', default: 'Anzeige'), params.id])}"
            redirect(action: "list")
        }
        else {
            [anzeigenInstance: anzeigenInstance]
        }
    }

    def edit = {
        def anzeigenInstance = Anzeigen.get(params.id)
        if (!anzeigenInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anzeigen.label', default: 'Anzeigen'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [anzeigenInstance: anzeigenInstance]
        }
    }

    def update = {
        def anzeigenInstance = Anzeigen.get(params.id)
        if (anzeigenInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (anzeigenInstance.version > version) {
                    
                    anzeigenInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'anzeigen.label', default: 'Anzeigen')], "Another user has updated this Anzeigen while you were editing")
                    render(view: "edit", model: [anzeigenInstance: anzeigenInstance])
                    return
                }
            }
            anzeigenInstance.properties = params
            if (!anzeigenInstance.hasErrors() && anzeigenInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'anzeigen.label', default: 'Anzeigen'), anzeigenInstance.ueberschrift1 + anzeigenInstance.ueberschrift2])}"
                redirect(controller: 'inhalt', action: "aktuelles")
            }
            else {
                render(view: "edit", model: [anzeigenInstance: anzeigenInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anzeigen.label', default: 'Anzeigen'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def anzeigenInstance = Anzeigen.get(params.id)
        if (anzeigenInstance) {
            try {
                anzeigenInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'anzeigen.label', default: 'Anzeige'), anzeigenInstance.ueberschrift1 + anzeigenInstance.ueberschrift2])}"
                //redirect(action: "list")
				redirect(controller: 'inhalt', action: "aktuelles")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'anzeigen.label', default: 'Anzeige'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anzeigen.label', default: 'Anzeigen'), params.id])}"
            redirect(action: "list")
        }
    }
}
