import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    setTimeout(() => this.refreshChart(), 1500);
    this.interval = setInterval(() => this.refreshChart(), 5000);
  }

  refreshChart() {
    const url = this.element.dataset.url;

    fetch(url, { headers: { "Content-Type": "text/plain" } })
      .then((data) => data.text())
      .then((response) => {
        this.element.innerHTML = response;
    });
  }

  disconnect() {
    clearInterval(this.interval);
  }
}
