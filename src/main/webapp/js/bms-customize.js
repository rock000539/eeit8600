$(function() {

	var url = window.location;
	$('ul.nav a').filter(function () {
	    return this.href == url || url.href.indexOf(this.href) == 0;
	}).addClass('active').parents('#side-menu ul').addClass('in');

});