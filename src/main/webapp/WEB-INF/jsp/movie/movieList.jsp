<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie List</title>
<style type="text/css">
	td{
		text-align: center;
	}
</style>
<script type="text/javascript">
function query(name){
	document.forms[0].action="/movies/"+name;
	document.forms[0].submit();
}

</script>
</head>
<body>
<h1>MovieList</h1>
<button type="button" onClick="window.location='/movies/add'">新增資料</button>
<button type="button" onClick="window.location='/movies/loadData'">loadData</button>
<button type="button" onClick="window.location='/movies/list'">全部列表</button>
<br>
<br>
<form action="">
<input type="text" name="data" size="40">
<input type="button" name="name" value="找電影" onclick="query(name)" >
<input type="button" name="actor" value="找演員" onclick="query(name)" >
<input type="button" name="genre" value="找類型" onclick="query(name)" >
</form>
<br><br>
<table border="1" cellspacing="0" cellpadding="2">
<tr align='center'>
	<th width="40">編號</th>
	<th width="200">電影名稱</th>
	<th width="180">主要演員</th>
	<th width="80">電影類型</th>
	<th width="40">評分</th>
</tr>
<c:forEach var="item" items="${movies}" varStatus="vs">
	<tr>
		<td>${item.id}</td>
		<td>${item.name}</td>
		<td>${item.actor}</td>
		<td>${item.genre}</td>
		<td>${item.rating}</td>
		<td><input type="button" name="edit" value="edit" onclick='location="/movies/edit?id=${item.id}"'></td>
		<td><input type="button" name="delete" value="delete" onclick='location="/movies/delete?id=${item.id}"'></td>
	</tr>
</c:forEach>
</table>
<h3>${result}</h3>
<br>
<br>

</body>
</html>