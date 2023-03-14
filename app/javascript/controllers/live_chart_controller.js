import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const url = this.element.dataset.url;

    this.interval = setInterval(() => {
      fetch(url, { headers: { "Content-Type": "text/plain" } })
      .then((data) => data.text())
      .then((response) => {
        this.element.innerHTML = response;
      });
    }, 5000);
  }

  disconnect() {
    clearInterval(this.interval);
  }
}
