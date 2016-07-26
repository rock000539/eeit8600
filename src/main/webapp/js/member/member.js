$(function(){
	/* Highlight current link */    
	var url = window.location.toString();
	var el=document.getElementsByClassName("nav-span");
	for(var i=0;i<el.length;i++){
		var elp=el[i].parentNode;
		if(url==elp){
			el[i].setAttribute("class","nav-active nav-span");
		}
	}
	
	
});