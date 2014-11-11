// prevent enter from submitting the form
$(document).ready(function() {
  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
});

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


  //The search box
  var input = document.getElementById('venue_name');
  var searchBox = new google.maps.places.SearchBox(input);


  // Listen for the event fired when the user selects an item from the
  // pick list. Retrieve the matching places for that item.
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();
    // Don't do anything if nothing is found
    if (places.length == 0) { return; }

    // for (var i = 0, marker; marker = markers[i]; i++) {
    //   marker.setMap(null);
    // }

    // For each place, get the icon, place name, and location.
    markers = [];
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0, place; place = places[i]; i++) {
      var image = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      // Create a marker for each place.
      var marker = new google.maps.Marker({
        map: map,
        title: place.name,
        position: place.geometry.location
      });

      markers.push(marker);

      bounds.extend(place.geometry.location);
    }

    map.fitBounds(bounds);
  });

 // Bias the SearchBox results towards places that are within the bounds
 // of the current map's viewport.
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = map.getBounds();
    searchBox.setBounds(bounds);
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
