function initialize() {
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
  var map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);
}
google.maps.event.addDomListener(window, 'load', initialize);
