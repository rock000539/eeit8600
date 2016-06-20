<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReviewCMs Add</title>
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
<h1>ReviewCMs Add</h1>
	<form id="theForm" enctype="multipart/form-data">
		<table>
			<tr>
				<td>心得id</td>
				<td><input type="text" name="reviewId" value="${param.reviewId}"></td>
			</tr>
			<tr>
				<td>內容</td>
				<td><input type="text" name="rcmMsg" value="${param.rcmMsg}"></td>
			</tr>
			<tr>
				<td>會員id</td>
				<td><input type="text" name="memberId" value="${param.memberId}"></td>
			</tr>
			<tr>
				<td>顯示</td>
				<td><input type="text" name="rcmShow" value="${param.rcmShow}"></td>
			</tr>
			<tr>
				<td>被檢舉次數</td>
				<td><input type="text" name="rcmReport" value="${param.rcmReport}"></td>
			</tr>
		</table>
		<hr />
		<input type="button" name="save" value="save" id="save"/> 
		<input type="button" name="cancel" value="cancel" 
				onClick="location='/reviewCMs/list'"/> 
		
		<div id='result'>
		<h2></h2>
		<span id="reviewId"></span><br/>
		<span id="rcmMsg"></span><br/>
		<span id="memberId"></span><br/>
		<span id="rcmShow"></span><br/>
		<span id="rcmReport"></span><br/>
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
			reviewId:{
				required:true,
			},
			rcmMsg:{
				required:true,
			},
			memberId:{
				required:true,
			},
			rcmShow:{
				required:true,
			},
			rcmReport:{
				required:true,
			},
		},//end of rules
		messages:{
			reviewId:{
				required:"必填項目",
			},
			rcmMsg:{
				required:"必填項目",
			},
			memberId:{
				required:"必填項目",
			},
			rcmShow:{
				required:"必填項目",
			},
			rcmReport:{
				required:"必填項目",
			},
		}//end of messages	
	});//end of validate
	

	$('#save').click(function(){
		console.log(JSON.stringify($('#theForm').serializeObject()));
		if($('#theForm').validate().form()){
			$.ajax({
				url:'/reviewCMs/insert',
				type:'post',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify($('#theForm').serializeObject()),
				dataType:'json',
				success:function(data){
					console.log(data);
					$(':text').val("");
					$('h2').text('Insert Success');
					
					$('#reviewId').text('心得id='+data.reviewId);
					$('#rcmMsg').text('內容='+data.rcmMsg);
					$('#memberId').text('會員id='+data.memberId);
					$('#rcmShow').text('顯示='+data.rcmShow);
					$('#rcmReport').text('被檢舉次數='+data.rcmReport);
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