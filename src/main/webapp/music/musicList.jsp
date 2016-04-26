<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="tw.com.softleader.eeit8600.music.service.MusicService" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<%
	MusicService musicService = new MusicService();
	pageContext.setAttribute("models", musicService.getAll());
%>
	
	
	<table border='1'>
		<tr>
			<th>流水號</th>
			<th>樂曲編號</th>
			<th>曲名</th>
			<th>作者</th>
			<th>定價</th>
		</tr>
		
		<c:forEach items="${models}" var="item" varStatus="status">
			<tr>
				<td>${item.id}</td>
				<td>${item.musicNo}</td>
				<td>${item.title}</td>
				<td>${item.author}</td>
				<td>${item.price}</td>
			</tr>
		</c:forEach>
	
	</table>
	
	

	<hr/>
	<a href="${pageContext.request.contextPath}/">Back</a>
</body>
</html>