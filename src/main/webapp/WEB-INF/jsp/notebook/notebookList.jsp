<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notebook List</title>
<style>
table{border:1px solid black;
	  width:600px;}
th,td{border:1px solid black;
	  text-align:center;}
</style>
</head>
<body>
<h2>Notebook List</h2>
<input type="button" name="add" value="add" onClick="location='/notebooks/add'"/>
<table>
<tr>
	<th>編號</th>
	<th>品牌</th>
	<th>品名</th>
	<th>中央處理器</th>
	<th>價格</th>
</tr>
<c:forEach items="${notebooks}" var="notebook">
 <tr>
	<td>${notebook.id}</td>
	<td>${notebook.brand}</td>
	<td>${notebook.name}</td>
	<td>${notebook.cpu}</td>
	<td>${notebook.price}</td>
	<td><input type="button" name="edit" value="edit" onClick="location='/notebooks/edit?id=${notebook.id}'"></td>
	<td><input type="button" name="delete" value="delete" onClick="location='/notebooks/delete?id=${notebook.id}'"></td>
</tr>
	
</c:forEach>
</table>
</body>
</html>