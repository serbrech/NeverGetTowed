NGT.controllers.parking = Ext.regController("parking", {
    loaded: function(options) {
        // need to rerender/refresh the map here
    },

    park: function(options) {
    	Ext.getCmp('park-button').hide();
    	Ext.getCmp('unpark-button').show();
    },

    unpark: function(options) {
    	Ext.getCmp('unpark-button').hide();
    	Ext.getCmp('park-button').show();
    }

});