# Pin npm packages by running ./bin/importmap
pin "application", preload: true
pin "turbo", to: "turbo.min.js", preload: true
# Ajouter ici d'autres pins si nécessaire
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "chartkick", to: "chartkick.js"
pin "chart.js", to: "https://cdn.jsdelivr.net/npm/chart.js"

