<%@page import="tw.com.softleader.eeit8600.coffee.service.CoffeeService"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<% CoffeeService coffeeService=new CoffeeService();
	pageContext.setAttribute("models", coffeeService.getAll());
	%>

	
	<table border='1'>
		<tr>
			<th>ID編號</th>
			<th>名子</th>
			<th>產地</th>
			<th>試用</th>
			<th>定價</th>
		</tr>
		
		<c:forEach items="${models}" var="item" varStatus="status">
			<tr>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.local}</td>
				<td>${item.testing}</td>
				<td>${item.price}</td>
			</tr>
		</c:forEach>
	
	</table>
	
	

	<hr/>
	<a href="${pageContext.request.contextPath}/">Back</a>
</body>
</html>