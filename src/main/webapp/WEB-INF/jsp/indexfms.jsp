<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/css/scrolling-nav.css" rel="stylesheet">
	
	<!-- Font awesome -->
    <link href="/css/font-awesome.min.css" rel="stylesheet">
    
    
    <link href="/css/indexfms-customize.css" rel="stylesheet">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
#aaa{
/* 	border:3px solid red; */
	float:left;
	position:fixed;
	margin-top:90px;
	padding-left:0px;
/* 	margin-left:50px; */
	transition: margin .5s ease-in-out;
}

#aaa ul{
	list-style-type: none;
/* 	margin:0 20px; */
	padding:20px 40px;
	text-align: center;
/*  	background-color: #FF8F59; */
 	background-color: rgba(255, 153, 153,0.3);
/*  	opacity: 0.3;  */
	
}

#aaa ul>li>a{
	font-size: 16px;
	font-family: "Helvetica";
	font-weight:600;
	text-transform: uppercase;
	letter-spacing: 3px; 
	color:gray;
}
</style>
</head>

<!-- The #page-top ID is part of the scrolling feature - the data-spy and data-target are part of the built-in Bootstrap scrollspy function -->

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

    <div id="aaa">
    	<ul>
    	<li><a class="page-scroll" href="#about">About</a></li>
    	<li><a class="page-scroll" href="#services">Service</a></li>
    	<li><a class="page-scroll" href="#contact">Contact</a></li>    
    	</ul>
    </div>
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a id="a" class="navbar-brand page-scroll" href="#page-top">Quite</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse" id="main-nav">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a class="page-scroll" href="#page-top"></a>
                    </li>
                    <li>
                        <a class="" href="#"><i class="fa fa-calendar" aria-hidden="true"></i>日期</a>
                    </li>
                    <li>
                        <a class="" href="#"><i class="fa fa-flask" aria-hidden="true"></i>成分</a>
                    	<ul>
	                        <li><a href="https://www.google.com.tw"><span>依成份查詢產品</span></a></li>
						    <li><a href="#"><span>依產品查詢成分</span></a></li>
                    	</ul>
                    </li>
                    <li>
                        <a class="" href="#"><i class="fa fa-retweet" aria-hidden="true"></i>順序</a>
                    </li>
                    <li>
                        <a class="" href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>產品</a>
                    </li>
                    <li>
                        <a class="" href="#"><i class="fa fa-heart" aria-hidden="true"></i>使用心得</a>
                        <ul>
	                        <li><a href="https://www.google.com.tw"><span>寫心得</span></a></li>
						    <li><a href="#"><span>心得收藏</span></a></li>
                    	</ul>
                    </li>
                    <li>
                        <a class="" href="#"><i class="fa fa-pencil" aria-hidden="true"></i>討論區</a>
                    </li>
                    <li>
                        <a class="" href="#"><i class="fa fa-trophy" aria-hidden="true"></i>排行</a>
                    </li>
<!--                     <li> -->
<!--                         <a class="page-scroll" href="#contact">Contact</a> -->
<!--                     </li> -->
                </ul>
                <ul class="nav navbar-nav navbar-right">
                	<li>
                        <a class="" href="#"><i class="fa fa-user" aria-hidden="true"></i></a>
                    </li>
                	<li>
                        <a class="" href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                    </li>
<!--                 	<li> -->
<!--                         <a class="" href="#"><i class="fa fa-bars" aria-hidden="true"></i></a> -->
<!--                     </li> -->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Intro Section -->
    <section id="intro" class="intro-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Scrolling Nav</h1>
                    <p><strong>Usage Instructions:</strong> Make sure to include the <code>scrolling-nav.js</code>, <code>jquery.easing.min.js</code>, and <code>scrolling-nav.css</code> files. To make a link smooth scroll to another section on the page, give the link the <code>.page-scroll</code> class and set the link target to a corresponding ID on the page.</p>
                    <a class="btn btn-default page-scroll" href="#about">Click Me to Scroll Down!</a>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>About Section</h1>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="services-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Services Section</h1>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Contact Section</h1>
                </div>
            </div>
        </div>
    </section>
    
    <section id="footer">
	    <div class="container">
	    <div class="row">
			  <div class="col-md-4">
			  		<h3>About Us</h3>			  
			  </div>
			  <div class="col-md-4">
			  		<h3>Follow Us</h3>
			  		<ul class="icons">
						<li><a class="btn-social btn-outline" href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li><a class="btn-social btn-outline" href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li><a class="btn-social btn-outline" href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
						<li><a class="btn-social btn-outline" href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
						<li><a class="btn-social btn-outline" href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a></li>
					</ul>
					<p class="copyright" style="clear:both">&copy; Qutie: <a href="http://html5up.net">www.qutie.com</a></p>
			  </div>
			  <div class="col-md-4">
			  		<h3>Contact Us</h3>
			  		<p>+886-2366-8888</p>
			  		<p>qutie@gmail.com</p>
			  </div>
		</div>
		</div>
	</section>

    <!-- jQuery -->
    <script src="/js/jquery.min.js"></script>
    <script src="/js/jquery.dropotron.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

    <!-- Scrolling Nav JavaScript -->
    <script src="/js/jquery.easing.min.js"></script>
    <script src="/js/scrolling-nav.js"></script>

    <script>
    $('#main-nav > ul').dropotron({ 
		mode: 'fade',
		noOpenerFade: true,
		hoverDelay: 150,
		hideDelay: 350,
		menuClass: 'dropotron',
	});
    
    </script>

</body>

</html>
