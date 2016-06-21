<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/src/js/jquery.validate.min.js"></script>
<title>ArticleCM Edit</title>
<style>
.error {
	color: red;
	font-style: italic;
}
</style>
</head>
<body>
<h1>ArticleCM Edit</h1>
<form id="theForm" enctype="multipart/form-data">
		<table>
			<tr>
				<td>文章留言id</td>
				<td><input type="text" name="acmId" value="${articleCM.acmId}" readonly='readonly'></td>
			</tr>
			<tr>
				<td>文章id</td>
				<td><input type="text" name="articleId" value="${articleCM.articleId}"></td>
			</tr>
			<tr>
				<td>內容</td>
				<td><input type="text" name="acmMsg" value="${articleCM.acmMsg}"></td>
			</tr>
			<tr>
				<td>會員id </td>
				<td><input type="text" name="memberId" value="${articleCM.memberId}"></td>
			</tr>			
			<tr>
				<td>顯示 </td>
				<td><input type="text" name="acmShow" value="${articleCM.acmShow}"></td>
			</tr>			
			<tr>
				<td>被檢舉次數</td>
				<td><input type="text" name="acmReport" value="${articleCM.acmReport}"></td>
			</tr>			
			
		</table>
		<hr>
		<input type="button" name="save" value="save" id="save"/> 
		<input type="button" name="cancel" value="cancel" 
				onClick="location='/articleCMs/list'"/> 

		<div id='result'>
		<h2></h2>
		<span id="acmId"></span><br/>
		<span id="articleId"></span><br/>
		<span id="acmMsg"></span><br/>
		<span id="memberId"></span><br/>
		<span id="acmShow"></span><br/>
		<span id="acmReport"></span><br/>
		</div>

</form>
<script type="text/javascript">
$(function(){
	$(':text:eq(1)').focus();
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
		if($('#theForm').validate().form()){
			$.ajax({
				url:'/articleCMs/update',
				type:'post',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify($('#theForm').serializeObject()),
				dataType:'json',
				success:function(data){
					console.log(data);
					$('h2').text('Update Success');
					
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