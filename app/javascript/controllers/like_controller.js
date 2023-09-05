import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {
  static values = {
    imagel: String, 
    imageu: String,
    count: Number
  }
  static targets = ["like", "counter"]
  connect() {
    console.log('like controller is here')
  }

  toggle() {
    if(this.likeTarget.classList.contains("liked")) {
      this.likeTarget.setAttribute('src', this.imageuValue)
      this.likeTarget.classList.remove('liked')
      this.likeTarget.classList.add('unliked')
      this.subtractLike()
    } else {
      this.likeTarget.setAttribute('src', this.imagelValue)
      this.likeTarget.classList.add('liked')
      this.likeTarget.classList.remove('unliked')
      this.addLike()
    }
  }

  subtractLike() {
    this.counterTarget.innerText = this.countValue - 1
  }
  addLike() {
    this.counterTarget.innerText = this.countValue + 1
  }
}
