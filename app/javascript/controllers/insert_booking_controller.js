import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-booking"
export default class extends Controller {
  static targets = ["cards", "form"]
  connect() {
    console.log("I'm connected")
  }

  appendBooking(){
    console.log('This works')
  }
}
