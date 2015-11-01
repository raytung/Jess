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

window.initMap = () ->
  latlng =
    lat: -33.884144
    lng: 151.1303203
  map = new google.maps.Map(document.getElementById("map"),
    zoom: 14
    disableDefaultUI: true
    disableDoubleClickZoom: true
    draggable: false
    scrollwheel: false
    center: latlng
  )
  marker = new google.maps.Marker
    position: latlng
    map: map
  map.set 'styles', [
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#444444"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#f2f2f2"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#aa2567"
            },
            {
                "visibility": "on"
            }
        ]
    }
]
