function initializeSearch() {
  var mapElement = document.getElementById('map-search');

  if(!mapElement) return;

  var mapOptions = {
    center: { lat: 46.7667, lng: 23.5833},
    zoom: 13,
    mapTypeControl: true,
    panControl: true,
    zoomControl: true,
    scaleControl: true,
    streetViewControl: true
  };

  var map = new google.maps.Map(mapElement, mapOptions);

  var marker = new google.maps.Marker({
    map: map
  });

  google.maps.event.addListener(map, 'click', function(event) {
    // put the marker where the map was clicked
    marker.setPosition(event.latLng);

    // set the latitude and longitude
    $('#input-lat').val(event.latLng.lat());
    $('#input-lng').val(event.latLng.lng());
  });

}
google.maps.event.addDomListener(window, 'load', initializeSearch);
