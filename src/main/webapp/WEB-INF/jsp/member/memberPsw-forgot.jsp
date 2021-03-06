<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>忘記密碼</title>
    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">	
	<link rel="stylesheet" href="/css/product/sweetalert2.min.css">
	
	<script type="text/javascript" src="/js/product/sweetalert2.min.js"></script>
	<script src="/js/jquery.min.js"></script>
</head>
<style>
.row{
	margin-top: 30px;
}
div.grey_bg{
	min-height: 450px;
}
.btn-submit{
/* 	position: absolute; */
/* 	top:50%; */
/* 	left:50%; */
/* 	margin-left: -65px; */
/* 	margin-top: -20px; */
	width: 130px;
	height: 40px;
	text-align: center;
}
button{
	outline:none;
	width: 130px;
	height: 40px;
	border-radius:40px;
	background: #727CB6;
	border: 2px solid #727CB6;
	text-align: center;
	color: #fff;
	letter-spacing:1px;
	text-shadow: none;
	font-size:12px;
	font-weight:bold;
	cursor: pointer;
	transition: all 0.25s ease;
}
button:hover {
	color: #727CB6;
	background: white;
}
button:active {
	letter-spacing: 2px ;
}
.onclic {
  width: 40px;
  border-color: #d0d0d0;
  border-width:3px;
  font-size:0;
  border-left-color: white;
  animation: rotating 2s 0.25s linear infinite;
}
.onclic:after {
	content:"";
}
.onclic:hover {
	color: #bbbbbb;
	background: white;
}
.ok {
	font-size:13px;
	color: white;
	background: #727CB6;
}
.ok:after {
    font-family:'FontAwesome';
    content:"\f00c";
  }
@keyframes rotating {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
.icon1 {
	 color:white;
	 opacity: 1;
	 font-size: 5em;
	 text-align:center;
	 margin-top: 15%;
}
</style>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
<div class="row">
<div class="col-lg-3"></div>
<div class="col-lg-6 col-sm-6">
<h1 style="text-align:center;margin-bottom: 50px;">重設密碼</h1>     
<h4>請輸入註冊時使用的EMAIL</h4>
<form id="forgotPsw">
<div class="form-group">
<label for="email">Email</label>
<input type="email" class="form-control" id="email" name="email" placeholder="Email">
</div>
<br>
</form>
<div id="forgotPswBtn" class="btn btn-default" >送出</div>
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
 	$('#email').focus();
	
	$('#forgotPsw').validate({
		rules:{email: {required: true, email: true, remote:'/members/check_emailexist'}},
		messages:{email:{required:'Please enter your email',
				email:'Please enter correct email',
				remote:'Sorry, the email does not exit'}}
	});
	
	
	$('#forgotPswBtn').click(function(){
		var email=$('#email').val();
		console.log(email);
// 		$("#forgotPswBtn").removeClass("btn-default").addClass("onclic", 250, function(){
// 			console.log("click");
// 			setTimeout(function() {
// 				console.log("timeout1");
// 				$( "#forgotPswBtn" ).removeClass("onclic");
// 				$( "#forgotPswBtn" ).addClass( "ok", 450, function(){
// 					setTimeout(function() {
// 						console.log("timeout2");
// 					      $( "#forgotPswBtn" ).removeClass( "ok" );
// 					}, 1250 );
// 				});
// 			}, 1000 );
// 		});
		var validateform = $('#forgotPsw').validate().form();
		if(validateform){
			$.ajax({
				url:"/members/requestforpsw",
				data:{"email":email},
				type : "Get",
				beforeSend:function(){
					$("<div class='icon1'><i class='fa fa-spinner fa-1x fa-spin'></i>&nbsp;&nbsp;密碼重設確認信寄出...</div>")
					.appendTo($('<div class="modal-backdrop fade in"></div>').appendTo(document.body));
					setTimeout(function() {	
						$('.modal-backdrop').remove(); 
						swal({
							text: '信件送達時間將在3到10分鐘之內<br>請到您的信箱中確認',
							type: 'success',
						}).then(function(){
							location.href = "<%=request.getContextPath()%>/fms";
						});
					}, 2000);
					
				},
				success : function(result){
									
					
				}
			});//ajax
		}//validate
	});//click
	

});//onload

</script>

</body>
</html>