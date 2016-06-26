<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ArticleCM List</title>
<style>
table{border:1px solid black;
	  width:600px;}
th,td{border:1px solid black;
	  text-align:center;}
</style>
</head>
<body>
<h2>ArticleCM List</h2>
<input type="button" name="add" value="add" onClick="location='/articleCMs/add'">
<table>
<thead align='center'>
	<tr>
		<th>文章留言id</th>
		<th>文章id</th>
		<th>內容</th>
		<th>會員id</th>
		<th>顯示</th>
		<th>被檢舉次數</th>
	</tr>
</thead>
<tbody align='center'>
	<c:forEach var='articleCM' items="${articleCMs}">
	<tr>
		<td>${articleCM.acmId}</td>
		<td>${articleCM.articleId}</td>
		<td>${articleCM.acmMsg}</td>
		<td>${articleCM.memberId}</td>
		<td>${articleCM.acmShow}</td>
		<td>${articleCM.acmReport}</td>

		<td><input type="button" name="edit" value="edit" onClick="location='/articleCMs/edit?acmId=${articleCM.acmId}'"></td>
		<td><input type="button" name="delete" value="delete" onClick="location='/articleCMs/delete?acmId=${articleCM.acmId}'"></td>
	</tr>	
</c:forEach>
</tbody>
</table>
</body>
</html>