import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-location"
export default class extends Controller {
  static targets = ['long', 'lat']
  connect() {
    console.log('User location controller connected and tracking 👁️')
    console.log(this.latTarget)
    console.log(this.longTarget)
    this.latTarget.value = localStorage.getItem("lat")
    this.longTarget.value = localStorage.getItem("long")

    navigator.geolocation.getCurrentPosition((position) => {
      localStorage.setItem("lat", position.coords.latitude);
      localStorage.setItem("long", position.coords.longitude);
      this.longTarget.value = position.coords.longitude
      this.latTarget.value = position.coords.latitude
    });

  }
}
