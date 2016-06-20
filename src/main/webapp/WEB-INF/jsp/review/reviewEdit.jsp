<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/src/js/jquery.validate.min.js"></script>
<title>Reviews Edit</title>
<style>
.error {
	color: red;
	font-style: italic;
}
</style>
</head>
<body>
<h1>Reviews Edit</h1>
<form id="theForm" enctype="multipart/form-data">
		<table>
			<tr>
				<td>編號 </td>
				<td><input type="text" name="reviewId" value="${review.reviewId}" readonly='readonly'></td>
			</tr>
			<tr>
				<td>會員id</td>
				<td><input type="text" name="memberId" value="${review.memberId}"></td>
			</tr>
			<tr>
				<td>產品id</td>
				<td><input type="text" name="prodId" value="${review.prodId}"></td>
			</tr>
			<tr>
				<td>心得標題 </td>
				<td><input type="text" name="reviewTitle" value="${review.reviewTitle}"></td>
			</tr>			
			<tr>
				<td>內文 </td>
				<td><input type="text" name="review" value="${review.review}"></td>
			</tr>			
			<tr>
				<td>評分</td>
				<td><input type="text" name="reviewRating" value="${review.reviewRating}"></td>
			</tr>			
			<tr>
				<td>PIC </td>
				<td><input type="file" name="reviewImg" value="${review.reviewImg}"></td>
				<td><input type="button" id="start" value="上傳" /></td>
			</tr>
			<tr>
				<td>發布時間</td>
				<td><input type="text" name="reviewTime" value="${review.reviewTime}"></td>
			</tr>
			<tr>
				<td>收藏數</td>
				<td><input type="text" name="rewCollect" value="${review.rewCollect}"></td>
			</tr>
			<tr>
				<td>flag</td>
				<td><input type="text" name="reviewShow" value="${review.reviewShow}"></td>
			</tr>	
		</table>
		<hr>
		<input type="button" name="save" value="save" id="save"/> 
		<input type="button" name="cancel" value="cancel" 
				onClick="location='/reviews/list'"/> 

		<div id='result'>
		<h2></h2>
		<span id="memberId"></span><br/>
		<span id="prodId"></span><br/>
		<span id="reviewTitle"></span><br/>
		<span id="review"></span><br/>
		<span id="reviewRating"></span><br/>
		<span id="reviewImg"></span><br/>
		<span id="reviewTime"></span><br/>
		<span id="rewCollect"></span><br/>
		<span id="reviewShow"></span><br/>
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
			memberId:{
				required:true,
			},
			prodId:{
				required:true,
			},
			reviewTitle:{
				required:true,
			},
			review:{
				required:true,
			},
			reviewRating:{
				required:true,
			},
	/*		reviewImg:{
				required:true,
			},
	*/		reviewTime:{
				required:true,
			},
			rewCollect:{
				required:true,
			},
			reviewShow:{
				required:true,
			},
		},//end of rules
		messages:{
			memberId:{
				required:"必填項目",
			},
			prodId:{
				required:"必填項目",
			},
			reviewTitle:{
				required:"必填項目",
			},
			review:{
				required:"必填項目",
			},
			reviewRating:{
				required:"必填項目",
			},
	/*		reviewImg:{
				required:"必填項目",
			},
	*/		reviewTime:{
				required:"必填項目",
			},
			rewCollect:{
				required:"必填項目",
			},
			reviewShow:{
				required:"必填項目",
			},
		}//end of messages	
	});//end of validate
	

	$('#save').click(function(){
		if($('#theForm').validate().form()){
			$.ajax({
				url:'/reviews/update',
				type:'post',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify($('#theForm').serializeObject()),
				dataType:'json',
				success:function(data){
					console.log(data);
					$('h2').text('Update Success');
					
					$('#memberId').text('會員id='+data.memberId);
					$('#prodId').text('產品id='+data.prodId);
					$('#reviewTitle').text('心得標題='+data.reviewTitle);
					$('#review').text('內文='+data.review);
					$('#reviewRating').text('評分='+data.reviewRating);
					$('#reviewImg').text('圖片='+data.reviewImg);
					$('#reviewTime').text('發布時間='+data.reviewTime);
					$('#rewCollect').text('收藏數='+data.rewCollect);
					$('#reviewShow').text('flag='+data.reviewShow);
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