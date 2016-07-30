<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html 
xmlns="http://www.w3.org/1999/xhtml"
xmlns:th="http://www.thymeleaf.org"
xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">>

  <head>
    <meta charset="UTF-8">
    <title>Calm breeze login screen</title>
    
    
    
    
        <link rel="stylesheet" href="/css/loginstyle.css">

    
    
    
  </head>

  <body>

    <div class="wrapper">
	<div class="container">
		<h1>Welcome</h1>
		
		<form class="form" th:action="<c:url value='j_spring_security_check' />"  method="post">
			<input type="text" placeholder="Username" name='username'>
			<input type="password" placeholder="Password" name='password'>
			<button type="submit" id="login-button">Login</button>
		</form>
	</div>
	
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
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/loginindex.js"></script>

    
    
    
  </body>
</html>
