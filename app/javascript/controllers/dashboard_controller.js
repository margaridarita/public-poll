import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {

  static targets = ["created", "voted", "saved", "createdBtn", "savedBtn", "votedBtn"]

  showCreated() {
    this.createdTarget.classList.remove("d-none")
    this.votedTarget.classList.add("d-none")
    this.savedTarget.classList.add("d-none")

    this.createdBtnTarget.classList.add("active")
    this.votedBtnTarget.classList.remove("active")
    this.savedBtnTarget.classList.remove("active")
  }

  showVoted() {
    this.createdTarget.classList.add("d-none")
    this.votedTarget.classList.remove("d-none")
    this.savedTarget.classList.add("d-none")

    this.createdBtnTarget.classList.remove("active")
    this.votedBtnTarget.classList.add("active")
    this.savedBtnTarget.classList.remove("active")
  }

  showSaved() {
    this.createdTarget.classList.add("d-none")
    this.votedTarget.classList.add("d-none")
    this.savedTarget.classList.remove("d-none")

    this.createdBtnTarget.classList.remove("active")
    this.votedBtnTarget.classList.remove("active")
    this.savedBtnTarget.classList.add("active")
  }
}
