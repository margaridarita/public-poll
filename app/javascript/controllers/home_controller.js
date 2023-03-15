import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["video", "button", "controls"];

  diveIn(event) {
    event.preventDefault();

    const url = event.target.href;

    this.videoTarget.addEventListener("ended", () => {
      window.location = url
    }, false);

    this.videoTarget.play();

    this.controlsTarget.classList.add('fade');
  }
}
