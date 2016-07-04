<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
	<!-- 表單驗證  -->
	<script src="/js/jquery.validate.min.js"></script>
	
	<!-- DatePicker -->
	<link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css" />
    <script src="/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/js/trirand/i18n/bootstrap-datetimepicker.zh-TW.js"></script>
<style>
	label{
		font-family: Microsoft JhengHei;
		color: #29AFBB;
	}
	label.error {
		color: #FF8989; /*#A94442;*/
		font-size: 0.9em;
		margin-left: 3px;
	}
	.popover {
    	white-space: pre-line;    
	}
	span.fa{
		color: #00CACA;
	}
	div.modal-header{
		margin-bottom:20px;
		font-family: monospace;
		color: #FFFFFF;
		background-color: #98DaD6;
		text-align: center;
		height: 80px;
	}
	div.modal-footer{
		background-color: #98DaD6;
		text-align: center;
		height: 100px;
	}
	#datetimepicker {
		overflow: scroll;
    	position: relative;
    	margin-bottom:0px;
	}
	.icon1 {
		 color:white;
		 opacity: 1;
		 font-size: 5em;
		 text-align:center;
		 margin-top: 15%;
	}
	#insertBtn, #insertBtn:focus {
		width: 10em;
/*  	border-radius: 24px;  */
 		font-family:cursive; 
		background-color: #FFFFFF;
		color:#84786C;
		font-weight: bold;
/* 		border: 2px double white; */
/* 		box-shadow: 0 3px 0 0 #84D2CE; */
	}
	.modal-dialog {
	  padding-top:5%;
	}
</style>
</head>
<body>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h3 class="modal-title">MemberRegister<small>Sign Up TestPage </small></h3>
            </div>			<!-- modal header -->
            <div class="modal-body">
            
<form accept-charset="UTF-8" class="form-horizontal" id="signup">
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="email">電子信箱</label>
	    <div class="col-sm-7" >
	    	<div class=" input-group">
		    	<input type="text" class="form-control" id="email" 
		    		name="email" value="${member.email}">
		    	<span class="input-group-addon" data-toggle="popover" data-placement="right" 
	    			data-content="此電子信箱將成為您的登入帳號 ">
                <span class="fa fa-info-circle"></span>
            </span>
            </div>
            <label class="error" for="email"></label>
		</div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="password">密碼</label>
	    <div class="col-sm-7">
	    	<div class=" input-group">
		    	<input type="text" class="form-control" id="password" 
		    		name="password" value="${member.password}">
		    	<span class="input-group-addon" data-toggle="popover" data-placement="right" 
		    		data-content="請輸入6-12位數密碼 且使用數字及英文">
	            <span class="fa fa-info-circle"></span>
            </div>
	    	<label class="error" for="password"></label>
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="psw_confirm">密碼確認</label>
	    <div class="col-sm-7">
	    	<div class=" input-group">
		    	<input type="text" class="form-control" id="psw_confirm" 
		    		name="psw_confirm" value="${member.password}">
		    	<span class="input-group-addon" data-toggle="popover" data-placement="right" 
		    		data-content="請再輸入一次密碼">
	            <span class="fa fa-info-circle"></span>
	    	</div>
	    	<label class="error" for="psw_confirm"></label>
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="nickname">暱稱</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="nickname" 
	    		name="nickname" value="${member.nickname}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="lastName">姓</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="lastName" 
	    		name="lastName" value="${member.lastName}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="firstName">名</label>
	    <div class="col-sm-7">
		    <input type="text" class="form-control" id="firstName" 
		    	name="firstName" value="${member.firstName}">
	    </div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label" for="firstName">性別</label>
		<div class="col-sm-7">
			<label class="radio-inline">
		    <input type="radio" checked
		    	name="gender" value="F" ${member.gender=='F'? 'checked':''}> 女性
			</label>
	    	<label class="radio-inline">
		    <input type="radio"
		    	name="gender" value="M" ${member.gender=='M'? 'checked':''}> 男性
		    </label>
		</div>
	</div>
											
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="birthDay">生日</label>
	    <div class="col-sm-7">
	    	<div class="input-group date" id="datetimepicker">
			    <input type="text" class="form-control" id="birthDay" 
			    	name="birthDay" value="${member.birthDay}">
			    <span class="input-group-addon">
                    <span class="fa fa-calendar"></span>
                </span>
			</div>
			<label class="error" for="birthDay"></label>
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="skinType">肌膚性質</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="skinType" 
	    		name="skinType" value="${member.skinType}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="memberImgFile">大頭貼照</label>
	    <div class="col-sm-7">
	    	<input type="file" id="memberImgFile" 
	    		name="memberImgFile" value="${member.memberImgFile}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="phone">電話</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="phone" 
	    		name="phone" value="${member.phone}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="addr">地址</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="addr" 
	    		name="addr" value="${member.addr}">
	    </div>
	</div>
</form>
            </div>			<!-- m body -->
            <div class="modal-footer">
                <button type="button" id="insertBtn" name="insert" 
                	 >SignUp</button>
            </div>			<!-- m footer --> <!-- data-dismiss="modal" -->
</div>


<script type="text/javascript">
	$(function() {
		$('#email').focus();
		
		$('[data-toggle="popover"]').popover({
			trigger:"hover",
			container: 'body'
		});
		
		$('#signup').validate({
			onkeyup: true,
			onfocusout: function (element) {
		        $(element).valid();
		    },
		    focusInvalid: true,
		    rules:{
		    	email: {required: true, email: true, remote:'/members/check_email'},
		    	password:{required: true, minlength: 6, maxlength: 12, pswrule: true},
		    	psw_confirm:{required: true, equalTo: '#password'},
		    	nickname:{required: true},
		    	birthDay:{required: true},
		    },
		    messages:{
				email:{required:'請輸入您的電子信箱', email:'請輸入正確格式', remote:'此帳號已經有人使用'},
				password:{required:'請輸入6-12位數密碼', minlength:'密碼長度請大於6',
					maxlength:'密碼長度請小於12'},
				psw_confirm:{required: '請再輸入一次密碼', equalTo: '密碼不符，請再試一次'},
		    	nickname:{required: '請輸入您在網頁中的顯示名稱'},
		    	birthDay:{required: '請輸入您的生日'}
		    },
		});
		//additional password customized rule
		$.validator.addMethod('pswrule', function(value, element){
			var reg = /^(?=.*[A-Za-z])(?=.*[0-9])(?!.*[!@#$%^&*])(?!.*\s)(?!.*[\u4E00-\u9FA5]).{6,}$/;
			return this.optional( element ) || reg.test(value);
		}, '密碼請由數字及英文大小寫組成');
		
		// DateTimePicker
        $('#datetimepicker').datetimepicker(
        {
        	format: 'yyyy-mm-dd',
        	autoclose: true,
        	todayBtn: "linked",
        	minView: 2,
        	pickerPosition: "top-left",
        	beforeShow: function(input, obj) {
                $(input).after($(input).datetimepicker('widget'));
            }
        });
		
		//submit
		$('#insertBtn').on('click',function() {
 			if($('#signup').validate().form()){
			var formdata = new FormData(); 
			formdata.append('memberImgFile', $('#memberImgFile').prop('files')[0]); 
			formdata.append('member', new Blob([JSON.stringify($('#signup').serializeObject())],
							{type: 'application/json'})); 			
			$.ajax({
				url : "/members/insert",
				type : "POST",
				contentType : false,
				processData : false, 
				data : formdata,
				dataType: 'json',
				success : function(result) {
					//$(':text:gt(0)').val(" ");//clear the form except id
					console.log(result);//test
					var bg = $('.modal-back-drop');
					console.log(bg);
					$('#regiModal').modal('hide');
					$("<div class='icon1'><i class='fa fa-spinner fa-1x fa-spin'></i>&nbsp;&nbsp;Thank You!!</div>")
						.appendTo($('<div class="modal-backdrop fade in"></div>').appendTo(document.body));
					setTimeout(function() {
						window.location.reload();
					  }, 1000);
				}
			});
 		}
		});
		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};
	});	
</script>

</body>
</html>