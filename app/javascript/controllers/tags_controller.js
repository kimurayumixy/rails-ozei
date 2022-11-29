import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tags"
export default class extends Controller {
  static target = ["tags"];
  connect() {

    console.log("Tag controller loaded!")
  }

  toggle() {
    console.log(this.tagsTargets)
  }

}
