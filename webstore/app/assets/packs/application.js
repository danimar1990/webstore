// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("@popperjs/core")
require('jquery')
//= require_tree .
//= require jquery_ujs
//= require jquery-ui/widgets/autocomplete
//= require autocomplete-rails
require("../stylesheets/application.scss")
require("bootstrap")
require("datatables.net-bs5")

$(document).on('turbolinks:load', () => {
  $('#datatable').DataTable();
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
