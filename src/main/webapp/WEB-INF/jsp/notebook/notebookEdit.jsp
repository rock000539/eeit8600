<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notebooks Edit</title>
</head>
<body>
<h2>Notebooks Edit</h2>
	<form action="/notebooks/update" method="post">
		<table>
			<tr>
				<td>編號 </td>
				<td><input type="text" name="id" value="${notebook.id}" readonly></td>
				<td></td>
			</tr>
			<tr>
				<td>品牌 </td>
				<td><input type="text" name="brand" value="${notebook.brand}"></td>
				<td style="color: red;">${errorMsg.brand}</td>
			</tr>

			<tr>
				<td>品名 </td>
				<td><input type="text" name="name" value="${notebook.name}"></td>
				<td style="color: red;">${errorMsg.name}</td>
			</tr>
			<tr>
				<td>中央處理器</td>
				<td><input type="text" name="cpu" value="${notebook.cpu}"></td>
				<td style="color: red;">${errorMsg.cpu}</td>
			</tr>
			<tr>
				<td>價格</td>
				<td><input type="text" name="price" value="${notebook.price}"></td>
				<td style="color: red;">${errorMsg.price}</td>
			</tr>
		</table>
		<hr />
		<input type="submit" name="save" value="save" /> 
		<input type="button" name="cancel" value="cancel" 
				onClick="location='/notebooks/list'"/> 
		<br /><br />

		<c:if test="${not empty result}">
			Add Data「${result}」
		</c:if>
		<c:if test="${result == 'Success'}">
			<table border='1'>
				<tr>
					<th>編號</th>
					<th>品牌</th>
					<th>品名</th>
					<th>中央處理器</th>
					<th>價格</th>
				</tr>
				<tr style="text-align: center;">
					<td>${notebook.id}</td>
					<td>${notebook.brand}</td>
					<td>${notebook.name}</td>
					<td>${notebook.cpu}</td>
					<td>${notebook.price}</td>
				</tr>
			</table>
		</c:if>
	</form>
</body>
</html>