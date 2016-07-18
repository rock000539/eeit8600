<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Fortune Responsive Multipurpose Template</title>
	<meta name="description" content="">

    <!-- CSS FILES -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />

        <section id="page_head" class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="page_title">
                    <h2>404</h2>
                    <span class="sub_heading">Page not found</span>
                </div>
                <nav id="breadcrumbs">
                    <ul>
                        <li>You are here:</li>
                        <li><a href="/fms">Home</a></li>
                        <li>Pages</li>
                    </ul>
                </nav>
            </div>
        </section>

		<section class="content not_found">
            <div class="row">
                <div class="col-sm-12 col-lg-12 col-md-12">
                    <div class="page_404">
                        <h1>404</h1>
                        <p>Sorry, Page you're looking for is not found</p>
                        <a href="/fms" class="btn btn-default btn-lg back_home">
                            <i class="fa fa-arrow-circle-o-left"></i>
                            Go to Back
                        </a>
                    </div>
                </div>
            </div>
		</section>


 <c:import url="/WEB-INF/jsp/fms_footer.jsp" />
	
<!-- 	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> -->
<!-- 	<script src="js/bootstrap.min.js"></script> -->
<!-- 	<script src="js/jquery.easing.1.3.js"></script> -->
<!-- 	<script src="js/retina-1.1.0.min.js"></script> -->
<!-- 	<script type="text/javascript" src="js/jquery.cookie.js"></script> jQuery cookie  -->
<!-- 	<script type="text/javascript" src="js/styleswitch.js"></script> Style Colors Switcher -->
<!-- 	<script type="text/javascript" src="js/jquery.smartmenus.min.js"></script> -->
<!--     <script type="text/javascript" src="js/jquery.smartmenus.bootstrap.min.js"></script> -->
<!-- 	<script type="text/javascript" src="js/jflickrfeed.js"></script> -->
<!-- 	<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script> -->
<!-- 	<script type="text/javascript" src="js/jquery.isotope.min.js"></script> -->
<!-- 	<script type="text/javascript" src="js/swipe.js"></script> -->
<!--     <script type="text/javascript" src="js/jquery-scrolltofixed-min.js"></script> -->

<!-- 	<script src="js/main.js"></script> -->
		<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>
	<!-- Start Style Switcher -->
	<div class="switcher"></div>
	<!-- End Style Switcher -->

</body>
</html>