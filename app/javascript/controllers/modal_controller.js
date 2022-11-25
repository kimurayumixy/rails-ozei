import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modalContainer", "text"]
  connect() {

  }


  toggleMap() {
    // console.log(this.textTarget)
    if (this.textTarget.innerText == 'Show Map') {
      this.textTarget.innerText = 'Hide Map'
    } else {
      this.textTarget.innerText = 'Show Map'
    }
    this.modalContainerTarget.classList.toggle('modal-hide')
  }

}
