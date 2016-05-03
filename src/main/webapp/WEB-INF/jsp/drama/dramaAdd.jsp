<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Drama Add</title>
</head>
<body>
<h2>Drama Add</h2>
<form action="/dramas/insert" method="post">
	<table>
		<tr>
			<td>劇名：</td>
			<td><input type="text" name="name" value="${param.name}"></td>
			<td style="color:red;">${errorMsg.name}</td>
		</tr>
		<tr>
			<td>集數：</td>
			<td><input type="text" name="episodes" value="${param.episodes}"></td>
			<td style="color:red;">${errorMsg.episodes}</td>
		</tr>
		<tr>
			<td>主演：</td>
			<td><input type="text" name="actor" value="${param.actor}"></td>
			<td style="color:red;">${errorMsg.actor}</td>
		</tr>
		<tr>
			<td>頻道：</td>
			<td><input type="text" name="channel" value="${param.channel}"></td>
			<td style="color:red;">${errorMsg.channel}</td>
		</tr>
	</table>
<input type="submit" name="save" value="save" />
<input type="button" name="cancel" value="cancel" onclick="location='/dramas/list'"/>
</form>
</body>
</html>