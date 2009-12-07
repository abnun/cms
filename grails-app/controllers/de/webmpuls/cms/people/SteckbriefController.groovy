package de.webmpuls.cms.people

class SteckbriefController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [steckbriefInstanceList: Steckbrief.list(params), steckbriefInstanceTotal: Steckbrief.count()]
    }

    def create = {
        def steckbriefInstance = new Steckbrief()
        steckbriefInstance.properties = params
        return [steckbriefInstance: steckbriefInstance]
    }

    def save = {
        def steckbriefInstance = new Steckbrief(params)
        if (steckbriefInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'steckbrief.label', default: 'Steckbrief'), steckbriefInstance.id])}"
            redirect(action: "show", id: steckbriefInstance.id)
        }
        else {
            render(view: "create", model: [steckbriefInstance: steckbriefInstance])
        }
    }

    def show = {
        def steckbriefInstance = Steckbrief.get(params.id)
        if (!steckbriefInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'steckbrief.label', default: 'Steckbrief'), params.id])}"
            redirect(action: "list")
        }
        else {
            [steckbriefInstance: steckbriefInstance]
        }
    }

    def edit = {
        def steckbriefInstance = Steckbrief.get(params.id)
        if (!steckbriefInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'steckbrief.label', default: 'Steckbrief'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [steckbriefInstance: steckbriefInstance]
        }
    }

    def update = {
        def steckbriefInstance = Steckbrief.get(params.id)
        if (steckbriefInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (steckbriefInstance.version > version) {
                    
                    steckbriefInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'steckbrief.label', default: 'Steckbrief')], "Another user has updated this Steckbrief while you were editing")
                    render(view: "edit", model: [steckbriefInstance: steckbriefInstance])
                    return
                }
            }
            steckbriefInstance.properties = params
            if (!steckbriefInstance.hasErrors() && steckbriefInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'steckbrief.label', default: 'Steckbrief'), steckbriefInstance.id])}"
                redirect(action: "show", id: steckbriefInstance.id)
            }
            else {
                render(view: "edit", model: [steckbriefInstance: steckbriefInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'steckbrief.label', default: 'Steckbrief'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def steckbriefInstance = Steckbrief.get(params.id)
        if (steckbriefInstance) {
            try {
                steckbriefInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'steckbrief.label', default: 'Steckbrief'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'steckbrief.label', default: 'Steckbrief'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'steckbrief.label', default: 'Steckbrief'), params.id])}"
            redirect(action: "list")
        }
    }
}
