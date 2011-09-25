NGT.views.ToolBarView = Ext.extend(Ext.Toolbar, {
	layout:{type:'hbox',pack:'center', align:'stretch'},
	items: [
		{
			id:'park-button',
			cls:'parkingbtn',
			ui:'confirm',
			text:'Park',
			handler:function(button, event){
				Ext.dispatch({
                        controller: 'parking',
                        action: 'park',
                        data: NGT.views.mapview.currentMarker.getPosition()
                    });
			}
		},
		{
			id:'unpark-button',
			cls:'parkingbtn',
			ui:'decline',
			text:'Leave',
			hidden:true,
			handler:function(button, event){
				Ext.dispatch({
                    controller: 'parking',
                    action: 'unpark'
                });
			}
		}
	],
	initComponent: function() {
        NGT.views.ToolBarView.superclass.initComponent.apply(this, arguments);
    },
    currentMarker:undefined,
});

Ext.reg('toolbarview', NGT.views.ToolBarView);