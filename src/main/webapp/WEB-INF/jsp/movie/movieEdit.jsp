<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movies Edit</title>
</head>
<body>
<h2>Movie Edit</h2>
	<form action="/movies/update" method="post">
		<table>
			<tr>
				<td>編號</td>
				<td><input type="text" name="id" value="${movie.id}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>電影名稱</td>
				<td><input type="text" name="name" value="${movie.name}">
				<font color="red" size="1">${errorMsg.nameError}</font></td>
			</tr>
			<tr>
				<td>主要演員</td>
				<td><input type="text" name="actor" value="${movie.actor}">
				<font color="red" size="1">${errorMsg.actorError}</font></td>
			</tr>
			<tr>
				<td>電影類型</td>
				<td><input type="text" name="genre" value="${movie.genre}">
				<font color="red" size="1">${errorMsg.genreError}</font></td>
			</tr>
			<tr>
				<td>評分</td>
				<td><input type="text" name="rating" value="${movie.rating}">
				<font color="red" size="1">${errorMsg.ratingError}</font></td>
			</tr>
			<tr>
				<td><input type="submit" value="Save"></td>
				<td><input type="button" value="Cancel" onclick='window.location="/movies/list"'></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<h4>${msg}${result}</h4>
</body>
</html>