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
	border
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
.main-section.alabaster{
	background:#fafafa;
}

</style>	
</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">

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
<!-- 	</div> col-lg-4 -->
<!-- 	<div class="col-lg-4 col-sm-6 wow fadeInLeft delay-05s"> -->
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
		$(this).
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