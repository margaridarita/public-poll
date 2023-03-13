import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="poll"
export default class extends Controller {
  connect() {
  }

  delete(event) {
    const { currentTarget } = event;
    const href = currentTarget.href;

    event.preventDefault();

    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    fetch(href, {
      method: 'DELETE',
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json"
      },
    }).then((response) => this.element.classList.add('collapse'));
  }
}
