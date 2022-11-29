import { Application } from '@hotwired/stimulus'
import Notification from 'stimulus-notification'

const application = Application.start()
application.register('notification', Notification)

export default class extends Notification {
  connect() {
    super.connect()
    console.log('Do what you want here.')
  }
}
