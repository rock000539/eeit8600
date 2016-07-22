<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Member Profile EDIT</title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    
    <script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
    <!-- customize -->
    <link rel="stylesheet" href="/css/member/member-customize.css">
	<!-- FileInput -->
    <link href="/css/fileinput.min.css" media="all" rel="stylesheet" />
    <script src="/js/fileinput.min.js"></script>
    <!-- 表單驗證  -->
	<script src="/js/jquery.validate.min.js"></script>
	<!-- DatePicker -->
	<link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css" />
    <script src="/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/js/trirand/i18n/bootstrap-datetimepicker.zh-TW.js"></script>
<style>
#member-header{
	padding-left: 80px;
}
.priviewImg{
	width: 80px;
	height: 80px;
}
.memberDiv{
	margin-bottom: 100px;
}
#outputFile{
	display: inline-block;
	margin-top: 5px;
}
</style> 
</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
				<div class="grey_bg row">

<div class="row detail-div">
	<div id="div1" class="col-lg-2"></div>
	<div class="col-lg-6 col-sm-6 wow fadeInLeft delay-05s memberDiv">
		
<form accept-charset="UTF-8" class="form-horizontal" id="editForm">
	<div id="member-header" class="detail-list">
		<div id="memberphoto" class="detail-list-col1">
		   	<img src="/members/show?memberId=${member.memberId}"/>
		</div>
		<div class="detail-list-col2">
		       <h3>${member.nickname}</h3>
		</div>
		<div id="outputFile">
			<label class="control-label">Change Photo</label>
			<input id="memberImgFile" name="memberImgFile" type="file" multiple class="file-loading">
			<script>
				$(document).on('ready', function() {
					$("#memberImgFile").fileinput({
				    	showCaption: false,
				    	browseClass: 'btn btn-default',
				    	showUpload : false,
				    	maxFileCount: 1,
				    	previewSettings:{image: {width: "auto", height: "150px"}},
				    });
	// 				$('#memberImgFile').on('fileimageloaded', function(event, previewId) {
	// 				    console.log("fileimageloaded");
	// 				});
				});
			</script>
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
	    <label class="col-sm-3 control-label" for="nickname">Nickname</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="nickname"
	    		name="nickname" value="${member.nickname}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="firstName">First Name</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="firstName"
	    		name="firstName" value="${member.firstName}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="lastName">Last Name</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="lastName"
	    		name="lastName" value="${member.lastName}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="gender">Gender</label>
	    <div class="col-sm-7">
	    	<label class="radio-inline">
			    <input type="radio"
			    	name="gender" value="Female" ${member.gender=='Female'? 'checked':''}> Female
			</label>
	    	<label class="radio-inline">
			    <input type="radio"
			    	name="gender" value="Male" ${member.gender=='Male'? 'checked':''}> Male
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
	    <label class="col-sm-3 control-label" for="skinType">SkinType</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="skinType"
	    		name="skinType" value="${member.skinType}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="phone">phone</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="phone"
	    		name="phone" value="${member.phone}">
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-3 control-label" for="addr">Location</label>
	    <div class="col-sm-7">
	    	<input type="text" class="form-control" id="addr"
	    		name="addr" value="${member.addr}">
	    </div>
	</div>
    <div class="form-group">
    	<div class="col-sm-offset-4">
    	<input type="hidden" name="memberId" value="${member.memberId}">
        <button type="button" class="btn btn-default" id="insertBtn" name="insert">Confirm</button>
        </div>
    </div>
</form>

	</div> <!-- col-lg -->
	
	<div class="col-lg-1"></div>
	
	<c:import url="/WEB-INF/jsp/member/memberPages-nav.jsp" />
	
</div> <!-- row -->
					
				</div>        
            

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			

	<!-- Scripts -->
	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>
	
<script type="text/javascript">
	$(function() {
		$('#editForm').validate({
			onkeyup: true,
			onfocusout: function (element) {
		        $(element).valid();
		    },
		    focusInvalid: true,
		    rules:{
		    	nickname:{required: true},
		    	birthDay:{required: true},
		    },
		    messages:{
		    	nickname:{required: 'please enter your nickname'},
		    	birthDay:{required: 'please enter your birthday'}
		    },
		});
		
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
 			if($('#editForm').validate().form()){
			var formdata = new FormData(); 
			formdata.append('memberImgFile', $('#memberImgFile').prop('files')[0]); 
			formdata.append('member', new Blob([JSON.stringify($('#editForm').serializeObject())],
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