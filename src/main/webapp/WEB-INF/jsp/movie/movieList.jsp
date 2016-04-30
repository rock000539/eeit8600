<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie List</title>
</head>
<body>
<h1>MovieList</h1>
<input type="button" value="add" onclick='window.location="/movies/add"'>
<form action="/add" method="post">
<table border="1">
<form>
<tr align='center'><th>編號</th><th>電影名稱</th><th>主要演員</th><th>電影類型</th></tr>
<c:forEach var="item" items="${movies}" varStatus="vs">
	<tr>
		<td>${item.id }</td>
		<td>${item.name }</td>
		<td>${item.actor }</td>
		<td>${item.genre }</td>
		<td><input type="button" value="edit" onclick='window.location="/movies/edit"'></td>
		<td><input type="button" value="delete"></td>
	</tr>
</c:forEach>
</form>
</table>
</form>
</body>
</html>