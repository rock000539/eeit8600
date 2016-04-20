<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="tw.com.softleader.eeit8600.book.service.BookService" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
	BookService bookService = new BookService();
	pageContext.setAttribute("models", bookService.getAll());
	%>
	
	
	<table border='1'>
		<tr>
			<th>ISBN 號</th>
			<th>書名</th>
			<th>作者</th>
			<th>定價</th>
		</tr>
		
		<c:forEach items="${models}" var="item" varStatus="status">
			<tr>
				<td>${item.isbnNo}</td>
				<td>${item.name}</td>
				<td>${item.author}</td>
				<td>${item.price}</td>
			</tr>
		</c:forEach>
	
	</table>
	
	

	<hr/>
	<a href="${pageContext.request.contextPath}/">Back</a>
</body>
</html>