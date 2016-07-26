<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>${nickname}'s XXX</title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    <!-- customize -->
    <link rel="stylesheet" href="/css/member/member-customize.css">
</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
				<div class="grey_bg row">

<div class="row detail-div">
	<div class="col-lg-10 col-sm-6 wow fadeInLeft delay-05s memberDiv">
		<c:import url="/WEB-INF/jsp/member/memberPages-header.jsp" />
		
		
		
		
	</div> <!-- memberDiv -->
	
	<c:import url="/WEB-INF/jsp/member/memberPages-nav.jsp" />
	
</div> <!-- detail-div -->
					
				</div> <!-- grey_bg -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			

	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>

</body>
</html>