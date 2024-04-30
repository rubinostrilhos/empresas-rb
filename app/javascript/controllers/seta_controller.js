import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="seta"
export default class extends Controller {

  static targets = [];

  connect() {
    this.setScrollAmount();

    window.addEventListener('resize', () => {
      this.setScrollAmount();
    });

    this.element.addEventListener('click', (event) => {
      event.preventDefault();
      window.scrollBy({ top: this.scrollAmount, behavior: 'smooth' });
    });
  }

  setScrollAmount() {
    if (window.innerWidth <= 600) {
      if (window.innerWidth > window.innerHeight) {
        this.scrollAmount = 100;
      } else {
        this.scrollAmount = 760;
      }
    } else {
      this.scrollAmount = 910;
    }
  }
}
