<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GameListPage</title>
<style>
table {
	width: 650px;
	text-align: center;
	line-height: 25px;
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
				<input type="button" name="add" value="Add"style="width: 100px;"
					onClick="location='/games/add'" />
			</td>
			<td>編號</td>
			<td>名稱</td>
			<td>評價</td>
			<td>下載量</td>
			<td>連結</td>
		</tr>

		<c:forEach items="${games}" var="game" varStatus="vs">
			<tr>
				<td><input type="button" name="edit" value="Edit"
					 onClick="location='/games/edit?id=${game.id}'" /></td>
				<td><input type="button" name="delete" value="Delete"
					 onClick="location='/games/delete?id=${game.id}'" /></td>
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