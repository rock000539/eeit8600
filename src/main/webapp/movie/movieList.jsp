<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="tw.com.softleader.eeit8600.movie.service.MovieService" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<%
	MovieService movieService = new MovieService();
	pageContext.setAttribute("models", movieService.getAll());
	%>

	<table border='1'>
		<tr>
			<td>編號</td>
			<td>電影名稱</td>
			<td>主演演員</td>
			<td>類型</td>
		</tr>
		
		<c:forEach items="${models}" var="item" varStatus="status">
			<tr>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.actor}</td>
				<td>${item.types}</td>
			</tr>
		</c:forEach>
	</table>
	
	<hr/>
	<a href="${pageContext.request.contextPath}/">Back</a>
</body>
</html>