<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ErrorPage</title>
</head>
<body>
	<h1>App資料新增失敗</h1>
	<c:if test="${not empty ErrorMsg}">
		<font color='red'>
		<h3>請修改下列錯誤：<h3>
			<ol>
				<c:forEach var="aMsg" items="${ErrorMsg}">
					<li><h5>${aMsg}</h5></li>
				</c:forEach>
			</ol>
		</font>
	</c:if>
</body>
</html>