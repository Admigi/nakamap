import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "display"];

  connect() {
    // Retrieve saved status from localStorage on page load
    const savedStatus = localStorage.getItem("userStatus");
    if (savedStatus) {
      this.buttonTarget.classList.add(savedStatus);
    }
  }

  toggleDisplay() {
    this.displayTarget.classList.toggle("hidden");
  }

  updateStatus(event) {
    const selectedStatus = event.target.value;
    this.buttonTarget.className = "status-button " + selectedStatus;

    // Save the selected status to localStorage
    localStorage.setItem("userStatus", selectedStatus);

    // Hide the display after updating the status
    this.displayTarget.classList.add("hidden");
  }
}