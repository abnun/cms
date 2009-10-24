package de.webmpuls.cms.people

class FunktionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [funktionInstanceList: Funktion.list(params), funktionInstanceTotal: Funktion.count()]
    }

    def create = {
        def funktionInstance = new Funktion()
        funktionInstance.properties = params
        return [funktionInstance: funktionInstance]
    }

    def save = {
        def funktionInstance = new Funktion(params)
        if (funktionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'funktion.label', default: 'Funktion'), funktionInstance.id])}"
            redirect(action: "show", id: funktionInstance.id)
        }
        else {
            render(view: "create", model: [funktionInstance: funktionInstance])
        }
    }

    def show = {
        def funktionInstance = Funktion.get(params.id)
        if (!funktionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funktion.label', default: 'Funktion'), params.id])}"
            redirect(action: "list")
        }
        else {
            [funktionInstance: funktionInstance]
        }
    }

    def edit = {
        def funktionInstance = Funktion.get(params.id)
        if (!funktionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funktion.label', default: 'Funktion'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [funktionInstance: funktionInstance]
        }
    }

    def update = {
        def funktionInstance = Funktion.get(params.id)
        if (funktionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (funktionInstance.version > version) {
                    
                    funktionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'funktion.label', default: 'Funktion')], "Another user has updated this Funktion while you were editing")
                    render(view: "edit", model: [funktionInstance: funktionInstance])
                    return
                }
            }
            funktionInstance.properties = params
            if (!funktionInstance.hasErrors() && funktionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'funktion.label', default: 'Funktion'), funktionInstance.id])}"
                redirect(action: "show", id: funktionInstance.id)
            }
            else {
                render(view: "edit", model: [funktionInstance: funktionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funktion.label', default: 'Funktion'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def funktionInstance = Funktion.get(params.id)
        if (funktionInstance) {
            try {
                funktionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'funktion.label', default: 'Funktion'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'funktion.label', default: 'Funktion'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funktion.label', default: 'Funktion'), params.id])}"
            redirect(action: "list")
        }
    }
}
