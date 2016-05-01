<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie Add</title>
</head>
<body>
	<h2>Movie Add</h2>
	<form action="/movies/add" method="post">
		<table>
			<tr>
				<td>電影名稱</td>
				<td><input type="text" name="name" value=""></td>
			</tr>
			<tr>
				<td>主要演員</td>
				<td><input type="text" name="actor" value=""></td>
			</tr>
			<tr>
				<td>電影類型</td>
				<td><input type="text" name="genre" value=""></td>
			</tr>
			<tr>
				<td><input type="submit" name="insert" value="Save"></td>
				<td><input type="button" name="cancel" value="Cancel" onclick='window.location="/movies/list"'></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<h3>${msg}${result}</h3>
</body>
</html>