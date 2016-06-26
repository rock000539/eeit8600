<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Drama Edit</title>
</head>
<body>
<h2>Drama Edit</h2>
<form action="/dramas/update" method="post">
	<table>
		<tr>
			<td>編號：</td>
			<td><input type="text" name="id" value="${drama.id}" readonly></td>
		</tr>
		<tr>
			<td>劇名：</td>
			<td><input type="text" name="name" value="${drama.name}"></td>
			<td style="color:red;">${errorMsg.name}</td>
		</tr>
		<tr>
			<td>集數：</td>
			<td><input type="text" name="episodes" value="${drama.episodes}"></td>
			<td style="color:red;">${errorMsg.episodes}</td>
		</tr>
		<tr>
			<td>主演：</td>
			<td><input type="text" name="actor" value="${drama.actor}"></td>
			<td style="color:red;">${errorMsg.actor}</td>
		</tr>
		<tr>
			<td>類型：</td>
			<td><input type="text" name="genre" value="${drama.genre}"></td>
			<td style="color:red;">${errorMsg.genre}</td>
		</tr>
	</table>

<input type="submit" name="save" value="save" />
<input type="button" name="cancel" value="cancel" onclick="location='/dramas/list'"/>
</form>

<hr>
<c:if test="${not empty updateMsg}">
	<h4 style="color:red;">${updateMsg}</h4>
</c:if>
<c:if test="${updateMsg=='更新成功'}">
	Update Drama：<span>id=${drama.id}, name=${drama.name}, episodes=${drama.episodes}, 
	actor=${drama.actor}, genre=${drama.genre}</span>
</c:if>
</body>
</html>