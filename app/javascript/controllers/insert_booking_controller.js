import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-booking"
export default class extends Controller {
  static targets = ["cards", "form",]
  connect() {
    console.log("I'm connected")
  }

  appendBooking(event){
    event.preventDefault()
    console.log('This works')

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.inserted_item) {
          const bookings = document.getElementById('bookings-modal')
          bookings.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        // this.formTarget.outerHTML = data.form
      })

  }
}
