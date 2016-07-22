<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html
xmlns="http://www.w3.org/1999/xhtml"
xmlns:th="http://www.thymeleaf.org"
xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    <link rel="stylesheet" href="/css/font-awesome.css"/>
	<link rel="stylesheet" href="/css/fms/styleForLogin.css"> 
<style>
.error {
    padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
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
}

#login-box {
    width: 380px;
    padding: 20px;
    margin: 100px auto;
    background: #fff;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border: 1px solid #000;
}
.wrapper{
margin-top:0;}
</style>

</head>
<body >
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
<div class="grey_bg row">
 <div id="login-box">
    <h2>Login with Username and Password</h2>
    
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        <c:if test="${not empty msg}">
            <div class="msg">${msg}</div>
        </c:if>
        
        <form th:action="<c:url value='j_spring_security_check' />"  method="post">
            <table>
            <tr>
                <td>User :</td>
                <td><input type='text' name='username' value=''><br></td>
            </tr>
            <tr>
                <td>Password :</td>
                <td><input type='password' name='password' /></td>
            </tr>				
            <tr>
            <td><br></td>
            </tr>
            <tr>
                 <td colspan='2'>
                 <sec:authorize access="hasRole('ROLE_USER')"> 
                 <input type="button" value="log out"  class="btn" onclick="location='/logout'"/>
                 </sec:authorize>
                 </td>

                 <td colspan='2'>
                                <input name="submit" type="submit" class="btn btn-default" value="Submit" />
                                </td>  
            </tr>
           </table>
                    <input type="hidden" 
                     name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
       </div>
      </div>
 <!-- ------------------------------------------------ -->
 <!--start footer------------------------------------------------------------------------->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/js/fms/swipe.js"></script>
<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/fms/jflickrfeed.js"></script>
<script type="text/javascript" src="/js/fms/fms-main.js"></script>
</body>
</html>