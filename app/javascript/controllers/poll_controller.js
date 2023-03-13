import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="poll"
export default class extends Controller {
  static values = {
    addUrl: String
  }

  readToken() {
    return document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  }

  delete(event) {
    const { currentTarget } = event;
    const href = currentTarget.href;

    event.preventDefault();

    fetch(href, {
      method: 'DELETE',
      headers: {
        "X-CSRF-Token": this.readToken(),
        "Content-Type": "application/json"
      },
    }).then((response) => this.element.classList.add('collapse'));
  }

  toggleBookmark(event) {
    const { currentTarget } = event;
    const href = currentTarget.href;

    event.preventDefault();

    if (currentTarget.querySelector('i').classList.contains('fa-solid')) {
      this.deleteBookmark(currentTarget, href);
    } else {
      this.addBookmark(currentTarget, href);
    }
  }

  deleteBookmark(currentTarget, href) {
    fetch(href, {
      method: 'DELETE',
      headers: {
        "X-CSRF-Token": this.readToken(),
        "Content-Type": "application/json"
      },
    }).then((response) => {
      currentTarget.href = this.addUrlValue;

      const icon = currentTarget.querySelector('i');
      icon.classList.add('fa-regular');
      icon.classList.remove('fa-solid');
      icon.classList.add('bookmark-removed');
      icon.classList.remove('bookmark-added');
    });
  }

  addBookmark(currentTarget, href) {
    fetch(href, {
      method: 'POST',
      headers: {
        "X-CSRF-Token": this.readToken(),
        "Content-Type": "application/json"
      },
    }).then((response) => response.json())
      .then((data) => {
        currentTarget.href = data.url;

        const icon = currentTarget.querySelector('i');
        icon.classList.add('fa-solid');
        icon.classList.remove('fa-regular');
        icon.classList.add('bookmark-added');
        icon.classList.remove('bookmark-removed');
      });
  }
}
