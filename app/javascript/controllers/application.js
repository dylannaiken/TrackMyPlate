import { Application } from "@hotwired/stimulus"
import NavigationController from "./navigation_controller";

const application = Application.start();
application.register("navigation", NavigationController);

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
