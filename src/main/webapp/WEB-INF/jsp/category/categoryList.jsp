<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Category List</title>
<style>
table{border:1px solid black;
	  width:600px;}
th,td{border:1px solid black;
	  text-align:center;}
	  
</style>
</head>
<body>
<h2>Category List</h2>
<input type="button" name="add" value="add" onClick="location='/categories/add'"/>
<table>
<tr>
	<th>編號</th>
	<th>種類</th>
	<th>PIC</th>
</tr>
<c:forEach items="${categories}" var="category">
 <tr>
	<td>${category.categoryId}</td>
	<td>${category.categoryName}</td>
	<td>${category.categoryImg}</td>
	<td><input type="button" name="edit" value="edit" onClick="location='/categories/edit?categoryId=${category.categoryId}'"></td>
	<td><input type="button" name="delete" value="delete" onClick="location='/categories/delete?categoryId=${category.categoryId}'"></td>
</tr>
	
</c:forEach>
</table>
</body>
</html>