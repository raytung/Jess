$(document).ready ->
  Webcam.set(
    width: 1280
    height: 500
    flip_horiz: true
  )
  Webcam.attach('#webcam')
  height = $(window).height()
  width  = $(window).width()
  $('#webcam').css('width', width).css('height', height)
  $('video').css('width', width).css('height', height)
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
