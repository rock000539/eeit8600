<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member AddPage</title>
<style>
	.error {
		color: red;
	}
</style>
	<!-- Header, NavBar -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/metisMenu.min.css" rel="stylesheet">
	<link href="/css/sb-admin-2.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/css/bms-customize.css" rel="stylesheet" >
	
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/sb-admin-2.js"></script>
	
	<!-- BootStrap 基本檔案  -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
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
    	
    <link rel="stylesheet" 
		href="/css/bootstrap-dialog.min.css" />
    <script
    	src="/js/bootstrap-dialog.min.js"></script>
    	
    <script src="/js/metisMenu.min.js"></script>
    
</head>
<body>
<div id="wrapper">
<c:import url="../bms_header.jsp" />
<c:import url="../bms_navbar-side.jsp" />
<!-- Page Content --> 
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Member AddPage</h1>
                <!-- **每頁不同的內容從這裡開始** -->

<form accept-charset="UTF-8" class="form-horizontal" id="addForm">
	<div class="form-group">
	    <label for="email">電子信箱</label>
	    <input type="text" class="form-control" id="email" name="email" value="${member.email}">
	</div>
	<div class="form-group">
	    <label for="password">密碼</label>
	    <input type="text" class="form-control" id="password" name="password" value="${member.password}">
	</div>
	<div class="form-group">
	    <label for="nickname">暱稱</label>
	    <input type="text" class="form-control" id="nickname" name="nickname" value="${member.nickname}">
	</div>
	<div class="form-group">
	    <label for="lastName">姓</label>
	    <input type="text" class="form-control" id="lastName" name="lastName" value="${member.lastName}">
	</div>
	<div class="form-group">
	    <label for="firstName">名</label>
	    <input type="text" class="form-control" id="firstName" name="firstName" value="${member.firstName}">
	</div>
	<div class="form-group">
	    <label class="radio-inline">
	    <input type="radio" name="gender" value="${member.gender=='M'? 'checked':''}"> 男
	    </label>
	    <label class="radio-inline">
	    <input type="radio" name="gender" value="${member.gender=='F'? 'checked':''}"> 女
		</label>
	</div>
	<div class="form-group">
	    <label for="birthDay">生日</label>
	    <input type="text" class="form-control" id="birthDay" name="birthDay" value="${member.birthDay}">
	</div>
	<div class="form-group">
	    <label for="skinType">肌膚性質</label>
	    <input type="text" class="form-control" id="skinType" name="skinType" value="${member.skinType}">
	</div>
	<div class="form-group">
	    <label for="memberImgFile">圖片</label>
	    <input type="file" class="form-control" id="memberImgFile" name="memberImgFile" value="${member.memberImgFile}">
	</div>
	<div class="form-group">
	    <label for="phone">電話</label>
	    <input type="text" class="form-control" id="phone" name="phone" value="${member.phone}">
	</div>
	<div class="form-group">
	    <label for="addr">地址</label>
	    <input type="text" class="form-control" id="addr" name="addr" value="${member.addr}">
	</div>
	<div class="form-group">
	    <label for="memberSuspend">停權</label>
	    <input type="text" class="form-control" id="memberSuspend" name="memberSuspend" value="${member.memberSuspend}">
	</div>
	<div class="form-group">
	    <label for="memberSuspendExp">停權到期日</label>
	    <input type="text" class="form-control" id="memberSuspendExp" name="memberSuspendExp" value="${member.memberSuspendExp}">
	</div>
	<div>
		<input type="button" id="insertBtn" name="insert"
		value="insert">
		 <input type="button" name="cancel"
		value="Cancel" onclick='window.location="/members/list"'>
	</div>
	</form>
	<br>
	<div id="resultMsg"></div>
	<div id="data"></div>
	<img name="memberImgFile" width="100">
	
<!-- **每頁不同的內容 end** -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->


<script type="text/javascript">
	$(function() {
		// DateTimePicker
        $('#datetimepicker').datetimepicker(
        {
        	format: 'yyyy-mm-dd',
        	autoclose: true,
        	minView: 2,
        });
		
/*		
		
		$('#addForm').validate(
			{event: "blur",
			 rules:{
				email:{required:true, email:true},
				nickname:{required:true},
				lastName:{required:true},
				firstName:{required:true},
				gender:{required:true},
				birthDay:{required:true},
				skinType:{required:true},
				memberImg:{required:true},
				phone:{required:true},
				addr:{required:true},
				memberSuspend:{required:true},
				memberSuspendExp:{required:true}
			},messages:{
				email:"必填項目",
				nickname:"",
				lastName:"",
				firstName:"",
				gender:"",
				birthDay:"",
				skinType:"",
				memberImg:"",
				phone:"",
				addr:"",
				memberSuspend:"",
				memberSuspendExp:""
			}}
		);
*/
		$('#insertBtn').on('click',function() {
			var formdata = new FormData(); 
			formdata.append('memberImgFile', $('#memberImgFile').prop('files')[0]); 
			formdata.append('member', new Blob([JSON.stringify($('#addForm').serializeObject())],
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