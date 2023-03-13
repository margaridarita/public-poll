import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user"
export default class extends Controller {
  static targets = ["created", "voted", "createdBtn", "votedBtn"]

  showCreated() {
    this.createdTarget.classList.remove("d-none")
    this.votedTarget.classList.add("d-none")

    this.createdBtnTarget.classList.add("active")
    this.votedBtnTarget.classList.remove("active")
  }

  showVoted() {
    this.createdTarget.classList.add("d-none")
    this.votedTarget.classList.remove("d-none")

    this.createdBtnTarget.classList.remove("active")
    this.votedBtnTarget.classList.add("active")
  }
}
