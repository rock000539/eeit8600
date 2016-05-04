<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<h1>CoffeeADD</h1>

<form action="/coffees/add" method="post">${test}
<table>
<tr><td><input type="text" name="id" value="${coffee.id}">ID</td><td>${errorMsg.Id}</td></tr>
<tr><td><input type="text" name="name" value="${coffee.name}">名字</td><td>${errorMsg.Name}</td></tr>
<tr><td><input type="text" name="local" value="${coffee.local}">產地</td><td>${errorMsg.Local}</td></tr>
<tr><td><input type="text" name="price" value="${coffee.price}">價錢</td><td>${errorMsg.Price}</td></tr>
<tr><td><input type="text" name="testing" value="${coffee.testing}">試用</td><td>${errorMsg.Testing}</td></tr>
</table><br>

<input type="submit" value="add" value="add"><br>

<input type="button" name="cancel" value="Cancel" onclick='window.location="/coffees/list"'>
</form>


</body>
</html>