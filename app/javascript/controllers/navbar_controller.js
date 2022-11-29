import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["nav"]
  connect() {
    console.log("hello, this is the navbar speaking!")
  }

  /* Open */
openNav() {
  this.navTarget.style.height = "100%";
}

/* Close */
closeNav() {
  document.getElementById("myNav").style.height = "0%";
}

}
