<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="tw.com.softleader.eeit8600.drama.service.DramaService" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<% DramaService dramaService=new DramaService();
	pageContext.setAttribute("models",dramaService.getAll());%>
	<table border='1'>
		<tr>
			<th>編號</th>
			<th>劇名</th>
			<th>集數</th>
			<th>主角</th>
			<th>頻道</th>
		</tr>
	<c:forEach items="${models}" var="item" varStatus="ststue">
		<tr>
			<td>${item.id}</td>
			<td>${item.name}</td>
			<td>${item.episode}</td>
			<td>${item.actor}</td>
			<td>${item.channel}</td>
		</tr>
	</c:forEach>
	</table>

<hr/>
	<a href="${pageContext.request.contextPath}/">Back</a>
</body>
</html>