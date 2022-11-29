import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  static targets = ['button']
  connect() {
    }
  changeButton(event) {
      console.log("hello from button clicked");
      this.buttonTarget.innerText = "request sent"
  }
}
