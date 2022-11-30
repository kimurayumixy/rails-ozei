import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  static targets = ['button']
  connect() {
    }
  changeButton(event) {
      console.log("hello from button clicked");
      this.buttonTarget.innerText = "request sent"
      this.element.classList.add("inactive")

      const cart = document.getElementById('cart')
      let cartTotal = cart.dataset.totalitems;
      console.log(cartTotal)
      let newCartTotal = parseInt(cartTotal) + 1;

      cart.classList.add('shake')
      cart.dataset.totalitems = newCartTotal;
      setTimeout(function(){
        cart.classList.remove('shake');
      },500)
  }
}
