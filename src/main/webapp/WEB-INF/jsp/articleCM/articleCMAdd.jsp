<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ArticleCM Add</title>
<style>
.error {
	color: red;
	font-style: italic;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/src/js/jquery.validate.min.js"></script>
</head>
<body>
<h1>ArticleCM Add</h1>
	<form id="theForm" enctype="multipart/form-data">
		<table>
			<tr>
				<td>文章id</td>
				<td><input type="text" name="articleId" value="${param.articleId}"></td>
			</tr>
			<tr>
				<td>內容</td>
				<td><input type="text" name="acmMsg" value="${param.acmMsg}"></td>
			</tr>
			<tr>
				<td>會員id</td>
				<td><input type="text" name="memberId" value="${param.memberId}"></td>
			</tr>
			<tr>
				<td>顯示</td>
				<td><input type="text" name="acmShow" value="${param.acmShow}"></td>
			</tr>
			<tr>
				<td>被檢舉次數</td>
				<td><input type="text" name="acmReport" value="${param.acmReport}"></td>
			</tr>
		</table>
		<hr />
		<input type="button" name="save" value="save" id="save"/> 
		<input type="button" name="cancel" value="cancel" 
				onClick="location='/articleCMs/list'"/> 
		
		<div id='result'>
		<h2></h2>
		<span id="articleId"></span><br/>
		<span id="acmMsg"></span><br/>
		<span id="memberId"></span><br/>
		<span id="acmShow"></span><br/>
		<span id="acmReport"></span><br/>
		</div>
	</form>
<script type="text/javascript">
$(function(){
	$(':text:first').focus();
	$('#theForm').validate({
		onfocusout : function(element){
			$(element).valid();
		},
		rules:{
			articleId:{
				required:true,
			},
			acmMsg:{
				required:true,
			},
			memberId:{
				required:true,
			},
			acmShow:{
				required:true,
			},
			acmReport:{
				required:true,
			},
		},//end of rules
		messages:{
			articleId:{
				required:"必填項目",
			},
			acmMsg:{
				required:"必填項目",
			},
			memberId:{
				required:"必填項目",
			},
			acmShow:{
				required:"必填項目",
			},
			acmReport:{
				required:"必填項目",
			},
		}//end of messages	
	});//end of validate
	

	$('#save').click(function(){
		console.log(JSON.stringify($('#theForm').serializeObject()));
		if($('#theForm').validate().form()){
			$.ajax({
				url:'/articleCMs/insert',
				type:'post',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify($('#theForm').serializeObject()),
				dataType:'json',
				success:function(data){
					console.log(data);
					$(':text').val("");
					$('h2').text('Insert Success');
					
					$('#articleId').text('文章id='+data.articleId);
					$('#acmMsg').text('內容='+data.acmMsg);
					$('#memberId').text('會員id='+data.memberId);
					$('#acmShow').text('顯示='+data.acmShow);
					$('#acmReport').text('被檢舉次數='+data.acmReport);
				}
			});
		}else{
			alert('請依訊息更正錯誤');
		}
	})//end of click
	
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