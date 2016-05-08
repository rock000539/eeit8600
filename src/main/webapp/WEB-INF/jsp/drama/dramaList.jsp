<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Drama List</title>
<style>
*{margin:5px;}
table{
width: 700px;
border-collapse:collapse;
}
th,td{
border:1px solid black;
text-align:center;
}
</style>
<script>
function find(name){
	document.forms[0].action="/dramas/"+name;
	document.forms[0].submit();
}

</script>
</head>
<body>
<h1>Drama List</h1>
<input type="button" name="add" value="add" onclick="location='/dramas/add'"/><br>

<form>
<input type="text" name="inputbox" placeholder="searching" value="${param.inputbox}"/>
<input type="button" name="findname" value="找戲劇" onclick="find(this.name);"/>
<input type="button" name="findactor" value="找演員" onclick="find(this.name);"/>
<span style="color:red">${findMsg}</span>
</form>

<!-- <form> -->
<!-- <select name="genresel" onchange="select(this.selectedIndex);"> -->
<!-- 	<option value="0"></option> -->
<!-- 	<option value="1">Comedy</option> -->
<!-- 	<option value="2">Drama</option> -->
<!-- 	<option value="3">Mystery</option> -->
<!-- 	<option value="4">Action</option> -->
<!-- 	<option value="5">Horror</option> -->
<!-- 	<option value="6">Supernatural</option> -->
<!-- </select> -->
<!-- <input type="button" name="findgenre" value="找類型" onclick="select(this.selectedIndex)"/> -->
<!-- </form> -->

<table>
	<tr>
		<th>編號</th>
		<th>劇名</th>
		<th>集數</th>
		<th>主演</th>
		<th>類型</th>
	</tr>
	<c:forEach var="drama" items="${dramas}" varStatus="vs">
	<tr>
		<td>${drama.id}</td>
		<td>${drama.name}</td>
		<td>${drama.episodes}</td>
		<td>${drama.actor}</td>
		<td>${drama.genre}</td>
		<td>
     	<input type="button" name="edit" value="edit" onclick="location='/dramas/edit?id=${drama.id}'"/>
		<input type="button" name="delete" value="delete" onclick="location='/dramas/delete?id=${drama.id}'"/>
		</td>
	</tr>
	</c:forEach>	
</table>
</body>
</html>