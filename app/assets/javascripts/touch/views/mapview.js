NGT.views.mapview = Ext.extend(Ext.Panel, {
	fullscreen:true,
    layout: 'fit',
    items: [{
        xtype: 'map',
        id: 'parkmap',
        useCurrentLocation: true,
        mapOptions : {
            zoom : 15,
            panControl:false,
            overviewMapControl:false,
            rotateControl : false,
            scaleControl:false,
            zoomControl:false,
            streetViewControl:false,
            useCurrentLocation: true,
            mapTypeId : google.maps.MapTypeId.ROADMAP,
            navigationControl: true,
            navigationControlOptions: {
                style: google.maps.NavigationControlStyle.DEFAULT
            },
        },
        marker: undefined,
        listeners:{
	    	centerchange:function(senchaMap,gMap,center){
                if(NGT.views.mapview.currentMarker != undefined) return;
                Ext.dispatch({
                    controller: 'map',
                    action: 'mark',
                    data:{
                        gmap:gMap,
                        loc:center,
                        view:this
                    }
                });
	    	}
    	},
    }],
    getMarkerPosition : function(){
        
    },
    dockedItems:[
    	{
            xtype:'toolbarview', 
            dock:'bottom', 
            currentMarker : this.marker
        }
    ],
    tapholdHandler:function(a,b,c,d){
        //alert('taphold');
    },
    initComponent: function() {
        NGT.views.mapview.superclass.initComponent.apply(this, arguments);
        //this.on('tap',this.toggleMenus, this, {element : 'body'});
        this.on('taphold', this.tapholdHandler, this, {element : 'body'});
    },
    
});

Ext.reg('mapview', NGT.views.mapview);