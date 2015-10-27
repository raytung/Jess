$(document).ready ->
  # Webcam.set(
  #   width: 320,
  #   height: 240,
  #   image_format: 'jpeg',
  #   jpeg_quality: 90
  # )
  # Webcam.attach('#camera')
  $("#menu-close").click (e) ->
    e.preventDefault()
    $("#sidebar-wrapper").toggleClass("active")

  $("#menu-toggle").click (e) ->
    e.preventDefault()
    $("#sidebar-wrapper").toggleClass("active")

  $('a[href*=#]:not([href=#])').click ->
    if location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname
      target = $(this.hash)
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']')
      if target.length
        $('html,body').animate(scrollTop: target.offset().top, 1000)
        return false
