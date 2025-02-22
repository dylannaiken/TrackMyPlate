import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["button"];

    select(event) {
        this.buttonTargets.forEach(button => {
            button.classList.remove("active");
        });
        event.currentTarget.classList.add("active");
    }
}
