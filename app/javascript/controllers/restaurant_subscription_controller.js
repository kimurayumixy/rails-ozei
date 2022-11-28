import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { ownerId: Number }
  static targets = ["bookings", "notification"]

  connect() {
    console.log(this.bookingsTarget);
    console.log(`Subscribe to the owner with the id ${this.ownerIdValue}.`)
    this.channel = createConsumer().subscriptions.create(
      { channel: "RestaurantChannel", id: this.ownerIdValue },
      { received: data => {
        console.log(data);
        const audio = new Audio(this.notificationTarget.src)
        audio.play();
        if(data.action === "create") {
          this.bookingsTarget.insertAdjacentHTML("beforeend", data.partial)
        } else {
          const card = document.getElementById(`booking-${data.id}`)
          console.log(card);
          console.log(data.partial);
          card.outerHTML = data.partial
        }
      }
    }
    )
  }
  unmute() {
    console.log(this.notificationTarget.muted);
    this.notificationTarget.muted = false;

  }
}
