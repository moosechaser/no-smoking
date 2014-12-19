var noSmoking = noSmoking || {};
noSmoking.markers = noSmoking.markers || {};

(function(ns){
  ns.items = ns.items || {};

  ns.defaultIcon = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|AAAAAA"
  ns.activeIcon = 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'

  ns.deselectAll = function () {
    for (var i = 0; i < ns.items.length; i++) {
      ns.items[i].setIcon(ns.defaultIcon);
    }
  };

  ns.select = function( marker ){
    ns.deselectAll();

    //set the hidden fields
    $('#input-lat').val(marker.getPosition().lat());
    $('#input-lng').val(marker.getPosition().lng());
    marker.setIcon( activeIcon );
  }

  ns.selectById = function( markerId ){
    var marker = ns.items[markerId];
    ns.select(marker);
  };

})(noSmoking.markers);