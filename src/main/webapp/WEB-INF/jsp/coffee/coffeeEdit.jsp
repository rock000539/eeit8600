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
<table>
<tr><td><input type="text" neme="id">ID</td></tr>
<tr><td><input type="text" name="name">名字</td></tr>
<tr><td><input type="text" name="local">產地</td></tr>
<tr><td><input type="text" name="price">價錢</td></tr>
<tr><td><input type="text" name="testing">試用</td></tr>
</table><br>


<input type="submit" name="update" value="update"><br>
<input type="submit" neame="delete" value="delete"><br>
<input type="button" name="cancel" value="Cancel" onclick='window.location="/coffees/list"'><br>
</form>

<c:forEach items="${coffees}" var="item">
	${item} <br/>
</c:forEach>
<h4>${msg}${result}</h4>
</body>
</html>