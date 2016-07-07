<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<script src="/js/jquery.min.js"></script>
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<script src="/js/bootstrap.min.js"></script>
	
	<!-- mixItUp -->
	<script src="/js/jquery.mixitup.min.js"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ProductListPage</title>

	<style>
	
		*{
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body{
  background: #68b8c4;
}

body, button{
  font-family: 'Helvetica Neue', arial, sans-serif;
}

.controls{
  padding: 2%;
  background: #333;
  color: #eee;
}

label{
  font-weight: 300;
  margin: 0 .4em 0 0;
}

button{
  display: inline-block;
  padding: .4em .8em;
  background: #666;
  border: 0;
  color: #ddd;
  font-size: 16px;
  font-weight: 300;
  border-radius: 4px;
  cursor: pointer;
}

button.active{
  background: #68b8c4;
}

button:focus{
  outline: 0 none;
}

button + label{
  margin-left: 1em;
}

.container{
  padding: 2% 2% 0;
  text-align: justify;
  font-size: 0.1px;
  
  -webkit-transform: translateZ(0);
  -webkit-backface-visibility: hidden;
}

.container:after{
  content: '';
  display: inline-block;
  width: 100%;
}

.container .mix,
.container .gap{
  display: inline-block;
  width: 49%;
  overflow: hidden;
}

.container .mix{
  text-align: left;
  background: #03899c;
  margin-bottom: 2%;
  display: none;
}

.container .mix.category-1{
  border-top: 2px solid limegreen;
}

.container .mix.category-2{
  border-top: 2px solid yellow;
}

.container .mix:after{
  content: attr(data-myorder);
  color: white;
  font-size: 16px;
  display: inline-block;
  vertical-align: top;
  padding: 4% 6%;
  font-weight: 700;
}

.container .mix:before{
  content: '';
  display: inline-block;
  padding-top: 60%;
}

@media all and (min-width: 420px){
  .container .mix,
  .container .gap{
    width: 32%;
  }
}

@media all and (min-width: 640px){
  .container .mix,
  .container .gap{
    width: 23.5%;
  }
}

/**
 * List Styles
 */

.container.list .mix{
  width: 100%;
}

.container.list .mix:before{
  padding-top: 40px;
}
		
	</style>

</head>
<body>

	<div class="controls">
		<label>Filter:</label>
	  
		<button class="filter" data-filter="all">All</button>
		<button class="filter" data-filter=".category-1">Category 1</button>
		<button class="filter active" data-filter=".category-2">Category 2</button>
		<button class="filter" data-filter="none">None</button>
		
		<label>Sort:</label>
		
		<button class="sort" data-sort="default">Default</button>
		<button class="sort" data-sort="random">Random</button>
		<button class="sort" data-sort="myorder:asc">Asc</button>
		<button class="sort" data-sort="myorder:desc">Desc</button>
		
		<label>Change Layout:</label>
		<button id="ChangeLayout">Grid</button>
		
		<button id="ToggleLayout" class="btn toggle-layout">&nbsp;<i></i></button>
		<button id="ToggleConfig" class="btn toggle-config">&nbsp;</button>
	</div>
	
	<div id="Container" class="container">
		<div class="mix category-1" data-myorder="1"></div>
		<div class="mix category-1" data-myorder="2"></div>
		<div class="mix category-1" data-myorder="3"></div>
		<div class="mix category-2" data-myorder="4"></div>
		<div class="mix category-1" data-myorder="5"></div>
		<div class="mix category-1" data-myorder="6"></div>
		<div class="mix category-2" data-myorder="7"></div>
		<div class="mix category-2" data-myorder="8"></div>
		
		<div class="gap"></div>
		<div class="gap"></div>
	</div>

	<script>
	
		$(function() {

			 // We will be using MixItUp's 'changeLayout' API method to add and remove a 'list' class to the container. This class changes the styling of our target elements (see CSS).
			  
			 // NB: Changing layout doesn't have to be between grid/list only, we can add any class we want and use it to affect the styling of our elements.

			$(function(){

			  var layout = 'list', // Store the current layout as a variable
			      $container = $('#Container'), // Cache the MixItUp container
			      $changeLayout = $('#ChangeLayout'); // Cache the changeLayout button
			  
			  // Instantiate MixItUp with some custom options:
			  
			  $container.mixItUp({
			    animation: {
			      animateChangeLayout: true, // Animate the positions of targets as the layout changes
			      animateResizeTargets: true, // Animate the width/height of targets as the layout changes
			      effects: 'fade rotateX(-40deg) translateZ(-100px)'
			    },
			    layout: {
			      containerClass: 'list' // Add the class 'list' to the container on load
			    }
			  });
			  
			  // MixItUp does not provide a default "change layout" button, so we need to make our own and bind it with a click handler:
			  
			  $changeLayout.on('click', function(){
			    
			    // If the current layout is a list, change to grid:
			    
			    if(layout == 'list'){
			      layout = 'grid';
			      
			      $changeLayout.text('List'); // Update the button text
			      
			      $container.mixItUp('changeLayout', {
			        containerClass: layout // change the container class to "grid"
			      });
			      
			    // Else if the current layout is a grid, change to list:  
			    
			    } else {
			      layout = 'list';
			      
			      $changeLayout.text('Grid'); // Update the button text
			      
			      $container.mixItUp('changeLayout', {
			        containerClass: layout // Change the container class to 'list'
			      });
			    }
			  });
			  
			});

		});
		
	</script>

</body>
</html>