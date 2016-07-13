<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>存取權限不足</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>

<style>
#titleHead{
text-align : center;}
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
	width: 400px;
	height:200px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
#login-box div{text-align : center;
}
#logoutBtn{float: right;
background-color:#f49A80;
}
</style>
<script src="/src/js/jquery-2.2.4.js"></script>
<script>
$(function(){
	$('#prePage').click(function(){
		history.go(-1);
		})	
})
</script>
</head>
<body>
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
	<div id="titleHead"><h1>權限不足</h1></div>
	<div id="login-box">
		<div><h2>請先登出目前帳號，再重新登入</h2><br></div>

		<form th:action="@{/loginBms}" method="post">
				<input name="button" type="button" value="回前頁" class="btn btn-block " id="prePage"/>
				<input type="button" class="btn btn-warning  btn-block " value="log out" id="logoutBtn"
						onclick="location='/logout'" /></td>
				
			
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
	<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
</body>
</html>