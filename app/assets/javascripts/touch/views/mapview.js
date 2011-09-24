NGT.views.mapview = Ext.extend(Ext.Panel, {
	fullscreen:true,
    layout: 'fit',
    items: [{
        xtype: 'map',
        id: 'parkmap',
        mapOptions : {
            //center : new google.maps.LatLng(50.077721, 14.448585),
            zoom : 8,
            geoLocation:true,
            mapTypeId : google.maps.MapTypeId.ROADMAP,
            navigationControl: true,
            navigationControlOptions: {
                style: google.maps.NavigationControlStyle.DEFAULT
            },
            geo:new Ext.util.GeoLocation({
      			autoUpdate:false,
      			timeout:2000,
      			listeners:{
		        	locationupdate: function(geo) {
		        		alert('lat:'+geo.latitude+' long:'+get.longitude);
			          	var center = new google.maps.LatLng(geo.latitude, geo.longitude);
			          	if (map.rendered)
			            	map.update(center);
			          	else
			            	map.on('activate', map.onUpdate, map, {single: true, data: center});
		        	},
		        	locationerror: function(geo){
		          		alert('got geo error');          
		        	}
      			}
    		})
        }
    }],
    dockedItems:[]
});

Ext.reg('mapview', NGT.views.mapview);