package de.webmpuls.cms.result

class TabelleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
		def tabelleInstanceListCriteria = Tabelle.createCriteria()
		def tabelleInstanceList = tabelleInstanceListCriteria.list
		{
			order('spieldatum', 'asc')
			order('anstoss', 'asc') 
		}
        [tabelleInstanceList: tabelleInstanceList, tabelleInstanceTotal: Tabelle.count()]
//        [tabelleInstanceList: Tabelle.list(params), tabelleInstanceTotal: Tabelle.count()]
    }

    def create = {
        def tabelleInstance = new Tabelle()
        tabelleInstance.properties = params
        return [tabelleInstance: tabelleInstance]
    }

    def save = {
        def tabelleInstance = new Tabelle(params)
        if (tabelleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'tabelle.label', default: 'Tabelle'), tabelleInstance.id])}"
            redirect(action: "show", id: tabelleInstance.id)
        }
        else {
            render(view: "create", model: [tabelleInstance: tabelleInstance])
        }
    }

    def show = {
        def tabelleInstance = Tabelle.get(params.id)
        if (!tabelleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tabelle.label', default: 'Tabelle'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tabelleInstance: tabelleInstance]
        }
    }

    def edit = {
        def tabelleInstance = Tabelle.get(params.id)
        if (!tabelleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tabelle.label', default: 'Tabelle'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tabelleInstance: tabelleInstance]
        }
    }

    def update = {
        def tabelleInstance = Tabelle.get(params.id)
        if (tabelleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tabelleInstance.version > version) {
                    
                    tabelleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tabelle.label', default: 'Tabelle')], "Another user has updated this Tabelle while you were editing")
                    render(view: "edit", model: [tabelleInstance: tabelleInstance])
                    return
                }
            }
            tabelleInstance.properties = params
            if (!tabelleInstance.hasErrors() && tabelleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tabelle.label', default: 'Tabelle'), tabelleInstance.id])}"
                redirect(action: "show", id: tabelleInstance.id)
            }
            else {
                render(view: "edit", model: [tabelleInstance: tabelleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tabelle.label', default: 'Tabelle'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def tabelleInstance = Tabelle.get(params.id)
        if (tabelleInstance) {
            try {
                tabelleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'tabelle.label', default: 'Tabelle'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tabelle.label', default: 'Tabelle'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tabelle.label', default: 'Tabelle'), params.id])}"
            redirect(action: "list")
        }
    }
}
