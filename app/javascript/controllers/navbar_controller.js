import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["nav"]
  connect() {
    console.log("hello, this is the navbar speaking!")
  }

  /* Open */
openNav() {
  console.log("Clicking span");

  console.log(this.navTarget);
  this.navTarget.style.height = "100%";
  console.log(this.navTarget.style.height)
  // this.navTarget.style.backgroundColor = "black";
}

/* Close */
closeNav() {
  document.getElementById("myNav").style.height = "0%";
}

}
