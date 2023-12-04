import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["timer"];

  connect() {
    this.secondsRemaining = this.timerTarget.dataset.timeLimit;
    this.startTimer();
  }

  startTimer() {
    this.timerInterval = setInterval(() => {
      this.secondsRemaining--;

      if (this.secondsRemaining <= 0) {
        clearInterval(this.timerInterval);
        // auto-submit the form when timer 0
        this.element.submit();
      }

      this.updateTimerDisplay();
    }, 1000);
  }

  updateTimerDisplay() {
    const minutes = Math.floor(this.secondsRemaining / 60);
    const seconds = this.secondsRemaining % 60;
    this.timerTarget.textContent = `${minutes}:${seconds < 10 ? "0" : ""}${seconds}`;
  }
}