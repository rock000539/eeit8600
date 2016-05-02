<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Drama List</title>
<style>
table{
width: 500px;
border-collapse:collapse;
}
th,td{
border:1px solid black;
text-align:center;
}
</style>
</head>
<body>
<h1>Drama List</h1>
<input type="button" name="add" value="add" onclick="location='/dramas/add'"/>
<table>
	<tr>
		<th>編號</th>
		<th>劇名</th>
		<th>集數</th>
		<th>主演</th>
		<th>頻道</th>
	</tr>
	<c:forEach var="drama" items="${dramas}" varStatus="vs">
	<tr>
		<td>${drama.id}</td>
		<td>${drama.name}</td>
		<td>${drama.episodes}</td>
		<td>${drama.actor}</td>
		<td>${drama.channel}</td>
		<td>
     	<input type="button" name="edit" value="edit" onclick="location='/dramas/edit?id=${drama.id}'"/>
		<input type="button" name="delete" value="delete" onclick="location='/dramas/delete?id=${drama.id}'"/>
		</td>
	</tr>
	</c:forEach>	
</table>
</body>
</html>