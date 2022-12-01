import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-location"
export default class extends Controller {

  connect() {
    console.log('User location controller connected and tracking 👁️')

    navigator.geolocation.getCurrentPosition((position) => {
      localStorage.setItem("lat", position.coords.latitude);
      localStorage.setItem("long", position.coords.longitude);
    });

  }
}
