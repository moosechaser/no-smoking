var noSmoking = noSmoking || {};

(function(ns){

  function initialize() {
    var mapElement = document.getElementById('map-canvas');

    if(!mapElement) return;


    var mapOptions = {
      center: { lat: 46.7667, lng: 23.5833},
      zoom: 13,
      mapTypeControl: true,
      mapTypeControlOptions: {
        style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
        position: google.maps.ControlPosition.TOP_RIGHT
      },
      panControl: true,
      panControlOptions: {
        position: google.maps.ControlPosition.RIGHT_CENTER
      },
      zoomControl: true,
      zoomControlOptions: {
        style: google.maps.ZoomControlStyle.LARGE,
        position: google.maps.ControlPosition.RIGHT_CENTER
      },
      scaleControl: true,
      streetViewControl: true,
      streetViewControlOptions: {
        position: google.maps.ControlPosition.RIGHT_BOTTOM
      }
    };


    ns.map = new google.maps.Map(mapElement, mapOptions);

    $.ajax({
      url: "venues.json"
    }).done(function(venues) {
      ns.markers.items = createMarkers(ns.map,venues);
    });
  }

  var createMarkers = function(map,venues){

    var markers = {};

    for(var i = 0;i<venues.length;i++) {
      var venue = venues[i];

      var m = new google.maps.Marker({
        position: new google.maps.LatLng(venue.latitude, venue.longitude),
        map: map,
        icon: ns.markers.defaultIcon,
        title: venue.title
      });

      markers[venue.id] = m;
    }

    return markers;
  };


  google.maps.event.addDomListener(window, 'load', initialize);

})(noSmoking);

