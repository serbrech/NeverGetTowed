NGT.controllers.parking = Ext.regController("parking", {
    loaded: function(options) {
        // need to rerender/refresh the map here
    },

    park: function(options) {
    	Ext.getCmp('park-button').hide();
    	var unpark = Ext.getCmp('unpark-button');
    	unpark.show();
    	//unpark.setLoading(true);
    	var lat = options.data.lat();
    	var lon = options.data.lng();
		var oslostreets = 'http://oslostreets.appspot.com/lookup?format=json&callback=?';
		Ext.getCmp('mapview').showStreets([
			'Stenersgata',
			'Nygata'
		]);

		// $.getJSON('http://nominatim.openstreetmap.org/reverse?json_callback?',
		//   	{
		// 	  lat: options.data.lat(), 
		// 	  lon : options.data.lng(),
		// 	},
		// 	function(json) {
		// 		alert(json);
		// 	});

  	$.getJSON('http://nominatim.openstreetmap.org/reverse?json_callback=?',
 				{lat: lat, lon: lon, format:'json'},
                function (data) {
                	var buttonText = 'Leave '+ data.address.road +' (' +data.address.postcode + ')';
                    unpark.setText(buttonText);
                    //unpark.setLoading(false);
                }); //end ajax


		
	 },

    unpark: function(options) {
    	Ext.getCmp('unpark-button').hide().setText('Leave');
    	Ext.getCmp('park-button').show();
    }

});