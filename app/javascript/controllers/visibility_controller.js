import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visibility"
export default class extends Controller {
  static targets = ["dropdown"]
  static classes = ["show"]
  connect() { console.log('this is visiblity here, I am connected')
  }

  toggle() {
    this.dropdownTarget.classList.toggle(this.showClass)
  }
}
