<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Categories Add</title>
</head>
<body>
<h2>Categories Add</h2>
	<form action="/categories/insert" method="post">
		<table>
			<tr>
				<td>種類</td>
				<td><input type="text" name="kind" value="${param.categoryName}"></td>
				<td style="color: red;">${errorMsg.categoryName}</td>
			</tr>

			<tr>
				<td>PIC</td>
				<td><input type="text" name="level" value="${param.categoryImg}"></td>
				<td style="color: red;">${errorMsg.categoryImg}</td>
			</tr>
		</table>
		<hr />
		<input type="button" name="save" value="save" /> 
		<input type="button" name="cancel" value="cancel" 
				onClick="location='/categories/list'"/> 
		<br /><br />

		<c:if test="${not empty result}">
			Add Data「${result}」
		</c:if>
		<c:if test="${result == 'Success'}">
			<table border='1'>
				<tr>
					<th>編號</th>
					<th>種類</th>
					<th>PIC</th>
				</tr>
				<tr style="text-align: center;">
					<td>${category.categoryId}</td>
					<td>${category.categoryName}</td>
					<td>${category.categoryImg}</td>
				</tr>
			</table>
		</c:if>
	</form>
</body>
</html>