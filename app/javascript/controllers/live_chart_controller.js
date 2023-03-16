import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    setTimeout(() => this.refreshChart(), 1000);
    this.interval = setInterval(() => this.refreshChart(), 5000);
  }

  refreshChart() {
    const url = this.element.dataset.url;

    fetch(url, { headers: { "Content-Type": "text/plain" } })
      .then((response) => {
        if (!response.ok) {
          throw new Error('GREAT ERROR');
        }

        return response.text();
      })
      .then((json) => this.element.innerHTML = json)
      .catch((error) => console.log('---'))
  }

  disconnect() {
    clearInterval(this.interval);
  }

  stopUpdates() {
    clearInterval(this.interval);
  }
}
