import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import ModalController from './modal_controller'
Stimulus.register('modal', ModalController)

import TypingController from './typing_controller'
Stimulus.register('typing', TypingController)

import SetaController from './seta_controller'
Stimulus.register('seta', SetaController)
