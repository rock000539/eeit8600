<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="tw.com.softleader.eeit8600.app.service.AppService"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SELECT ALL</title>
<style>
	table {
		width: 450px;
		text-align: center;
		border-collapse: collapse;
		margin: 0 auto;
	}

	th, td {
		border: 2px solid gray;
	}

	a {
		margin: 0 48%;
	}
</style>
</head>
<body>
	<%
		AppService appService = new AppService();
		pageContext.setAttribute("models", appService.select(null));
	%>

	<table>
		<tr>
			<th>編號</th>
			<th>名稱</th>
			<th>評價</th>
			<th>下載量</th>
			<th>連結</th>
		</tr>

		<c:forEach items="${models}" var="item" varStatus="status">
			<tr>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.evaluation}</td>
				<td>${item.download}</td>
				<td>${item.url}</td>
			</tr>
		</c:forEach>
	</table>

	<hr />
	<a href="${pageContext.request.contextPath}/">Back</a>
</body>
</html>