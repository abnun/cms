package de.webmpuls.cms.start

class AktuellesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [aktuellesInstanceList: Aktuelles.list(params), aktuellesInstanceTotal: Aktuelles.count()]
    }

    def create = {
        def aktuellesInstance = new Aktuelles()
        aktuellesInstance.properties = params
        return [aktuellesInstance: aktuellesInstance]
    }

    def save = {
        def aktuellesInstance = new Aktuelles(params)
        if (aktuellesInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'aktuelles.label', default: 'Aktuelles'), aktuellesInstance.id])}"
            redirect(action: "show", id: aktuellesInstance.id)
        }
        else {
            render(view: "create", model: [aktuellesInstance: aktuellesInstance])
        }
    }

    def show = {
        def aktuellesInstance = Aktuelles.get(params.id)
        if (!aktuellesInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'aktuelles.label', default: 'Aktuelles'), params.id])}"
            redirect(action: "list")
        }
        else {
            [aktuellesInstance: aktuellesInstance]
        }
    }

    def edit = {
        def aktuellesInstance = Aktuelles.get(params.id)
        if (!aktuellesInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'aktuelles.label', default: 'Aktuelles'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [aktuellesInstance: aktuellesInstance]
        }
    }

    def update = {
        def aktuellesInstance = Aktuelles.get(params.id)
        if (aktuellesInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (aktuellesInstance.version > version) {
                    
                    aktuellesInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'aktuelles.label', default: 'Aktuelles')], "Another user has updated this Aktuelles while you were editing")
                    render(view: "edit", model: [aktuellesInstance: aktuellesInstance])
                    return
                }
            }
            aktuellesInstance.properties = params
            if (!aktuellesInstance.hasErrors() && aktuellesInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'aktuelles.label', default: 'Aktuelles'), aktuellesInstance.id])}"
                redirect(action: "show", id: aktuellesInstance.id)
            }
            else {
                render(view: "edit", model: [aktuellesInstance: aktuellesInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'aktuelles.label', default: 'Aktuelles'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def aktuellesInstance = Aktuelles.get(params.id)
        if (aktuellesInstance) {
            try {
                aktuellesInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'aktuelles.label', default: 'Aktuelles'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'aktuelles.label', default: 'Aktuelles'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'aktuelles.label', default: 'Aktuelles'), params.id])}"
            redirect(action: "list")
        }
    }
}
