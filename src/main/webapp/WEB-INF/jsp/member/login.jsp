<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html 
xmlns="http://www.w3.org/1999/xhtml"
xmlns:th="http://www.thymeleaf.org"
xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/font-awesome.css"/>
<!--     <link rel="stylesheet" href="/css/fms/fms-customize.css"> -->
    <link rel="stylesheet" href="/css/loginstyle.css">
	
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
<style>
.errorTypeIn {
    padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
    width:250px;
    margin:auto auto;
    border-radius: 4px;
    color: #a94442;
    background-color: #f2dede;
    border-color: #ebccd1;
}

.msg {
    padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
    border-radius: 4px;
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
    width:250px;
    margin:auto auto;
}
.forgot{
	text-align: center;
	padding-top: 5px;
}
a{
	text-decoration: none;
	color: #fff;
	font-size: 16px;
}
</style>      
</head>

 <body>
<!--加入header&nav -->			
<!-- **每頁不同的內容從這裡開始** -->
<div class="row">
<div class="col-lg-4"></div>
<div  class="col-lg-4" style="text-align: center;"><a href="/fms"><figure><img src="/images/logo_qutie-02.png" ></figure></a></div>
</div>

<div class="row loginPage">
    <div class="wrapper col-md-12">
	<div class="container">
		<h1>Welcome</h1>
		
	    <c:if test="${not empty error}">
            <div class="errorTypeIn">${error}</div>
        </c:if>
        <c:if test="${not empty msg}">
            <div class="msg">${msg}</div>
        </c:if>
        
		<form class="form"  th:action="@{/login}"  method="post">
			<input type="text" placeholder="Username" id="username" name="username">
			<input type="password" placeholder="Password" id="password" name="password">
			<button type="submit"  name="submit">Login</button>
			<div class="forgot"><a href="/members/forgotpsw">Forgot Password ?</a><br><br>
				Not a member? 
				<span id="signUpModal" data-toggle="modal"
				  data-target="#regiModal" href="/members/register"
				    style="font-weight: normal;">
				    &nbsp;<i class="fa fa-long-arrow-right"></i>
				    <a href="javascript:">SignUp Now !</a>
				</span>
            </a>
			</div>
<!-- 		<input name="submit" id="login-button" type="submit" class="btn btn-default" value="Submit" /> -->
			<input type="hidden" 
                     name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
				 <!-- modal -->
	<div class="modal fade" id="regiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body"></div>
	        </div> <!-- content -->
	    </div> <!-- dialog -->
	</div> <!-- m -->
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	
</div>
</div>

<script type="text/javascript" src="/js/fms/swipe.js"></script>
<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/fms/jflickrfeed.js"></script>
<script type="text/javascript" src="/js/fms/fms-main.js"></script>
<script src="/js/loginindex.js"></script>

    
    
    
  </body>
</html>
