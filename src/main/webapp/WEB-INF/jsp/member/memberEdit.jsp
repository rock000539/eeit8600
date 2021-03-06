<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member editPage</title>
<script src="/js/jquery.min.js"></script>
<script src="/src/js/jquery.validate.min.js"></script>
<style>
.error {
	color: red;
}
</style>
	<!--  BASE CSS STYLE  -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/bms/style.min.css" rel="stylesheet">
	<link href="/css/bms/default.css" rel="stylesheet" id="theme">
	<link href="/css/bms/bms-customize.css" rel="stylesheet">
	<!--  BASE JS  -->
	<script src="/js/bms/pace.min.js"></script>
</head>
<body>
<div id="wrapper">
	<!-- page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
	
	<c:import url="/WEB-INF/jsp/bms/bms_header.jsp" />
	<c:import url="/WEB-INF/jsp/bms/bms_navbar-side.jsp" />	
	
		<!-- page content -->
		<div id="content" class="content">
			<!-- breadcrumb 目前位置 -->
			<ol class="breadcrumb pull-right">
				<li><a href="<% request.getContextPath(); %>/bms">Home</a></li>
				<li><a href="javascript:;">Page Options</a></li>
				<li class="active">Blank Page</li>
			</ol>
			
			<!-- page-header 每頁標題 副標 -->
			<h1 class="page-header">Dashboard <small>overview of background management system</small></h1>
			
			<!-- 內文 -->
			<div class="row">
			    <div class="col-md-12 ui-sortable">
	            <!-- **每頁不同的內容從這裡開始** -->

<form accept-charset="UTF-8" class="form-horizontal" id="editForm">
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="memberId">ID</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="memberId" readonly="readonly"
	    		name="memberId" value="${member.memberId}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="email">EMAIL</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="email"  readonly="readonly"
	    		name="email" value="${member.email}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="memberSuspend">停權狀態</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="memberSuspend" 
	    		name="memberSuspend" value="${member.memberSuspend}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="memberSuspendDays">停權天數</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="memberSuspendDays" 
	    		name="memberSuspendDays" value="${member.memberSuspendDays}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="memberSuspendStart">停權日期</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="memberSuspendStart" 
	    		name="memberSuspendStart" value="${member.memberSuspendStart}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="memberSuspendExp">停權到期日</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="memberSuspendExp" readonly="readonly"
	    		name="memberSuspendExp" value="${member.memberSuspendExp}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="memberSuspendCount">累計停權次數</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="memberSuspendCount" readonly="readonly"
	    		name="memberSuspendCount" value="${member.memberSuspendCount}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="nickname">暱稱</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="nickname" readonly="readonly"
	    		name="nickname" value="${member.nickname}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="firstName">名字</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="firstName"  readonly="readonly"
	    		name="firstName" value="${member.firstName}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="lastName">姓氏</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="lastName"  readonly="readonly"
	    		name="lastName" value="${member.lastName}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="gender">性別</label>
	    <div class="col-sm-7">
	    	<label class="radio-inline">
			    <input type="radio" readonly="readonly"
			    	name="gender" value="Female" ${member.gender=='Female'? 'checked':''}> 女性
			</label>
	    	<label class="radio-inline">
			    <input type="radio" readonly="readonly"
			    	name="gender" value="Male" ${member.gender=='Male'? 'checked':''}> 男性
		    </label>
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="birthDay">生日</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="birthDay" readonly="readonly"
	    		name="birthDay" value="${member.birthDay}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="skinType">膚質</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="skinType"  readonly="readonly"
	    		name="skinType" value="${member.skinType}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="memberImg">大頭貼照</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="memberImg" readonly="readonly"
	    		name="memberImg" value="${member.memberImg}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="phone">電話</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="phone" readonly="readonly"
	    		name="phone" value="${member.phone}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="addr">地址</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="addr" readonly="readonly"
	    		name="addr" value="${member.addr}">
	    </div>
	</div>

	</div>			
    <div class="form-group">
    	<div class="col-sm-offset-5">
        <button type="button" class="btn btn-default" id="editBtn" name="insert">Edit</button>
        </div>
    </div>			
	</form>
	<br>
	<div id="resultMsg"></div>
	<div id="data"></div>
	            <!-- **每頁不同的內容 end** -->     
			    </div><!-- /end .col-md-12 -->
			</div> <!-- /end .row -->
		</div>
		<!-- /end #content -->
		<!-- scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- /end page container -->
	
	

<script type="text/javascript">
	$(function() {
/*		$('#editForm').validate(
			{rules:{
				email:{required:true},
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
		$('#editBtn').on('click',function() {
			
			var formdata = new FormData(); 
			formdata.append('memberImgFile', $('#memberImgFile').prop('files')[0]); 
			formdata.append('member', new Blob([JSON.stringify($('#editForm').serializeObject())],
							{type: 'application/json'}));  	
			console.log(formdata);
			$.ajax({
				url : "/members/suspend",
				type : "POST",
				contentType : false,
				processData : false, 
				data : formdata,
				dataType: 'json',
				success : function(result) {
					console.log(result);
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
			});//ajax
		}); //onclick

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
	<!--  BASE JS  -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bms/jquery.slimscroll.min.js"></script>
	<script src="/js/bms/bms.js"></script>
</body>
</html>