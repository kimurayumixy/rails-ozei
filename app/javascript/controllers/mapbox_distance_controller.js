import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mapbox-distance"
export default class extends Controller {
  static values = { lat: Number, long: Number}
  static targets = ["time", 'distance']

    connect() {

    console.log('Connected to the distance controller 🏃💨')
    // for user
    const userLat = localStorage.getItem("lat");
    const userLong = localStorage.getItem("long");
    // for restaurant
    const restaurantLat = this.latValue
    const restaurantLong = this.longValue
    const url = `https://api.mapbox.com/directions/v5/mapbox/walking/${userLong},${userLat};${restaurantLong},${restaurantLat}?access_token=pk.eyJ1IjoidGhpY2NyYW5nZXIiLCJhIjoiY2xhcnUzNDJxMWdsaTNwbnZiYXFlcDVqeiJ9.uzukqCHrR4n-WAQJV_7hbA`
    console.log(url)           //api for the get request
    fetch(url)
    .then(response => response.json())
    // .then(data => console.log(data.routes[0].duration))
    .then(data => this.distanceTarget.innerHTML = `${Math.round(data.routes[0].distance / 1000)} km away`)
    .then(data => this.timeTarget.innerHTML = `${Math.round(data.routes[0].duration / 60 )} min. away` )
  }





}
