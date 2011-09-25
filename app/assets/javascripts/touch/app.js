//= require jquery

NGT = new Ext.Application({
	name : "NeverGetTowed",
	pages : new Array(),
	defaultUrl : '/touch',
	icon: '/assets/logo.png',
    glossOnIcon: true,
	launch: function(){
		this.viewport = new NGT.views.mapview({
			application: this
		});
	}
});