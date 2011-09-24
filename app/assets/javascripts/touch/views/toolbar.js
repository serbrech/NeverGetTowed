NGT.views.ToolBarView = Ext.extend(Ext.Toolbar, {
	layout:{type:'vbox',pack:'center'},
	items: [
		{
			ui:'confirm',
			stretch:true,
			text:'Park',
			width:'120px',
			handler:function(button, event){
				button.ui = 'red'
			}
		}
	],
	 initComponent: function() {
        NGT.views.ToolBarView.superclass.initComponent.apply(this, arguments);
    },
});

Ext.reg('toolbarview', NGT.views.ToolBarView);