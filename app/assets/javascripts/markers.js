var noSmoking = noSmoking || {};
noSmoking.markers = noSmoking.markers || {};

(function(ns){
  ns.items = ns.items || {};

  ns.defaultIcon = "http://maps.google.com/mapfiles/marker.png";
  ns.activeIcon = 'http://maps.google.com/mapfiles/marker_white.png';

  ns.deselectAll = function () {
    for(var id in ns.items){
      if(ns.items.hasOwnProperty(id)){
        ns.items[id].setIcon(ns.defaultIcon);
      }
    }
  };

  ns.select = function( marker ){
    marker.setIcon( ns.activeIcon );
  };
  ns.selectById = function( markerId ){
    var marker = ns.items[markerId];
    ns.select(marker);
  };

  ns.deselect = function( marker ){
    marker.setIcon( ns.defaultIcon );
  };
  ns.deselectById = function( markerId ){
    var marker = ns.items[markerId];
    ns.deselect(marker);
  };

})(noSmoking.markers);