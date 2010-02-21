package de.webmpuls.cms.start

class TerminController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [terminInstanceList: Termin.list(params), terminInstanceTotal: Termin.count()]
    }

    def create = {
        def terminInstance = new Termin()
        terminInstance.properties = params
        return [terminInstance: terminInstance]
    }

    def save = {
        def terminInstance = new Termin(params)
        if (terminInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'termin.label', default: 'Termin'), terminInstance.id])}"
            redirect(controller: 'inhalt', action: "aktuelles")
        }
        else {
            render(view: "create", model: [terminInstance: terminInstance])
        }
    }

    def show = {
        def terminInstance = Termin.get(params.id)
        if (!terminInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'termin.label', default: 'Termin'), params.id])}"
            redirect(action: "list")
        }
        else {
            [terminInstance: terminInstance]
        }
    }

    def edit = {
        def terminInstance = Termin.get(params.id)
        if (!terminInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'termin.label', default: 'Termin'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [terminInstance: terminInstance]
        }
    }

    def update = {
        def terminInstance = Termin.get(params.id)
        if (terminInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (terminInstance.version > version) {
                    
                    terminInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'termin.label', default: 'Termin')], "Another user has updated this Termin while you were editing")
                    render(view: "edit", model: [terminInstance: terminInstance])
                    return
                }
            }
            terminInstance.properties = params
            if (!terminInstance.hasErrors() && terminInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'termin.label', default: 'Termin'), terminInstance.id])}"
                redirect(controller: 'inhalt', action: "aktuelles")
            }
            else {
                render(view: "edit", model: [terminInstance: terminInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'termin.label', default: 'Termin'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def terminInstance = Termin.get(params.id)
        if (terminInstance) {
            try {
                terminInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'termin.label', default: 'Termin'), params.id])}"
                //redirect(action: "list")
				redirect(controller: 'inhalt', action: "aktuelles")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'termin.label', default: 'Termin'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'termin.label', default: 'Termin'), params.id])}"
            redirect(action: "list")
        }
    }
}
