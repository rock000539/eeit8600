<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Member Profile</title>
    
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
.memberDiv{
	margin-bottom: 100px;
	padding-left: 100px;
	padding-right: 80px;
}
.delay-05s { 
	animation-delay: 0.5s; 
	-webkit-animation-delay: 0.5s; 
}
#member-header{
	margin-bottom: 30px;
}
#editProfile, #editProfile:active, 
#editProfile:focus, #editProfile:visited{
	display: inline-block;
	height: 24px;
	line-height: 24px;
	background-color: #000;
	border-radius: 0px;
	font-weight: bold;
	padding: 0 10px 0 10px;
}
#editProfile:hover{
	background: #fff;
	color: #000;
}
</style>
</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">

<div class="row detail-div">
	<div class="col-lg-10 col-sm-6 wow fadeInLeft delay-05s memberDiv">
		<div id="member-header" class="detail-list">
			<div id="memberphoto" class="detail-list-col1">
			   	<img src="/members/show?memberId=${member.memberId}"/>
			</div>
			<div class="detail-list-col2">
			       <h3>${member.nickname}</h3>
			       <p>${member.gender}, ${member.skinType} skin, from ${member.addr}</p>
			       <a id="editProfile" class="btn btn-default" 
			       		href="<% request.getContextPath(); %>/members/profile/edit">
			       		<i class="fa fa-pencil"></i> EDIT PROFILE</a>
			</div>
		</div>		
		<div class="detail-list">
			<div class="detail-list-col1">
			   	<i class="fa-paw"></i>
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
			    <div style="display:inline-block; margin-right: 30px;">
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
	</div> <!-- col-lg -->
	<c:import url="/WEB-INF/jsp/member/memberPages-nav.jsp" />

</div> <!-- row -->
					
				</div>        
            <!-- **每頁不同的內容結束** -->

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