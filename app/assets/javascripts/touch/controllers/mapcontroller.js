NGT.controllers.mapcontroller = Ext.regController("map", {
    loaded: function(options) {
        // need to rerender/refresh the map here
    },
    mark:function(options){
        var marker = new google.maps.Marker({
            map : options.data.gmap,
            position: options.data.loc,
            draggable: true,
            title : "My car",
            icon:'/assets/car-pin.png'
        });
        NGT.views.mapview.currentMarker = marker;
    },
    index: function(options) {
        alert("park");
    },

});