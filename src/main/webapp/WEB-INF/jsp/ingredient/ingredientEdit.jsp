<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<form action="/ingredient/put" method="put">
		<table>
			<%-- readonly="readonly" --%>
			<tr>
				<td><input type="text" name="ingredId"
					value="${ingredient.ingredId}">ID</td>
				<td>${errorMsg.ingredId}</td>
			</tr>
			<tr>
				<td><input type="text" name="ingredName"
					value="${ingredient.ingredName}">成份</td>
				<td>${errorMsg.ingredName}</td>
			</tr>
			<tr>
				<td><input type="text" name="ingredChName"
					value="${ingredient.ingredChName}">中文</td>
				<td>${errorMsg.ingredChName}</td>
			</tr>
			<tr>
				<td><input type="text" name="ingredChar"
					value="${ingredient.ingredChar}">特性</td>
				<td>${errorMsg.ingredChar}</td>
			</tr>
			<tr>
				<td><input type="text" name="ingredIrritant"
					value="${ingredient.ingredIrritant}">刺激</td>
				<td>${errorMsg.ingredIrritant}</td>
			</tr>
			<tr>
				<td><input type="text" name="ingredAcne"
					value="${ingredient.ingredAcne}">致粉刺性</td>
				<td>${errorMsg.ingredAcne}</td>
			</tr>
			<tr>
				<td><input type="text" name="ingredSafety"
					value="${ingredient.ingredSafety}">安心</td>
				<td>${errorMsg.ingredSafety}</td>
			</tr>
		</table>
		<br>
		<input type="submit" name="update" value="update"><br>
		<input type="button" name="cancel" value="Cancel" onclick='window.location="/ingredient/list"'><br>
		</form>
</body>
</html>