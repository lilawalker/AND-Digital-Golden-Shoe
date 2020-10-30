// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.onload = () => {
  const filters = document.querySelectorAll(".filter")

  filters.forEach((element) => {
    element.addEventListener("change", (event) => {
      const urlParams = new URLSearchParams(window.location.search)
      urlParams.set(event.target.name, event.target.value)
      window.location.search = urlParams.toString()
    })
  });
}
