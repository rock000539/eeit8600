<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
</style>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<!-- CSS -->
	<link rel="stylesheet" href="/css/fms-main.css" />
	<link rel="stylesheet" href="/css/fms-customize.css" />		
	
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery.dropotron.min.js"></script>
	<script src="/js/skel.min.js"></script>
	<script src="/js/util.js"></script>
	<script src="/js/fms-main.js"></script>
	
	<!-- 表單驗證  -->
	<script src="/js/jquery.validate.min.js"></script>
</head>

<body>

	<!-- Wrapper -->
		<div id="wrapper">
<!--加入header&nav -->
<c:import url="../fms_header_nav.jsp" />
				
			<!-- Main -->
			<div id="main">
			
			<!-- **每頁不同的內容從這裡開始** -->
				
				<!-- 內容若要有方框效果，請用下面的article包起來 -->
                <article class="post">
              
<p>Please enter your EMAIL you have registered</p>
<form id="forgotPsw">
<div class="form-group">
<label for="email">Email address</label>
<input type="email" class="form-control" id="email" name="email" placeholder="Email">
</div>
<br>
<div class="form-group">
<button type="button" id="forgotPswBtn" class="btn btn-default" >Submit</button>
</div>
</form>
                </article>
                
            <!-- **每頁不同的內容結束** -->

<!--加入intro&footer -->
<c:import url="../fms_intro_footer.jsp" />
			 </div>
		</div>

<script>
$(function(){
 	$('#email').focus();
	
	$('#forgotPsw').validate({
		rules:{email: {required: true, email: true, remote:'/members/check_emailexist'}},
		messages:{email:{required:'Please enter your email',
				email:'Please enter correct email',
				remote:'Sorry, the email does not exit'}}
	});
	
	
	$('#forgotPswBtn').click(function(){
		var email=$('#email').val();
		var validateform = $('#forgotPsw').validate().form();
		if(validateform){
		$.ajax({
			url:"/members/requestforpsw",
			data:{"email":email},
			type : "Get",
			success : function(result){
				alert(result);//test
			}
		});//ajax
		}//validate
	});//click

});//onload

</script>

			
	</body>
</html>