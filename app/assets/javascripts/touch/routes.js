Ext.Router.draw(function(map) {
    map.connect("pages/:id",  {controller: 'pages', action: 'show'});
});