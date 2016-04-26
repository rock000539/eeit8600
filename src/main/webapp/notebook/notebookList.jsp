<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="tw.com.softleader.eeit8600.notebook.service.NotebookService" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
	NotebookService notebookService = new NotebookService();
	pageContext.setAttribute("models", notebookService.getAll());
	%>
	
	
	<table border='1' style="margin:0 auto">
		<tr>
			<th>編號</th>
			<th>廠牌</th>
			<th>機型</th>
			<th>中央處理器</th>
			<th>定價</th>
		</tr>
		
		<c:forEach items="${models}" var="item" varStatus="status">
			<tr>
				<td>${item.id}</td>
				<td>${item.brand}</td>
				<td>${item.name}</td>
				<td>${item.cpu}</td>
				<td>${item.price}</td>
			</tr>
		</c:forEach>
	
	</table>
	
	

	<hr/>
	<a href="${pageContext.request.contextPath}/">Back</a>
</body>
</html>