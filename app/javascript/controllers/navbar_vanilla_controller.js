import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-vanilla"
export default class extends Controller {
  connect() {

    console.log("Navbar connected")
  }

  updateNavbar() {
    document.querySelector(".navbar-vanilla-profile img")
  .addEventListener("click", (event) => {
    document.querySelector(".navbar-vanilla-profile").classList.toggle("active");
  })
  }
}
