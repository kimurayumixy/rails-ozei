import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["map", "modalContainer", "text"]
  connect() {
    console.log('Hello from the map modal controller')
  }

  // toggleMap() {
  //   // console.log(this.textTarget)
  //   if (this.textTarget.innerText == 'Show Map') {
  //     this.textTarget.innerText = 'Hide Map'
  //   } else {
  //     this.textTarget.innerText = 'Show Map'
  //   }
  //   this.modalContainerTarget.classList.toggle('modal-hide')
  // }

  openMap(e) {
    console.log(e)
    this.mapTarget.style.height = "100%";
  }

  /* Close */
  closeMap(e) {
    console.log(e)
    document.getElementById("closemap").style.height = "0%";
  }
}
