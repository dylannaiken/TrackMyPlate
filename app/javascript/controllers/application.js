import { Application } from "@hotwired/stimulus"
// import Chart from "chart.js/auto"
// import "controllers/chart_controller"

const application = Application.start()


// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


// document.addEventListener("DOMContentLoaded", function() {
//   let photoTrigger = document.getElementById("photo-trigger");
//   let photoInput = document.getElementById("photo-input");

//   if (photoTrigger && photoInput) {
//     // Ouvre l’appareil photo quand on clique sur le bouton
//     photoTrigger.addEventListener("click", function(event) {
//       event.preventDefault();
//       photoInput.click();
//     });

//     // Gère l’upload de la photo une fois sélectionnée
//     photoInput.addEventListener("change", function(event) {
//       let file = event.target.files[0];
//       if (file) {
//         let formData = new FormData();
//         formData.append("meal[photo]", file);

//         fetch("/meals", {
//           method: "POST",
//           headers: { "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content },
//           body: formData
//         })
//         .then(response => response.json())
//         .then(data => {
//           if (data.url) {
//             console.log("Photo enregistrée ! URL :", data.url);
//             alert("Photo enregistrée !");
//           } else {
//             alert("Échec de l'upload.");
//           }
//         })
//         .catch(error => console.error("Erreur:", error));
//       }
//     });
//   }
// });
