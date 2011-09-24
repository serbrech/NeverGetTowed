NGT.views.viewport = Ext.extend(Ext.Panel, {
	fullscreen:true,
    layout: 'fit',
    items: [
    	{ xtype : 'map' }
    ],
    dockedItems:[
	]
});


Ext.reg('NGT.views.viewport', NGT.views.viewport);