<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <title>index</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/src/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
  <script type="text/javascript">
  
  </script>
</head>
<body>
<!-- navbar on Top -->
<nav class="navbar navbar-inverse ">
  <div class="container-fluid">
    
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Dashboard</a></li>
        <li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="#">商品管理
	        <span class="caret"></span></a>
	        <ul class="dropdown-menu">
	          <li><a href="#">Brand</a></li>
	          <li><a href="#">Category</a></li>
	          <li><a href="#">Ingredient</a></li> 
	        </ul>
      	</li>
      	<li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="#">文章管理
	        <span class="caret"></span></a>
	        <ul class="dropdown-menu">
	          <li><a href="#">page1</a></li>
	          <li><a href="#">page2</a></li>
	          <li><a href="#">page3</a></li> 
	        </ul>
      	</li>
      	<li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="#">會員管理
	        <span class="caret"></span></a>
	        <ul class="dropdown-menu">
	          <li><a href="#">page1</a></li>
	          <li><a href="#">page2</a></li>
	          <li><a href="#">page3</a></li> 
	        </ul>
      	</li>
        <li><a href="#">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
    
  </div>
</nav>
<!-- End of navbarTop -->



<div class="container-fluid text-center">    
  <div class="row content">
  
<!-- navbar on Left -->
<div class="col-sm-2 sidenav">
   <div class="panel-group" id="accordion">
    	<div class="panel panel-default">
		    <div class="panel-heading">
		       <h4 class="panel-title">
		          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">商品管理</a>
		       </h4>
		    </div>
	      	<div id="collapse1" class="panel-collapse collapse">
	        	<div class="panel-body">
	        		<ul class="list-group">
	        			<li class="list-group-item"><a href="#">Brand</a></li>
	        			<li class="list-group-item"><a href="#">Category</a></li>
	        			<li class="list-group-item"><a href="#">Ingredient</a></li>
	        		</ul>
	        	</div>
			</div>
   		</div>
   		
	    <div class="panel panel-default">
	      <div class="panel-heading">
	        <h4 class="panel-title">
	          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">會員管理</a>
	        </h4>
	      </div>
	      <div id="collapse2" class="panel-collapse collapse">
	        <div class="panel-body">testing</div>
	      </div>
	    </div>
	    
	    <div class="panel panel-default">
	      <div class="panel-heading">
	        <h4 class="panel-title">
	          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">文章管理</a>
	        </h4>
	      </div>
	      <div id="collapse3" class="panel-collapse collapse">
	        <div class="panel-body">testing</div>
	      </div>
	    </div>
  </div> 
  </div><!-- end of navbarLeft -->

    
<!-- Content -->
    <div class="col-sm-8 text-left"> 
      
    </div>
    
<!-- sidebar on Right -->
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
