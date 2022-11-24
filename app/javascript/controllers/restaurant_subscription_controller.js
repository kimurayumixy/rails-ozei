import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { ownerId: Number }
  static targets = ["bookings"]

  connect() {
    console.log(`Subscribe to the owner with the id ${this.ownerIdValue}.`)
    this.channel = createConsumer().subscriptions.create(
      { channel: "RestaurantChannel", id: this.ownerIdValue },
      { received: data => this.bookingsTarget.insertAdjacentHTML("beforeend", data) }
    )
  }
}
