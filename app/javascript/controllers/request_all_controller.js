import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="request-all"
export default class extends Controller {
  static targets = ['form']


  connect() {
    console.log("Request all");
    console.log(this.formTargets);

  }

  submitAll(event) {
    const promises = []
    this.formTargets.forEach((form) => {
      promises.push(fetch(form.action, {
        method: "post",
        body: new FormData(form)
      }))
    })

    Promise.all(promises).then((response) =>{
      window.location.href = '/bookings'
      console.log('redirect');
    })
    // window.location.href= "/bookings"
  }
}
