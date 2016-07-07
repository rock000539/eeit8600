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

</head>

<!-- The #page-top ID is part of the scrolling feature - the data-spy and data-target are part of the built-in Bootstrap scrollspy function -->

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

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
                <a class="navbar-brand page-scroll" href="#page-top">Qutie</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
<!--                     <li class="hidden"> -->
<!--                         <a class="page-scroll" href="#page-top"></a> -->
<!--                     </li> -->
                    <li>
                        <a class="opener" href="#"><i class="fa fa-calendar" aria-hidden="true"></i>日期</a>
                    </li>
                    <li>
                        <a class="opener" href="#"><i class="fa fa-flask" aria-hidden="true"></i>成分</a>
                    </li>
                    <li>
                        <a class="opener" href="#"><i class="fa fa-retweet" aria-hidden="true"></i>順序</a>
                    </li>
                    <li>
                        <a class="opener" href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>產品</a>
                    </li>
                    <li>
                        <a class="" href="#"><i class="fa fa-heart" aria-hidden="true"></i>使用心得</a>
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
                	<li>
                        <a class="" href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
                    </li>
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

    <!-- jQuery -->
    <script src="/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

    <!-- Scrolling Nav JavaScript -->
    <script src="/js/jquery.easing.min.js"></script>
    <script src="/js/scrolling-nav.js"></script>
    
    <script>
//      $('.nav li').hover(function(){
//     	 $(this).css('','');
//      },function(){
    	 
//      });
    
    </script>

</body>

</html>
