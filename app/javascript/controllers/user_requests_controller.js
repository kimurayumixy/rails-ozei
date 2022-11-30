import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-requests"
export default class extends Controller {
  static targets = ["icon", 'button']
  connect() {
    console.log("Greetings from the user requests controller!")
  }

  iconFunction(){
    const cart = document.getElementById('cart')
    let cartTotal = cart.attr('data-totalitems');
    let newCartTotal = parseInt(cartTotal) + 1;

    cart.addClass('shake').attr('data-totalitems', newCartTotal);
    setTimeout(function(){
      cart.removeClass('shake');
    },500)
  }
}
