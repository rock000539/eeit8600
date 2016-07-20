<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<!-- jQuery -->
	<script src="/js/jquery.min.js"></script>
	
	<!-- BootStrap -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<script src="/js/bootstrap.min.js"></script>
	
    <link rel="stylesheet" href="/css/font-awesome.css"/>
    
    <!-- Header & Footer -->
	<link rel="stylesheet" href="/css/fms/style.css">
	<link rel="stylesheet" href="/css/fms/fms-customize.css">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>LoginPage</title>
	
	<style>
	
		*,:after,:before{box-sizing:border-box}
		.clearfix:after,.clearfix:before{content:'';display:table}
		.clearfix:after{clear:both;display:block}
		a{color:inherit;text-decoration:none}
		
		.login-wrap{
			width:100%;
			margin:auto;
			max-width:525px;
			min-height:670px;
			position:relative;
/* 			background:url() no-repeat center; */
/* 			box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19); */
		}
		.login-html{
			width:80%;
			height:70%;
			position:absolute;
			padding:40px 60px 20px 60px;
/* 			background: #727CB6; */
 			background:rgba(40,57,101,.9);
			
			margin-top: 20vh;
			margin-left: 5vw;
			border-radius: 30px;
		}
		.login-html .sign-in-htm,
		.login-html .sign-up-htm{
			top:0;
			left:0;
			right:0;
			bottom:0;
			position:absolute;
			transform:rotateY(180deg);
			backface-visibility:hidden;
			transition:all .4s linear;
		}
		.login-html .sign-in,
		.login-html .sign-up,
		.login-form .group .check{
			display:none;
		}
		.login-html .tab,
		.login-form .group .label,
		.login-form .group .button{
			text-transform:uppercase;
		}
		.login-html .tab{
			font-size:22px;
			margin-right:15px;
			padding-bottom:5px;
			margin:0 15px 10px 0;
			display:inline-block;
			border-bottom:2px solid transparent;
		}
		.login-html .sign-in:checked + .tab,
		.login-html .sign-up:checked + .tab{
			color:#fff;
			border-color:#1161ee;
		}
		.login-form{
			min-height:345px;
			position:relative;
			perspective:1000px;
			transform-style:preserve-3d;
		}
		.login-form .group{
			margin-bottom:5px;
		}
		.login-form .group .label,
		.login-form .group .input,
		.login-form .group .button{
			width:100%;
			color:#fff;
			display:block;
		}
		.login-form .group .input,
		.login-form .group .button{
			border:none;
			padding:15px 20px;
			border-radius:25px;
			background:rgba(255,255,255,.1);
		}
		.login-form .group input[data-type="password"]{
			text-security:circle;
			-webkit-text-security:circle;
		}
		.login-form .group .label{
			color:#aaa;
			font-size:12px;
		}
		.login-form .group .button{
			background:#1161ee;
		}
		.login-form .group label .icon{
			width:15px;
			height:15px;
			border-radius:2px;
			position:relative;
			display:inline-block;
			background:rgba(255,255,255,.1);
		}
		.login-form .group label .icon:before,
		.login-form .group label .icon:after{
			content:'';
			width:10px;
			height:2px;
			background:#fff;
			position:absolute;
			transition:all .2s ease-in-out 0s;
		}
		.login-form .group label .icon:before{
			left:3px;
			width:5px;
			bottom:6px;
			transform:scale(0) rotate(0);
		}
		.login-form .group label .icon:after{
			top:6px;
			right:0;
			transform:scale(0) rotate(0);
		}
		.login-form .group .check:checked + label{
			color:#fff;
		}
		.login-form .group .check:checked + label .icon{
			background:#1161ee;
		}
		.login-form .group .check:checked + label .icon:before{
			transform:scale(1) rotate(45deg);
		}
		.login-form .group .check:checked + label .icon:after{
			transform:scale(1) rotate(-45deg);
		}
		.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
			transform:rotate(0);
		}
		.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
			transform:rotate(0);
		}
		
		.hr{
			height:2px;
			margin:20px 0 20px 0;
			background:rgba(255,255,255,.2);
		}
		.foot-lnk{
			text-align:center;
		}
		
	</style>
	
</head>
<body>

	<!--加入header&nav -->
	<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
	<!-- **每頁不同的內容從這裡開始** -->
	<div class="grey_bg row">
		
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
				<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
				<div class="login-form">
					<div class="sign-in-htm">
						<div class="group">
							<label for="user" class="label">Username</label>
							<input id="user" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">Password</label>
							<input id="pass" type="password" class="input" data-type="password">
						</div>
						<div class="group">
							<input id="check" type="checkbox" class="check" checked>
							<label for="check"><span class="icon"></span> Keep me Signed in</label>
						</div>
						<div class="group">
							<input type="submit" class="button" value="Sign In">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<a href="#forgot">Forgot Password?</a>
						</div>
					</div>
					<div class="sign-up-htm">
						<div class="group">
							<label for="user" class="label">Username</label>
							<input id="user" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">Password</label>
							<input id="pass" type="password" class="input" data-type="password">
						</div>
						<div class="group">
							<label for="pass" class="label">Email Address</label>
							<input id="pass" type="text" class="input">
						</div>
						<div class="group">
							<input type="submit" class="button" value="Sign Up">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<label for="tab-1">Already Member?</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>        
    <!-- **每頁不同的內容結束** -->

	<!--加入footer -->
	<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
	
	<!-- Header & Footer -->
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>

</body>
</html>