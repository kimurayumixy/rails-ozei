import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["content"]
  connect() {
    console.log("Modal controller connected")
    console.log(this.contentTarget)
  }

  revealMap(){
    console.log(this.contentTarget)
    this.contentTarget.classList.remove("modal-hide")
  }
}
