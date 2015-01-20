var noSmoking = noSmoking || {};
noSmoking.markers = noSmoking.markers || {};

(function(m){
  m.items = m.items || {};

  m.defaultIcon = "http://maps.google.com/mapfiles/marker.png";
  m.activeIcon = 'http://maps.google.com/mapfiles/marker_white.png';

  m.deselectAll = function () {
    for(var id in m.items){
      if(m.items.hasOwnProperty(id)){
        m.items[id].setIcon(m.defaultIcon);
      }
    }
  };

  m.select = function( marker ){
    marker.setIcon( m.activeIcon );
  };
  m.selectById = function( markerId ){
    var marker = m.items[markerId];
    m.select(marker);
  };

  m.deselect = function( marker ){
    marker.setIcon( m.defaultIcon );
  };
  m.deselectById = function( markerId ){
    var marker = m.items[markerId];
    m.deselect(marker);
  };

  m.showInfoWindow = function( marker, venue ){
    m.infoWindow.setContent(venue.name);
    m.infoWindow.setPosition(marker.position);
    m.infoWindow.open(noSmoking.map, marker);
  }
})(noSmoking.markers);