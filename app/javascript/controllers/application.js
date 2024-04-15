import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import ModalController from './modal_controller'
Stimulus.register('modal', ModalController)
