<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<h1>CoffeeEdit</h1>
<form action="/coffees/update" method="post">
<table> <%-- readonly="readonly" --%>
<tr><td><input type="text" neme="id" value="${coffees.id}">ID</td></tr>
<tr><td><input type="text" name="name" value="${coffees.name}">名字</td></tr>
<tr><td><input type="text" name="local" value="${coffees.local}">產地</td></tr>
<tr><td><input type="text" name="price" value="${coffees.price}">價錢</td></tr>
<tr><td><input type="text" name="testing" value="${coffees.testing}">試用</td></tr>
</table><br>


<input type="submit" name="update" value="update"><br>
<input type="submit" neame="delete" value="delete"><br>
<input type="button" name="cancel" value="Cancel" onclick='window.location="/coffees/list"'><br>
</form>
<%--
<table>
<tr align='center'><th>編號</th><th>咖啡名</th><th>產地</th><th>價錢</th><th>試用</th></tr>
<c:forEach items="${coffees}" var="item">
	<tr>
		<td>${item.id}</td>
		<td>${item.name}</td>
		<td>${item.local}</td>
		<td>${item.price}</td>
		<td>${item.testing}</td>

		<td><a href="/coffees/edit?id=${item.id}"> edit </a></td>
		<td><a href="/coffees/delete?id=${item.id}"> delete </a></td>
	</tr>
	<br/>
</c:forEach>
</table>
 --%>
<a href src="coffeeAdd.jsp">add</a>
<a href src="coffeeEdit.jsp">add</a>
</body>
</html>