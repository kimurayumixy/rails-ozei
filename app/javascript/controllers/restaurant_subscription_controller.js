import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { ownerId: Number }
  static targets = ["bookings", "notification"]

  connect() {
    console.log(this.bookingsTargets);
    console.log(`Subscribe to the owner with the id ${this.ownerIdValue}.`)
    this.channel = createConsumer().subscriptions.create(
      { channel: "RestaurantChannel", id: this.ownerIdValue },
      { received: data => {
        // console.log(data);
        const audio = new Audio(this.notificationTarget.src)
        audio.play();
        if(data.action === "create") {
          this.bookingsTarget.insertAdjacentHTML("beforeend", data.partial)
        } else {
          console.log(data.partials);
          this.bookingsTargets.forEach((tab, index) => {
            tab.innerHTML = data.partials[index]
          });
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
