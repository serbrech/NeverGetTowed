app.controllers.map = new Ext.Controller({
    loaded: function(options) {
        for(var i = 0; i < options.records.length; i++){
            var marker = new google.maps.Marker({
                 position: new google.maps.LatLng(options.records[i].get('lat'), options.records[i].get('lng')),
                 map: app.views.mapview.getComponent('mapview').map
            });
        }
        // need to rerender/refresh the map here
    },

    map_rendered: function(options) {
        console.log("map rendered");
    }

});