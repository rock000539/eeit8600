<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie List</title>
<style type="text/css">
	td{
		padding:1px;
		padding-left:2px;
		padding-right:2px;
	}
	a{
		width:40px;
		display:block;
		background-color:#E0E0E0;
		border-radius: 3px;
		text-align:center;
	}
	a:link{text-decoration: none; color:black;}
	a:visited{text-decoration: none; color:black;}
</style>
</head>
<body>
<h1>MovieList</h1>
<button type="button" onClick="window.location='/movies/add'">add</button>
<button type="button" onClick="window.location='/movies/loadData'">loadData</button>

<table border="1">
<tr align='center'><th>編號</th><th>電影名稱</th><th>主要演員</th><th>電影類型</th></tr>
<c:forEach var="item" items="${movies}" varStatus="vs">
	<tr>
		<td>${item.id }</td>
		<td>${item.name }</td>
		<td>${item.actor }</td>
		<td>${item.genre }</td>

		<td><a href="/movies/edit?id=${item.id}"> edit </a></td>
		<td><a href="/movies/delete?id=${item.id}"> delete </a></td>
	</tr>
</c:forEach>
</table>
<br>
<br>

</body>
</html>