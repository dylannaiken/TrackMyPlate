import { Application } from "@hotwired/stimulus"
// import Chart from "chart.js/auto"
// import "controllers/chart_controller"

const application = Application.start()


// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


//SLIDER
let currentSlide = 0;
const slides = document.querySelectorAll('.slide');
const totalSlides = slides.length;

document.querySelector('.next-btn').addEventListener('click', () => {
    if (currentSlide < totalSlides - 1) {
        currentSlide++;
    } else {
        currentSlide = 0;
    }
    updateSlider();
});

document.querySelector('.prev-btn').addEventListener('click', () => {
    if (currentSlide > 0) {
        currentSlide--;
    } else {
        currentSlide = totalSlides - 1;
    }
    updateSlider();
});

function updateSlider() {
    const slider = document.querySelector('.slider');
    slider.style.transform = `translateX(-${currentSlide * 33.333333333333333333}%)`;
}




//IDEA BUTTON
document.addEventListener('DOMContentLoaded', function() {
  const ideaButton = document.querySelector('.idea-icon');
  const modal = document.getElementById('ideaPopup');
  const closeButton = document.querySelector('.btn-close');

  ideaButton.addEventListener('click', function(e) {
    e.preventDefault();
    modal.style.display = 'block';
  });

  closeButton.addEventListener('click', function() {
    modal.style.display = 'none';
  });

  window.addEventListener('click', function(event) {
    if (event.target == modal) {
      modal.style.display = 'none';
    }
  });
});

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
