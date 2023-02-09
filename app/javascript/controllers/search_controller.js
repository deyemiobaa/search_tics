import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]
  timer = null
  
  connect() {
    console.log("connected")
    this.timer = null
  }

  submit() {
    clearTimeout(this.timer)
    this.timer = setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 500)
  }

}