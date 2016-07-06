<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<form id="resetPsw">
<div class="form-group">
<label for="password">Your New Password</label>
<input type="text" class="form-control" id="password" name="password" placeholder="new password">
</div>
<div class="form-group">
<label for="psw_confirm">Confirm Password</label>
<input type="text" class="form-control" id="psw_confirm" name="psw_confirm" placeholder="re-enter password">
</div>
<br>
<div class="form-group">
<input type="hidden" id="email" name="email" value="${email}">
<button type="button" id="resetPswBtn" class="btn btn-default"
			data-loading-text="Loading..." autocomplete="off">Submit</button>
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
		$('#password').focus();
		
		$('#resetPsw').validate({
			onfocusout: function (element) {
		        $(element).valid();
		    },
			rules:{
				password:{required: true, minlength: 6, maxlength: 12, pswrule: true},
				psw_confirm:{required: true, equalTo: '#password'},
			},
			messages:{
				password:{required:'請輸入6-12位數密碼', minlength:'密碼長度請大於6',	maxlength:'密碼長度請小於12'},
				psw_confirm:{required: '請再輸入一次密碼', equalTo: '密碼不符，請再試一次'},
			}
		});//validate
		
		$('#resetPswBtn').click(function(){
			var email=$('#email').val();
			var password=$('#password').val();
			console.log("email: "+email);
			console.log("password: "+password);
			var validateform = $('#resetPsw').validate().form();
			if(validateform){
			$.ajax({
				url:"/members/updatepassword",
				data:{"email":email, "password":password},
				type : "post",
				success : function(result){
					alert(result);//test
				}
			});//ajax
			}//validate
		});//click

		$.validator.addMethod('pswrule', function(value, element){
			var reg = /^(?=.*[A-Za-z])(?=.*[0-9])(?!.*[!@#$%^&*])(?!.*\s)(?!.*[\u4E00-\u9FA5]).{6,}$/;
			return this.optional( element ) || reg.test(value);
		}, '密碼請由數字及英文大小寫組成');
	});
</script>
		
	</body>
</html>