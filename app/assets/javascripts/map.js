// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.

function initialize() {

  var markers = [];

  var places = [{title:'Place 1',
                  description:'Description 1',
                  position: new google.maps.LatLng(46.75625, 23.557906)},
                {title:'Place 2',
                  description:'Description 2',
                  position:new google.maps.LatLng(46.76, 23.56)},
                {title:'Place 3',
                  description:'Description 3',
                  position:new google.maps.LatLng(46.74, 23.54)}];

  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var defaultBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(46.804666, 23.4589),
    new google.maps.LatLng(46.731296, 23.706093));
  map.fitBounds(defaultBounds);

  // Create the search box and link it to the UI element.
  var input = /** @type {HTMLInputElement} */(
    document.getElementById('pac-input'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));

  // Listen for the event fired when the user selects an item from the
  // pick list. Retrieve the matching places for that item.
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

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
        icon: image,
        title: place.name,
        position: place.geometry.location
      });

      markers.push(marker);

      bounds.extend(place.geometry.location);

      alert(place.geometry.location);
    }

    map.fitBounds(bounds);
  });

  var myLatlng = new google.maps.LatLng(46.75625, 23.557906);
  var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    title:"Hello World!"
  });

  //for(place in places){
  //  new google.maps.Marker({
  //    position: place.position,
  //    map: map,
  //    title: place.title
  //  });
  //}

  // Bias the SearchBox results towards places that are within the bounds of the
  // current map's viewport.
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = map.getBounds();
    searchBox.setBounds(bounds);
  });
}

google.maps.event.addDomListener(window, 'load', initialize);