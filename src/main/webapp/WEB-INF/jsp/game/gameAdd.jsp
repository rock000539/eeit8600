<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GameAddPage</title>
</head>
<body>
	<form action="/games/insert" method="post">
		<table>
			<tr>
				<td>名稱 :</td>
				<td><input type="text" name="name" value="${param.name}"></td>
				<td style="color: red;">${errorMsg.name}</td>
			</tr>

			<tr>
				<td>評價 :</td>
				<td><input type="text" name="evalu" value="${param.evalu}"></td>
				<td style="color: red;">${errorMsg.evalu}</td>
			</tr>
			<tr>
				<td>下載量 :</td>
				<td><input type="text" name="dl" value="${param.dl}"></td>
				<td style="color: red;">${errorMsg.dl}</td>
			</tr>
			<tr>
				<td>連結 :</td>
				<td><input type="text" name="url" value="${param.url}"></td>
				<td style="color: red;">${errorMsg.url}</td>
			</tr>
		</table>
		<hr />
		<input type="submit" name="save" value="save" /> 
		<input type="button" name="cancel" value="cancel" 
				onClick="location='/games/list'"/> 
		<br /><br />

		<c:if test="${not empty result}">
			Add Data「${result}」
		</c:if>
		<c:if test="${result == 'Success'}">
			<table border='1'>
				<tr>
					<th>編號</th>
					<th>名稱</th>
					<th>評價</th>
					<th>下載量</th>
					<th>連結</th>
				</tr>
				<tr style="text-align: center;">
					<td>${game.id}</td>
					<td>${game.name}</td>
					<td>${game.evaluation}</td>
					<td>${game.download}</td>
					<td>${game.url}</td>
				</tr>
			</table>
		</c:if>
	</form>
</body>
</html>