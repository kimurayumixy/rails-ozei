import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggler"
export default class extends Controller {
  static targets = [ "input" ]
  connect() {
    console.log("HEY TOGGLER HERE!!!")
  }

  toggle() {
    if (this.inputTarget.checked) {
      const element = document.getElementById("main-content");
      element.classList.remove("gray-scale-all")
    } else {
      const element = document.getElementById("main-content");
      element.classList.add("gray-scale-all")
    }
  }
}
