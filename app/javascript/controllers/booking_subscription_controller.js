import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { bookingId: Number, bookingStatus: String }
  static targets = ["bookings", "card"]
  connect() {
    // console.log(this.bookingsTarget);
    this.channel = createConsumer().subscriptions.create(
      { channel: "BookingChannel", id: this.bookingIdValue },
      { received: data => {
        // console.log(this.bookingsTarget);
        console.log(data);
        // console.log(data.json);
        this.bookingsTarget.innerHTML = data.button
        console.log(this.bookingStatusValue);
        if (data.status === "restaurant_rejected") {
          document.getElementById("booking-" + this.bookingIdValue).classList.add("opacity-50")
          document.getElementById("booking-" + this.bookingIdValue).classList.add("order-last")
        }
        else if (data.status === "restaurant_accepted") {
          document.getElementById("booking-" + this.bookingIdValue).classList.add("order-first")
        }
        // this.cardTarget.classList.add("opacity-50")
        }
      }
    )
    // console.log(`Subscribed to the booking with the id ${this.bookingIdValue}.`)
  }
}
