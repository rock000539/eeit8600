<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>重設密碼</title>
    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">		
	<!-- 表單驗證  -->
	<script src="/js/jquery.min.js"></script>
<style>
div.grey_bg{
	min-height: 450px;
}
.icon1 {
	 color:white;
	 opacity: 1;
	 font-size: 4em;
	 text-align:center;
	 margin-top: 15%;
}
</style>
</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
<div class="row" style="margin-top: 20px">
<div class="col-lg-3"></div>
<div class="col-lg-6 col-sm-6">
<h1 style="text-align:center;margin-bottom:20px">重設密碼</h1> 
<form id="resetPsw">
<div class="form-group">
<label for="password">新密碼</label>
<input type="text" class="form-control" id="password" name="password" placeholder="new password">
</div>
<div class="form-group">
<label for="psw_confirm">密碼確認</label>
<input type="text" class="form-control" id="psw_confirm" name="psw_confirm" placeholder="re-enter password">
</div>
<br>
<div class="form-group">
<input type="hidden" id="email" name="email" value="${email}">
<button type="button" id="resetPswBtn" class="btn btn-default"
			data-loading-text="Loading..." autocomplete="off">Submit</button>
</div>
</form>

</div><!-- col -->
</div><!-- row -->

				</div>        
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />

	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>
	
	<!-- 表單驗證  -->
	<script src="/js/jquery.validate.min.js"></script>
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
			var validateform = $('#resetPsw').validate().form();
			if(validateform){
			$.ajax({
				url:"/members/updatepassword",
				data:{"email":email, "password":password},
				type : "post",
				success : function(result){
					console.log(result);
					var text; 
					if(result){	
						text = "<i class='fa fa-check' aria-hidden='true'></i>&nbsp;&nbsp;"+"Please login with your new password";
					}else{
						text = "<i class='fa fa-times' aria-hidden='true'></i>&nbsp;&nbsp;"+"Sorry, please try again";}
					$("<div class='icon1'>"+text+"</div>")
					.appendTo($('<div class="modal-backdrop fade in"></div>').appendTo(document.body));
					
					setTimeout(function() {	
						location.href = "<%=request.getContextPath()%>/fms";
					}, 2000);
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