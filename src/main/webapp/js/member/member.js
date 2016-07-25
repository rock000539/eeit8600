$(function(){
	/* Highlight current link */    
	var url = window.location.toString();
	$('#navigationMenu li a>span').removeClass('nav-active');
	$('.nav li:has(a[href="' + url + '"])').addClass('nav-active');
	
});