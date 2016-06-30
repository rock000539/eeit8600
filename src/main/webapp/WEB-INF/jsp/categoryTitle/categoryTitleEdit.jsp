<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
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
    
    <!-- Dialog -->
    <link rel="stylesheet" 
		href="/css/bootstrap-dialog.min.css" />
    <script
    	src="/js/bootstrap-dialog.min.js"></script>
    	
    <!-- FileInput -->
    <link href="/css/fileinput.min.css" media="all" rel="stylesheet" />
    <script src="/js/fileinput.min.js"></script>
    
    <script src="/js/metisMenu.min.js"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>CategoryTitleEdit</title>
	
	<style>
		.col-md-6 {
			margin-top: 20px;
		}
		.error {
			color: red;
		}
		.panel {
			margin-top: 20px;
		}
		textarea {
		    resize: none;
		}
	</style>
	
</head>
<body>
	
	<!-- 內文全部用wrapper包起來 -->
	<div id="wrapper">
	<!-- 加入上方及側邊Nav-Bar -->	
	<c:import url="../bms_header.jsp" />
	<c:import url="../bms_navbar-side.jsp" />
		<!-- Page Content --> 
		<div id="page-wrapper">
		    <div class="container-fluid">
		        <div class="row">
		            <div class="col-lg-12">
		                <!-- **每頁不同的內容從這裡開始** -->
		                
		                <div class="col-md-2"></div>
						<div class="col-md-8">
							<div class="panel panel-primary">
								<div class="panel-heading">Product Add Form</div>
								<div class="panel-body">
									<form accept-charset="UTF-8"
										action="" class="simple_form form-horizontal" id="editForm" method="post">
										
										<div class="form-group">
											<label class="col-sm-3 control-label" for="prodId">
												titleId
											</label>
											<div class="col-sm-8">
												<input class="form-control" disabled="disabled"
													id="titleId" name="titleId" type="text"
													value="${title.titleId}" />
											</div>
											<div class="col-sm-1"></div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label" for="prodName">
												titleName
											</label>
											<div class="col-sm-8">
												<input class="string required form-control"
													id="titleName" name="titleName"
													placeholder="請輸入titleName" type="text"
													value="${title.titleName}" />
											</div>
											<div class="col-sm-1"></div>
										</div>
										
										<div class="form-group">
											<div class="col-sm-3"></div>	
											<div class="col-sm-7">
												<input class="btn btn-primary" type="button" 
													id="save" name="save" value="Save" />
												<input class="btn btn-primary" type="button" 
													id="clear" name="clear" value="Reset" />
												<input class="btn btn-primary" type="button" 
													id="cancel" name="cancel" value="Cancel" 
													onClick="location='/categorytitles/list'" />
											</div>
											<div class="col-sm-2"></div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-2"></div>
		                
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
			
			// focus on first input
			$('#titleName').focus();
			
			// Validate
			var validate = $('#editForm').validate(
			{
				onfocusout: function (element) {
			        $(element).valid();
			    },
				rules: {
					
				},
				messages: {
					
				}
			});
			
			// Save Click
			$('#save').click(function(){
				
				var validate = $('#editForm').validate().form();
				console.log(validate);
				var data = JSON.stringify($('form').serializeObject());
				console.log(data);
				
				if(validate){
					
					$('#titleId').prop('disabled', false);
					
					$.ajax({
						url: '/categorytitles/update',
						type: 'POST',
						dataType: 'json',
						contentType: 'application/json; charset=utf-8',
						data: JSON.stringify($('form').serializeObject()),
						success:function(response){
							$('#titleId').prop('disabled', true);
							BootstrapDialog.show({
					            size: BootstrapDialog.SIZE_SMALL,
					            type: BootstrapDialog.TYPE_SUCCESS,
					            message: 'Insert CategoryTitle Success',
					        });
							console.log(response);
						}, 
						error: function(xhr, textStatus, errorThrown) {
							BootstrapDialog.show({
					            size: BootstrapDialog.SIZE_SMALL,
					            type: BootstrapDialog.TYPE_DANGER,
					            message: 'Insert CategoryTitle Fail, ' + 'Error! Status = ' + xhr.status,
					        });
						} 
					});
				}
			});
			
			// Reset Click
			$('#clear').click(
				function(){
					$("#editForm")[0].reset();
				}
			);
			
			// Serialize
			$.fn.serializeObject = function() {
		        var o = {};
		        var a = this.serializeArray();
		        $.each(a, function() {
		            if (o[this.name]) {
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
		    
		});
	
	</script>
	
</body>
</html>