function initializeShow() {
  var mapElement = document.getElementById('map-show');

  if(!mapElement) return;

  var venueId = $('#venue_id').val();

  if(!venueId) return;

  $.ajax({
    url: ""+venueId+".json"
  }).done(function(venue) {

    var venuePosition = new google.maps.LatLng(venue.latitude, venue.longitude)

    var mapOptions = {
      center: { lat: venuePosition.lat(), lng: venuePosition.lng()},
      zoom: 16,
      mapTypeControl: true,
      panControl: true,
      zoomControl: true,
      scaleControl: true,
      streetViewControl: true
    };

    var map = new google.maps.Map(mapElement, mapOptions);


    var marker = new google.maps.Marker({
      position: venuePosition,
      map: map,
      title: venue.title
    });

  }).error(function(response){
    console.log("error: ",response);
  });
}

google.maps.event.addDomListener(window, 'load', initializeShow);
