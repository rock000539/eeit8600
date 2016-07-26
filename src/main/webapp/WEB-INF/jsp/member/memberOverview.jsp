<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>${member.nickname}'s Overview</title>
    
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
<style>
#overview{
 	padding: 40px 40px 85px 100px;
	color: #000;
/* 	letter-spacing: 1px; */
}
#overview .row{
	margin-bottom: 30px;
}
.count{
	font-weight: bold;
	font-size: 24px;
	line-height: 30px;
	font-family: "Adobe Caslon",Georgia,"Times New Roman",Times,serif;
}
.source{
	font-size: 18px;
	line-height: 20px;
}
.source>i{
	color: #FF1E76;
	font-size: 16px;
}
.since{
	margin-top: 80px;
	text-align: center;
}
.since>h4{
	display: inline-block;
	font-weight: 500;
	font-size: 16px;
	position: relative;
	left: -60px;
	font-style: italic;
	font-family:monospace;
}
.since span{
	display: inline-block;
	font-size: 18px;
	font-family: "Irvin Display",Georgia,"Times New Roman",Times,serif;
	font-style: normal;
}

</style>
</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
				<div class="grey_bg row">

<div class="row detail-div">
	<div class="col-lg-10 col-sm-6 wow fadeInLeft delay-05s memberDiv">
		<c:import url="/WEB-INF/jsp/member/memberPages-header.jsp" />

<div id="overview">
	<div class="row">
		<div class="col-lg-4"><span class="count">${expDates}</span><br><span class="source">Expiration</span></div>
		<div class="col-lg-4"><span class="count">${postedReviews}</span><br><span class="source">Reviews</span></div>
		<div class="col-lg-4"><span class="count">${postedArticles}</span><br><span class="source">Articles</span></div>
	</div>
	<div class="row">
		<div class="col-lg-4"><span class="count">XXX</span><br><span class="source">WishList</span></div>
		<div class="col-lg-4"><span class="count">${likedReviews}</span><br><span class="source"><i class="fa fa-heart"></i> Reviews</span></div>
		<div class="col-lg-4"><span class="count">${likedArticles}</span><br><span class="source"><i class="fa fa-heart"></i> Articles</span></div>
	</div>
	<div class="since">
		<h4>Member since <span>${memberRegiDate}</span></h4>
	</div>
</div>	

		
	</div> <!-- col-lg -->
	
	<c:import url="/WEB-INF/jsp/member/memberPages-nav.jsp" />
	
</div> <!-- row -->
					
				</div>        

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