import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    goToIngredients() {
        console.log("Navigating to Add Ingredient Page");
        window.location.href = "/add_ingredient";
    }
}
