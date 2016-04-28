<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GameList</title>
<style>
	table {
		width: 650px;
		text-align: center;
		border-collapse: collapse;
		margin: 0 auto;
	}

	th, td {
		border: 2px solid gray;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td colspan="2">
				<input type="button" name="add" value="Add" disabled="disabled"/>
			</td>
			<td colspan="5">
				進階搜尋區塊(施工中)
			</td>
		<tr>
		
		<tr>
			<th></th>
			<th></th>
			<th>編號</th>
			<th>名稱</th>
			<th>評價</th>
			<th>下載量</th>
			<th>連結</th>
		</tr>
		
		<c:forEach items="${games}" var="game" varStatus="vs">
			<tr>
				<td><input type="button" name="edit" value="Edit" disabled="disabled"/></td>
				<td><input type="button" name="edit" value="Delete" disabled="disabled"/></td>
				<td>${game.id}</td>
				<td>${game.name}</td>
				<td>${game.evaluation}</td>
				<td>${game.download}</td>
				<td>${game.url}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>