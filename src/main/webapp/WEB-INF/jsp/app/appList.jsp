<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>App List</title>
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
	<table>
		<tr>
			<th>編號</th>
			<th>名稱</th>
			<th>評價</th>
			<th>下載量</th>
			<th>連結</th>
		</tr>

		<c:forEach items="${apps}" var="app" varStatus="status">
			<tr>
				<td>${app.id}</td>
				<td>${app.name}</td>
				<td>${app.evaluation}</td>
				<td>${app.download}</td>
				<td>${app.url}</td>
			</tr>
		</c:forEach>
	</table>

	<hr />
</body>
</html>