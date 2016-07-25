<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Member Personal</title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
<style>
div.detail-div{
	margin: 50px;
}
div.col-lg-4, div.col-sm-6{
	margin: auto auto;
}
.delay-05s { 
	animation-delay: 0.5s; 
	-webkit-animation-delay: 0.5s; 
}
.detail-list{
	padding:0 0 0 0;
	font-size:14px;
	margin-bottom:40px;
}
.detail-list-col1{
	float:left;
	width:60px;
}
.detail-list-col1 i{
	font-style:normal;
	font-size:28px;
	display:block;
	color:#222;
	font-family: 'FontAwesome';
	line-height: 38px;
}
.detail-list-col1 img{
	width: 50px;
	height: 50px;
}
.detail-list-col2{
	overflow:hidden;	
}
.detail-list-col2 h3{
	font-family: 'Montserrat', sans-serif;
    color: #222222;
    font-size: 16px;
    line-height: 17px; 
    margin: 0 0 5px 0;
    text-transform: uppercase;
    font-weight: 400;
}

#navigationDiv{
	float:left;
	position: fixed;
}
#navigationMenu li{
	list-style:none;
	height:39px;
	width:40px;
	padding:2px;
}
#navigationMenu span.nav-span{
	width:0;
	left:38px;
	padding:0;
	position:absolute;
	overflow:hidden;
	font-family:'Myriad Pro',Arial, Helvetica, sans-serif;
	font-size:18px;
	font-weight:bold;
	letter-spacing:0.6px;
	white-space:nowrap;
	line-height:39px;
	-webkit-transition: 0.25s;
	transition: 0.25s;
}
#navigationMenu a{
	height:39px;
	width:38px;
	display:block;
	position:relative;
	text-align: center;
}
#navigationMenu a>span.nav-icon{
	display: inline-block;
	padding-top: 9px;
	font-size: 22px;
}
a.home{
	background: #EA3556;
	color: #fff;
}
a.about{
	background: #61D2D6;
	color: #fff;
}
a.expdate{
	background: #ED146F;
	color: #fff;
}
a.liked{
	background: #EDE5E2;
	color: #fff;
}
a.liked-product{
	background: #EDDE45;
	color: #fff;
}
a.post{
	background: #9BF0E9;
	color: #fff;
}

#navigationMenu a:hover span.nav-span{
	width:auto; 
	padding:0 20px;
	overflow:visible; 
}
#navigationMenu a:hover{
	text-decoration:none;
	-webkit-box-shadow:0 0 5px #9ddff5;
	box-shadow:0 0 5px #9ddff5;
}

#navigationMenu .home {	background-position:0 0;}
#navigationMenu .home:hover {	background-position:0 -39px;}
#navigationMenu .home span.nav-span{
	background-color: #EA3556;
	color: #fff;
/* 	text-shadow:1px 1px 0 #99bf31; */
}
#navigationMenu .about { background-position:-38px 0;}
#navigationMenu .about:hover { background-position:-38px -39px;}
#navigationMenu .about span.nav-span{
	background-color: #61D2D6;
	color: #fff;
/* 	text-shadow:1px 1px 0 #44a8d0; */
}
#navigationMenu .expdate { background-position:-152px 0;}
#navigationMenu .expdate:hover { background-position:-152px -39px;}
#navigationMenu .expdate span.nav-span{
	background-color: #ED146F;
	color: #fff;
/* 	text-shadow:1px 1px 0 #d244a6; */
}
#navigationMenu .liked { background-position:-76px 0;}
#navigationMenu .liked:hover { background-position:-76px -39px;}
#navigationMenu .liked span.nav-span{
	background-color: #EDE5E2;
	color: #222;
/* 	text-shadow:1px 1px 0 #d28344; */
}
#navigationMenu .liked-product { background-position:-38px 0;}
#navigationMenu .liked-product:hover { background-position:-38px -39px;}
#navigationMenu .liked-product span.nav-span{
	background-color: #EDDE45;
	color: #222;
/* 	text-shadow:1px 1px 0 #44a8d0; */
}
#navigationMenu .post { background-position:-152px 0;}
#navigationMenu .post:hover { background-position:-152px -39px;}
#navigationMenu .post span.nav-span{
	background-color: #9BF0E9;
	color: #222;
/* 	text-shadow:1px 1px 0 #d244a6; */
}
</style>	
</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
<div id="navigationDiv">
	<ul id="navigationMenu">
	    <li>
		    <a class="home" href="#">
		    	<span class="nav-icon"><i class="fa fa-home"></i></span>
	            <span class="nav-span">Home</span>
	        </a>
	    </li>
	    <li>
	    	<a class="about" href="#">
	    		<span class="nav-icon"><i class="fa fa-user"></i></span>
	            <span class="nav-span">About</span>
	        </a>
	    </li>
	    <li>
	    	<a class="expdate" href="#">
	            <span class="nav-icon"><i class="fa fa-bell-o"></i></span>
	            <span class="nav-span">Exp Date</span>
	        </a>
	    </li>
	    <li>
		     <a class="liked" href="#">
	            <span class="nav-icon"><i class="fa fa-thumbs-up"></i></span>
	            <span class="nav-span">Liked</span>
	         </a>
	    </li>
	    <li>
	    	<a class="liked-product" href="#">
	            <span class="nav-icon"><i class="fa fa-gift"></i></span>
	            <span class="nav-span">Product</span>
	        </a>
	    </li>
	    <li>
	    	<a class="post" href="#">
	            <span class="nav-icon"><i class="fa fa-pencil"></i></span>
	            <span class="nav-span">Posted</span>
	        </a>
	    </li>
	</ul>
</div>

<div class="row detail-div">
	<div class="col-lg-3"></div>
	<div class="col-lg-4 col-sm-6 wow fadeInLeft delay-05s">
		<div class="detail-list">
			<div class="detail-list-col1">
			   	<img src="/members/show?memberId=${member.memberId}"/>
			</div>
			<div class="detail-list-col2">
			       <h3>Email</h3>
			       <p>${member.email}</p>
			</div>
		</div>
		<div class="detail-list">
			<div class="detail-list-col1">
			   	<i class="fa-paw"></i>
			</div>
			<div class="detail-list-col2">
			       <h3>Nickname</h3>
			       <p>${member.nickname}</p>
			</div>
		</div>
		<div class="detail-list">
			<div class="detail-list-col1">
			   	<i class="fa-paw"></i>
			</div>
			<div class="detail-list-col2">
			    <div style="display:inline-block; margin-right: 20px;">
			       <h3>First Name</h3>
			       <p>${member.firstName}</p>
			    </div>
			    <div style="display:inline-block">
			       <h3>Last Name</h3>
			       <p>${member.lastName}</p>
			    </div>
			</div>
		</div>
		<div class="detail-list">
			<div class="detail-list-col1">
			   	<i class="fa-paw"></i>
			</div>
			<div class="detail-list-col2">
			       <h3>Gender</h3>
			       <p>${member.gender}</p>
			</div>
		</div>
		<div class="detail-list">
			<div class="detail-list-col1">
			   	<i class="fa-paw"></i>
			</div>
			<div class="detail-list-col2">
			       <h3>Birthday</h3>
			       <p>${member.birthDay}</p>
			</div>
		</div>
		<div class="detail-list">
			<div class="detail-list-col1">
			   	<i class="fa-paw"></i>
			</div>
			<div class="detail-list-col2">
			       <h3>Phone</h3>
			       <p>${member.phone}</p>
			</div>
		</div>
		<div class="detail-list">
			<div class="detail-list-col1">
			   	<i class="fa-paw"></i>
			</div>
			<div class="detail-list-col2">
			       <h3>Address</h3>
			       <p>${member.addr}</p>
			</div>
		</div>
		<div class="detail-list">
			<div class="detail-list-col1">
			   	<i class="fa-paw"></i>
			</div>
			<div class="detail-list-col2">
			       <h3>Your Registration Date</h3>
			       <p>${member.memberRegiDate}</p>
			</div>
		</div>
	</div> <!-- col-lg-4 -->
	
</div> <!-- row -->
					
				</div>        
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			

<script>
$(function(){
	$('.detail-list-col2').on(click, function(){
		
	});
})
</script>

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