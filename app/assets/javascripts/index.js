var noSmoking = noSmoking || {};

(function(ns){

  $(function() {
    $(".venue").hover(
      //handlerIn
      function() {
        var venueId = $(this).data('venue-id');
        var marker = ns.markers.items[venueId];
        ns.markers.selectById(venueId);
        ns.map.panTo(marker.position);
      },
      //handlerOut
      function() {
        var venueId = $(this).data('venue-id');
        ns.markers.deselectById(venueId);
      });

    $('.venue').css( 'cursor', 'pointer' );

    $('.venue').click(function(){
      window.location = $(this).data('details-page');
    });
  });

})(noSmoking);
