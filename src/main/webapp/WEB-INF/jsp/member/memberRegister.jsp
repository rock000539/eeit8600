<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	
	<!-- 表單驗證  -->
	<script 
		src="/js/jquery.validate.min.js"></script>
	
	<!-- DatePicker -->
	<link rel="stylesheet" 
		href="/css/bootstrap-datetimepicker.min.css" />
    <script
    	src="/js/bootstrap-datetimepicker.min.js"></script>
    <script
    	src="/js/trirand/i18n/bootstrap-datetimepicker.zh-TW.js"></script>
    
<style>
	label{
		font-family: Microsoft JhengHei;
		color: #00BCA4;
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
	.page-header{
		font-family: monospace;
	}
	#datetimepicker {
		overflow: scroll;
    	position: relative;
	}
	
</style>
</head>
<body>

<div class="col-md-12">
<div class="page-header">
  <h2>MemberRegister <small>SignUp TestPage </small></h2>
</div>
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
	
	<div class="form-group">
	    <div class="col-sm-offset-4 col-sm-10">
	      <input type="button" id="insertBtn" name="insert" class="btn btn-default"
			value="insert">
		  <input type="button" name="cancel" class="btn btn-default" 
			value="Cancel" onclick='window.location="/members/list"'>
	    </div>
	</div>
</form>
</div>
	<br>
	<div id="resultMsg"></div>
	<div id="data"></div>
	<img name="memberImgFile" width="100">

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
				$('#resultMsg').empty().append("<h2>update success</h2>");
				var tb = $('#data').append('<table></table>');
				tb.empty();
				tb.append('<tr align="center"><td>ID</td><td>電子信箱</td><td>暱稱</td><td>姓</td><td>名</td><td>性別</td><td>生日</td><td>肌膚性質</td><td>圖片</td><td>電話</td><td>地址</td><td>停權</td><td>停權到期日</td></tr>');
				var row = $('<tr align="center"></tr>').appendTo(tb);
				$('<td></td>').text(result.memberId).appendTo(row);
				$('<td></td>').text(result.nickname).appendTo(row);
				$('<td></td>').text(result.ingredChName).appendTo(row);
				$('<td></td>').text(result.lastName).appendTo(row);
				$('<td></td>').text(result.firstName).appendTo(row);
				$('<td></td>').text(result.gender).appendTo(row);
				$('<td></td>').text(result.birthDay).appendTo(row);
				$('<td></td>').text(result.skinType).appendTo(row);
				$('<td></td>').text(result.memberImg).appendTo(row);
				$('<td></td>').text(result.phone).appendTo(row);
				$('<td></td>').text(result.addr).appendTo(row);
				$('<td></td>').text(result.memberSuspend).appendTo(row);
				$('<td></td>').text(result.memberSuspendExp).appendTo(row);
										}
									});
		}});

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