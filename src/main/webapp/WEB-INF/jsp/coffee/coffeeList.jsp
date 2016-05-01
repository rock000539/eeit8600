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

<c:forEach items="${coffees}" var="item">
	${item} <br/>
</c:forEach>
<li><a href="${pageContext.request.contextPath}/coffees/add">Add</a></li> 
<li><a href="${pageContext.request.contextPath}/coffees/update">Update</a></li>
<li><a href="${pageContext.request.contextPath}/coffees/delete">delete</a></li>
</body>
</html>