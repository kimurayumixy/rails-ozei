import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { bookingId: Number }
  static targets = ["bookings"]
  connect() {
    console.log(this.bookingsTarget);
    this.channel = createConsumer().subscriptions.create(
      { channel: "BookingChannel", id: this.bookingIdValue },
      { received: data => {
        console.log(this.bookingsTarget);
        console.log(data);
        this.bookingsTarget.innerHTML = data
        }
      }
    )
    console.log(`Subscribed to the booking with the id ${this.bookingIdValue}.`)
  }
}
