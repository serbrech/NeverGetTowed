NGT.views.mapview = Ext.extend(Ext.Panel, {
	fullscreen:true,
    layout: 'fit',
    items: [{
        xtype: 'map',
        id: 'parkmap',
        useCurrentLocation: true,
        mapOptions : {
            zoom : 15,
            useCurrentLocation: true,
            mapTypeId : google.maps.MapTypeId.ROADMAP,
            navigationControl: true,
            navigationControlOptions: {
                style: google.maps.NavigationControlStyle.DEFAULT
            },
        },
        listeners:{
	    	maprender : function(comp, map){
	    		
	    	},
	    	centerchange:function(senchaMap,googleMap,center){
	    		var marker = new google.maps.Marker({
		    		map : googleMap,
		        	position: center,
		        	title : "My car"
	    		});
	    	}
    	},
    	addmarker: function(position, info) {
    		var marker = new google.maps.Marker({
		        position: position,
		        title : info
	    	});
	    	marker.setMap(this.map);
    	}
    }],
    dockedItems:[
    	{xtype:'toolbarview', dock:'bottom'}
    ],
    initComponent: function() {
        NGT.views.mapview.superclass.initComponent.apply(this, arguments);

    },
    
});

Ext.reg('mapview', NGT.views.mapview);