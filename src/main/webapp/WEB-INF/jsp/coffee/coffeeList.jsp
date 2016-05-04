<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coffee List</title>
</head>
<body>
<h1>CoffeeList in WEB-INF</h1>
<a href="add">Add page</a><br>

<input type="button" value="addData" onclick="location='/coffees/addData'">
<table>
<tr align='center'><th>編號</th><th>咖啡名</th><th>產地</th><th>價錢</th><th>試用</th></tr>
<c:forEach var="item" items="${coffees}" >
	<tr>
		<td>${item.id}</td>
		<td>${item.name}</td>
		<td>${item.local}</td>
		<td>${item.price}</td>
		<td>${item.testing}</td>
		<td><a href="/coffees/edit?id=${item.id}"> edit </a></td>
		<td><a href="/coffees/delete?id=${item.id}"> delete </a></td>
	</tr>
</c:forEach>
<br/>
</table>

</body>
</html>