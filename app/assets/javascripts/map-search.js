function initializeSearch() {
  var mapOptions = {
    center: { lat: 46.7667, lng: 23.5833},
    zoom: 13,
    mapTypeControl: true,
    panControl: true,
    zoomControl: true,
    scaleControl: true,
    streetViewControl: true
  };

  var map = new google.maps.Map(document.getElementById('map-search'),
    mapOptions);

  var marker = new google.maps.Marker({
    map: map
  });

  google.maps.event.addListener(map, 'click', function(event) {
    // put the marker where the map was clicked
    marker.setPosition(event.latLng);

    // set the latitude and longitude
    $('#chosen-coordinates').html("Lat: "+event.latLng.lat()+" Lng:"+event.latLng.lng());
  });

}
google.maps.event.addDomListener(window, 'load', initializeSearch);
