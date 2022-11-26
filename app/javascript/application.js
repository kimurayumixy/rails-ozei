// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

////////////////////////////////////
// MAP MODAL FUNCTIONALITY //

// notification
import { Application } from '@hotwired/stimulus'
import Notification from 'stimulus-notification'

const application = Application.start()
application.register('notification', Notification)
