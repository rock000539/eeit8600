
/* ==========================================================================
	Asynchronous Loading Google Maps
============================================================================= */
function loadScript() {
	var script = document.createElement('script');
	script.type = 'text/javascript';
	script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' + 'callback=initialize';
	document.body.appendChild(script);
}
window.onload = loadScript;

/* ==========================================================================
	Google Maps SETTING's
============================================================================= */
/*
 * define the coordinates of your company
 */

lat = 25.033881;
lng = 121.543396;

var map;
var MY_MAPTYPE_ID = 'custom_style';
 
function initialize() {
	
	var featureOpts = 
	[
	 	{
	 		"featureType": "landscape",
	 		"stylers": [
	 		            { "weight": 0.1 },
	 		            { "color": "grey" }
	 		           ]
	 	},
	 	{
	 		"featureType": "road",
	 		"elementType": "geometry",
	 		"stylers": [
	 		            { "visibility": "simplified" },
	 		            { "color": "brown" }
	 		           ]
	 	},
	 	{
			"featureType": "poi",
			"elementType": "geometry",
			"stylers": [
			            { "color": "yellow" }
			           ]
	 	},
	 	{
			"featureType": "road",
			"elementType": "labels.text.fill",
			"stylers": [
			            { "color": "#2c3e50" }
			           ]
	 	},
	 	{
			"featureType": "poi",
			"elementType": "labels.text.fill",
			"stylers": [
			            { "color": "#e74c3c" }
			           ]
		},
		{
			"featureType": "road",
			"elementType": "labels.text.stroke",
			"stylers": [
			            { "color": "Yellow" }
			           ]
		},
		{
			"featureType": "water",
			"stylers": [
			            { "color": "blue" }
			           ]
		}
	];
	
	var myLatlng = new google.maps.LatLng(lat, lng);
	var mapOptions = 
	{
		zoom: 18,
		scrollwheel: false,
		mapTypeControl:false,
		streetViewControl:false,
		center: myLatlng,
		mapTypeControlOptions: {
			mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
		},
		mapTypeId: MY_MAPTYPE_ID
	};
  
	var map = new google.maps.Map(document.getElementById('page_maps'), mapOptions);
	
	var icon = {
	    url: "../../images/letter_q.png",
	    //scaledSize: new google.maps.Size(74, 64),
	    origin: new google.maps.Point(0,0),
	    anchor: new google.maps.Point(0, 0)
	};

	
	var marker = new google.maps.Marker({
		map: map,
		position: myLatlng,
  	  	icon: icon,
  	  	visible: true,
		draggable: false,
		//animation: google.maps.Animation.DROP,
	});
	
	marker.setAnimation(google.maps.Animation.BOUNCE);
	
//	marker.addListener('click', toggleBounce);
//	
//	function toggleBounce() {
//		if (marker.getAnimation() !== null) {
//			marker.setAnimation(null);
//		} else {
//			marker.setAnimation(google.maps.Animation.BOUNCE);
//		}
//	}
  
	var styledMapOptions = 
	{
		name: 'Custom Style'
	};
  
	var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions); 
	map.mapTypes.set(MY_MAPTYPE_ID, customMapType);
	google.maps.event.addDomListener(window, 'load', initialize);

}
