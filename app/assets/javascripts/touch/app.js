NGT = new Ext.Application({
	name : "NeverGetTowed",
	pages : new Array(),
	defaultUrl : '/touch',
	icon: 'resources/images/icon.png',
    glossOnIcon: true,
	launch: function(){
		this.viewport = new NGT.views.mapview({
			application: this
		});
	}
});