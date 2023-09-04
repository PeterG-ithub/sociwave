import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {
  connect() {
    console.log('like controller is here')
  }

  add() {
    console.log('liked')
  }
}
