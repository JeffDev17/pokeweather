# Pin npm packages by running ./bin/importmap
<<<<<<< HEAD

=======
# config/importmap.rb
pin "@popperjs/core", to: "popper.js"
# Add other pins as needed
>>>>>>> develop
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
