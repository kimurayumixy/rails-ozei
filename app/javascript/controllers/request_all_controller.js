import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="request-all"
export default class extends Controller {
  static targets = ['form']


  connect() {
    console.log("Request all");
    console.log(this.formTargets);

  }

  submitAll(event) {
    this.formTargets.forEach((form) => {
      fetch(form.action, {
        method: "post",
        body: new FormData(form)
      }).then((response) => {
        console.log(response);
      })
    })

    window.location.href= "/bookings"
  }
}
