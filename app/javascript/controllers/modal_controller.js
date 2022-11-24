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

  toggleMap() {
    console.log(this.modalContainerTarget)
    this.modalContainerTarget.classList.toggle('modal-hide')
  }

  // toggleButton(){
  //   console.log(modalContainerTarget.classList)
  // }

  changeButton(){
    this.element.innerHTML = '<span class="map-text">Show List</span><i class="fa-solid fa-list"></i>'
  }
}
