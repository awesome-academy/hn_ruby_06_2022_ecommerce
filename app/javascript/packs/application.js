// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require bootstrap
//= require Chart.bundle
//= require chartkick

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("jquery")
require("packs/home")
require("packs/update_cart")
require("packs/plugin_message")
import "bootstrap"
import "chartkick/chart.js"
import "./custom"
