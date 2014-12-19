(function(){
  var defaultIcon = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|AAAAAA"
  var activeIcon = 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'

  var markers = [];
  var userPlacedMarker;

  var mapOptions = {
    center: { lat: 46.7667, lng: 23.5833},
    zoom: 13,
    mapTypeControl: true,
    panControl: true,
    zoomControl: true,
    scaleControl: true,
    streetViewControl: true
  };


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

    var map = new google.maps.Map(mapElement, mapOptions);

    var marker = new google.maps.Marker({
      map: map
    });


    //The search box
    var input = document.getElementById('venue_name');
    var searchBox = new google.maps.places.SearchBox(input);


    // ==========================================================
    // PLACES CHANGED EVENT LISTENER
    //
    // Listen for the event fired when the user selects an item from the
    // pick list. Retrieve the matching places for that item.
    // ==========================================================
    google.maps.event.addListener(searchBox, 'places_changed', function() {
      var places = searchBox.getPlaces();

      // Don't do anything if nothing is found
      if (places.length == 0) { return; }

      clearAllMarkers();

      // For each place, get the place name and location.
      markers = [];

      var bounds = new google.maps.LatLngBounds();
      for (var i = 0, place; place = places[i]; i++) {
        // Create a marker for each place.
        var marker = new google.maps.Marker({
          map: map,
          icon: defaultIcon,
          title: place.name,
          position: place.geometry.location,
          address: place.formatted_address,
          name: place.name
        });

        markers.push(marker);
        bounds.extend(place.geometry.location);

        // mark the marker as "selected" if it's clicked
        google.maps.event.addListener(marker, "click", function(event) {
          clearUserMarkers();
          selectMarker( this );
        });
      }

      map.fitBounds(bounds);

      // if there's only one result, assume that it is the one the user
      // wanted
      if (places.length == 1) { selectMarker(markers[0]) }
    });

   // Bias the SearchBox results towards places that are within the bounds
   // of the current map's viewport.
    google.maps.event.addListener(map, 'bounds_changed', function() {
      var bounds = map.getBounds();
      searchBox.setBounds(bounds);
    });

    // ==================================================
    // MAP CLICK EVENT LISTENER
    // ==================================================
    google.maps.event.addListener(map, 'click', function(event) {
      // put the marker where the map was clicked
      placeSelectedMarker(event.latLng, map);

      // set the latitude and longitude
      $('#input-lat').val(event.latLng.lat());
      $('#input-lng').val(event.latLng.lng());
    });

  }
  google.maps.event.addDomListener(window, 'load', initializeSearch);


  // Sets the passed place as being the one selected by the user
  function selectMarker( marker ){
    unselectGoogleMarkers();

    fillInputsWithMarkerInformation( marker );

    marker.setIcon( activeIcon )
  }


  function unselectGoogleMarkers(){
    for (var i = 0; i < markers.length; i++) {
      markers[i].setIcon(defaultIcon);
    }
  }


  // Fill the appropriate inputs with the marker's information
  function fillInputsWithMarkerInformation( marker ){
    fillAddress( marker );
    $('#input-lat').val(marker.getPosition().lat()); //latitude
    $('#input-lng').val(marker.getPosition().lng()); //longitute
  }


  function fillAddress( marker ){
    var $description = $("#venue_description");
    var text = $description.val();

    // remove any old address
    text = text.replace( /^[aA]ddress: (.*)$/, "" ); 

    // put in any new address
    if( typeof marker.address != "undefined" ){
      text = text + "Address: " + marker.address;
    }

    $description.val(text);
  }


  function clearUserMarkers() {
    if (typeof userPlacedMarker !== "undefined") {
      userPlacedMarker.setMap(null);
      userPlacedMarker = undefined;
    }
  }


  function clearAllMarkers(){
    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }
  }


  function placeSelectedMarker(position, map) {
    clearUserMarkers();

    userPlacedMarker = new google.maps.Marker({
      position: position,
      map: map
    });

    selectMarker(userPlacedMarker);
  }
})();
