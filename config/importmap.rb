# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "chart.js" # @4.4.2
pin "chartkick", to: "https://cdn.jsdelivr.net/npm/chartkick@4.1.3/chartkick.js"
pin "moment", to: "https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.js"
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.2
