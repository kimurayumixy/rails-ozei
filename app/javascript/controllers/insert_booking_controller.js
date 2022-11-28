import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-booking"
export default class extends Controller {
  static targets = ["cards", "form", "list"]
  connect() {
    console.log("I'm connected")
  }

  appendBooking(event){
    event.preventDefault()
    console.log('This works')
    fetch(this.cardsTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.cardsTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.listTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
        console.log(data)
      })
  }
}
