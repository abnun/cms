package de.webmpuls.cms.section

class TrainingstagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [trainingstagInstanceList: Trainingstag.list(params), trainingstagInstanceTotal: Trainingstag.count()]
    }

    def create = {
        def trainingstagInstance = new Trainingstag()
        trainingstagInstance.properties = params
        return [trainingstagInstance: trainingstagInstance]
    }

    def save = {
        def trainingstagInstance = new Trainingstag(params)
        if (trainingstagInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'trainingstag.label', default: 'Trainingstag'), trainingstagInstance.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "create", model: [trainingstagInstance: trainingstagInstance])
        }
    }

    def show = {
        def trainingstagInstance = Trainingstag.get(params.id)
        if (!trainingstagInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trainingstag.label', default: 'Trainingstag'), params.id])}"
            redirect(action: "list")
        }
        else {
            [trainingstagInstance: trainingstagInstance]
        }
    }

    def edit = {
        def trainingstagInstance = Trainingstag.get(params.id)
        if (!trainingstagInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trainingstag.label', default: 'Trainingstag'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [trainingstagInstance: trainingstagInstance]
        }
    }

    def update = {
        def trainingstagInstance = Trainingstag.get(params.id)
        if (trainingstagInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (trainingstagInstance.version > version) {
                    
                    trainingstagInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'trainingstag.label', default: 'Trainingstag')] as Object[], "Another user has updated this Trainingstag while you were editing")
                    render(view: "edit", model: [trainingstagInstance: trainingstagInstance])
                    return
                }
            }
            trainingstagInstance.properties = params
            if (!trainingstagInstance.hasErrors() && trainingstagInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'trainingstag.label', default: 'Trainingstag'), trainingstagInstance.id])}"
                redirect(action: "list")
            }
            else {
                render(view: "edit", model: [trainingstagInstance: trainingstagInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trainingstag.label', default: 'Trainingstag'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def trainingstagInstance = Trainingstag.get(params.id)
        if (trainingstagInstance) {
            try {
                trainingstagInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'trainingstag.label', default: 'Trainingstag'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'trainingstag.label', default: 'Trainingstag'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trainingstag.label', default: 'Trainingstag'), params.id])}"
            redirect(action: "list")
        }
    }
}
