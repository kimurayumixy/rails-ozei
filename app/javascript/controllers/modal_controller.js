import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modalContainer"]
  connect() {
    console.log("Modal controller connected")
    console.log(this.Target)
  }

  // revealMap(){
  //   console.log(this.contentTarget)
  //   this.contentTarget.classList.remove("modal-hide")
  // }

  launchTest() {
    console.log(this.modalContainerTarget)
    this.modalContainerTarget.classList.toggle('modal-hide')
  }
//   open() {
//     console.log("The modal has been opened!");
// }
}
