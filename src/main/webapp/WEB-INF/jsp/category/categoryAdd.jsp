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
				<td><input type="text" name="kind" value="${param.kind}"></td>
				<td style="color: red;">${errorMsg.kind}</td>
			</tr>

			<tr>
				<td>權重</td>
				<td><input type="text" name="level" value="${param.level}"></td>
				<td style="color: red;">${errorMsg.level}</td>
			</tr>
		</table>
		<hr />
		<input type="submit" name="save" value="save" /> 
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
					<th>權重</th>
				</tr>
				<tr style="text-align: center;">
					<td>${category.id}</td>
					<td>${category.kind}</td>
					<td>${category.level}</td>
				</tr>
			</table>
		</c:if>
	</form>
</body>
<script>
	var data='{"kind":"'+$('#kind').val()+
			'","level":"'+$('#level').val()+'"}';
			
	$.ajax({
		url:"/categories/insert",
		type:"POST",
		contentType:"application/json; charset=UTF-8",
		dataType:"json",
		data:data,
		success:function(response){
			if(response.redirect){
				window.location.href=response.redirect;
			}
			else{
				
			}
		}
		
		
	})		
		

</script>
</html>