import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { bookingId: Number }
  static targets = ["bookings", "card"]
  connect() {
    // console.log(this.bookingsTarget);
    this.channel = createConsumer().subscriptions.create(
      { channel: "BookingChannel", id: this.bookingIdValue },
      { received: data => {
        // console.log(this.bookingsTarget);
        console.log(data.status);
        this.bookingsTarget.innerHTML = data
        console.log(this.bookingStatus);
        if (this.bookingStatus === "restaurant_rejected") {
          document.getElementById("booking-" + this.bookingIdValue).classList.add("opacity-50")
        } else {
          document.getElementById("booking-" + this.bookingIdValue).classList.remove("opacity-50")
        }

        // this.cardTarget.classList.add("opacity-50")
        }
      }
    )
    // console.log(`Subscribed to the booking with the id ${this.bookingIdValue}.`)
  }
}
