<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GameListPage</title>
<style>
table {
	width: 650px;
	text-align: center;
	line-height: 25px;
	border-collapse: collapse;
	margin: 0 auto;
}

th, td {
	border: 2px solid gray;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		
	}
	
	function init(){
		document.getElementById("attr").addEventListener("change", function() {
			attrOnChange(this.value);
		});
	}

	function attrOnChange(value) {
		if (value == "id" || value == "evalu" || value == "dl") {
			
		} else if (value == "name" || value == "dl") {
			
		}
	}
	
	function condiCheck(){
		
	}
</script>
</head>
<body>
	<table>
		<tr>
			<td colspan="7">
				<form>
					<b>欄位選擇：</b> <select name="attr">
						<option value="id">編號</option>
						<option value="name">名稱</option>
						<option value="evalu">評價</option>
						<option value="dl">下載量</option>
						<option value="url">連結</option>
					</select> <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜尋條件：</b> 
					<select name="condi">
						<option value="gt">大於</option>
						<option value="gte">大於等於</option>
						<option value="lt">小於</option>
						<option value="lte">小於等於</option>
						<option value="equal">等於</option>
						<option value="te">完全相符</option>
						<option value="tne">完全不相符</option>
						<option value="con">包含</option>
						<option value="ncon">不包含</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="search"
						value="進階搜尋" onClick="" />
				</form>
			</td>
		</tr>

		<tr>
			<td colspan="2"><input type="button" name="add" value="Add"
				style="width: 100px;" onClick="location='/games/add'" /></td>
			<td>編號</td>
			<td>名稱</td>
			<td>評價</td>
			<td>下載量</td>
			<td>連結</td>
		</tr>

		<c:forEach items="${games}" var="game" varStatus="vs">
			<tr>
				<td><input type="button" name="edit" value="Edit"
					onClick="location='/games/edit?id=${game.id}'" /></td>
				<td><input type="button" name="delete" value="Delete"
					onClick="location='/games/delete?id=${game.id}'" /></td>
				<td>${game.id}</td>
				<td>${game.name}</td>
				<td>${game.evaluation}</td>
				<td>${game.download}</td>
				<td>${game.url}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>