<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/src/js/jquery.validate.min.js"></script>
<title>Categories Edit</title>
</head>
<body>
<h1>Categories Edit</h1>
	<form id="theForm" enctype="multipart/form-data">
		<table>
			<tr>
				<td>編號 </td>
				<td><input type="text" name="categoryId" value="${category.categoryId}" readonly='readonly'></td>
				<td></td>
			</tr>
			<tr>
				<td>種類 </td>
				<td><input type="text" name="categoryName" value="${category.categoryName}"></td>
				<td style="color: red;">${errorMsg.kind}</td>
			</tr>
			<tr>
				<td>PIC </td>
				<td><input type="text" name="categoryImg" value="${category.categoryImg}"></td>
				<td style="color: red;">${errorMsg.level}</td>
			</tr>
		</table>
		<hr />
		<input type="button" name="save" value="save" id="save"/> 
		<input type="button" name="cancel" value="cancel" 
				onClick="location='/categories/list'"/> 
		<br /><br />
		<div id='result'>
		<h2></h2>
		<span id="categoryName"></span><br/>
		<span id="categoryImg"></span><br/>
		</div>

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
<script type="text/javascript">
$(function(){
	$.ajax({
		url:'/categories/update',
		type:'post',
		contentType:'application/json;charset=utf-8',
		data:JSON.stringify($('#theForm').serializeObject()),
		dataType:'json',
		success:function(data){
			console.log(data);
			$('h2').text('Update Success');
			$('#categoryName').text('name'+data.categoryName);
			$('#categoryImg').text('PIC'+data.categoryImg);
		}
	});
	
	$.fn.serializeObject = function()
	{
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	        if (o[this.name] !== undefined) {
	            if (!o[this.name].push) {
	                o[this.name] = [o[this.name]];
	            }
	            o[this.name].push(this.value || '');
	        } else {
	            o[this.name] = this.value || '';
	        }
	    });
	    return o;
	};
})
</script>
</body>
</html>