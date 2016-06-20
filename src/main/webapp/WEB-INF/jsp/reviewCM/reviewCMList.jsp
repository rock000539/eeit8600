<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReviewCM List</title>
<style>
table{border:1px solid black;
	  width:600px;}
th,td{border:1px solid black;
	  text-align:center;}
</style>
</head>
<body>
<h2>ReviewCM List</h2>
<input type="button" name="add" value="add" onClick="location='/reviewCMs/add'">
<table>
<thead align='center'>
	<tr>
		<th>心得留言id</th>
		<th>心得id</th>
		<th>內容</th>
		<th>會員id</th>
		<th>顯示</th>
		<th>被檢舉次數</th>
	</tr>
</thead>
<tbody align='center'>
	<c:forEach var='reviewCM' items="${reviewCMs}">
	<tr>
		<td>${reviewCM.rcmId}</td>
		<td>${reviewCM.reviewId}</td>
		<td>${reviewCM.rcmMsg}</td>
		<td>${reviewCM.memberId}</td>
		<td>${reviewCM.rcmShow}</td>
		<td>${reviewCM.rcmReport}</td>

		<td><input type="button" name="edit" value="edit" onClick="location='/reviewCMs/edit?rcmId=${reviewCM.rcmId}'"></td>
		<td><input type="button" name="delete" value="delete" onClick="location='/reviewCMs/delete?rcmId=${reviewCM.rcmId}'"></td>
	</tr>	
</c:forEach>
</tbody>
</table>
</body>
</html>