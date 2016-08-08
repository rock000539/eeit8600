<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	
	<!--  BASE CSS STYLE  -->
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/bms/style.min.css" rel="stylesheet">
	<link href="/css/bms/default.css" rel="stylesheet" id="theme">
	<link href="/css/bms/bms-customize.css" rel="stylesheet">
	<script src="/js/jquery.min.js"></script>
	<!--  BASE JS  -->
	<script src="/js/bms/pace.min.js"></script>
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bms/jquery.slimscroll.min.js"></script>
	<script src="/js/bms/bms.js"></script>

	<!-- 表單驗證  -->
	<script src="/js/jquery.validate.min.js"></script>
		
	<!-- DatePicker -->
	<link rel="stylesheet" 
		href="/css/bootstrap-datetimepicker.min.css" />
    <script
    	src="/js/bootstrap-datetimepicker.min.js"></script>
    <script
    	src="/js/trirand/i18n/bootstrap-datetimepicker.zh-TW.js"></script>
    	
   	<!-- DatePicker -->
	<link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css" />
    <script src="/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/js/trirand/i18n/bootstrap-datetimepicker.zh-TW.js"></script>
    
    <!-- Dialog -->
    <link rel="stylesheet" href="/css/bootstrap-dialog.min.css" />
    <script src="/js/bootstrap-dialog.min.js"></script>
    	
    <!-- FileInput -->
    <link href="/css/fileinput.min.css" media="all" rel="stylesheet" />
    <script src="/js/fileinput.min.js"></script>
	
	<style>
	
		.col-md-6 {
			margin-top: 20px;
		}
		.error{
			color:red;
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

	<!-- Loading animate -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	
	<!-- page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
	
		<c:import url="/WEB-INF/jsp/bms/bms_header.jsp" />
		<c:import url="/WEB-INF/jsp/bms/bms_navbar-side.jsp" />	
	
		<!-- page content -->
		<div id="content" class="content">
			<!-- breadcrumb 目前位置 -->
			<ol class="breadcrumb pull-right">
				<li><a href="<% request.getContextPath(); %>/bms">Home</a></li>
				<li><a href="javascript:;">美妝資料管理</a></li>
				<li class="active">產品資料</li>
				<li class="active">修改產品</li>
			</ol>
			
			<!-- page-header 每頁標題 副標 -->
			<h1 class="page-header">修改產品資料 <small></small></h1>
			
			<!-- 內文 -->
			<div class="row">
			    <div class="col-md-12 ui-sortable">
	            <!-- **每頁不同的內容從這裡開始** -->
	                
	                <div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="panel panel-primary">
							<div class="panel-heading">產品編輯表單</div>
							<div class="panel-body">
								<form accept-charset="UTF-8"
									action="" class="simple_form form-horizontal" id="editForm" method="post">
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="prodId">
											產品ID
										</label>
										<div class="col-sm-8">
											<input class="form-control" disabled="disabled"
												id="prodId" name="prodId" type="text"
												value="${product.prodId}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="prodName">
											產品名稱
										</label>
										<div class="col-sm-8">
											<input class="string required form-control"
												id="prodName" name="prodName"
												placeholder="請輸入prodName" type="text"
												value="${product.prodName}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="brandId">
											<abbr title="required">*</abbr>
											品牌
										</label>
										<div class="col-sm-8">
											<select class="form-control" id="brandId" name="brandId"></select>
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="categoryId">
											<abbr title="required">*</abbr>
											類別
										</label>
										<div class="col-sm-8">
											<select class="form-control" id="categoryId" name="categoryId"></select>
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="weight">
											權重
										</label>
										<div class="col-sm-8">
											<input class="required number form-control"
												id="weight" name="weight"
												placeholder="請輸入weight" type="text"
												value="${product.weight}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="score">
											分數
										</label>
										<div class="col-sm-8">
											<input class="required number form-control"
												id="score" name="score"
												placeholder="請輸入score" type="text"
												value="${product.score}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="price">
											價格
										</label>
										<div class="col-sm-8">
											<input class="required digits form-control"
												id="price" name="price"
												placeholder="請輸入price" type="text"
												value="${product.price}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="capacity">
											容量
										</label>
										<div class="col-sm-8">
											<input class="required digits form-control"
												id="capacity" name="capacity"
												placeholder="請輸入capacity" type="text"
												value="${product.capacity}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="launchDate">
											發表日期
										</label>
										<div class="col-sm-8">
							                <div class="input-group date" id="datetimepicker">
							                    <input class="form-control" 
							                    	id="launchDate" name="launchDate"
							                    	type="text" value="${product.launchDate}" />
							                    <span class="input-group-addon">
							                        <span class="glyphicon glyphicon-calendar"></span>
							                    </span>
							                </div>
								        </div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="mainIgdt">
											<abbr title="required">*</abbr>
											主成分
										</label>
										<div class="col-sm-8">
											<select class="form-control" id="mainIgdt" name="mainIgdt">
												<option value="1">1. 主成分1</option>
												<option value="2">2. 主成分2</option>
												<option value="3">3. 主成分3</option>
											</select>
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="concentration">
											濃度
										</label>
										<div class="col-sm-8">
											<input class="required number form-control"
												id="concentration" name="concentration"
												placeholder="請輸入concentration" type="text"
												value="${product.concentration}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="prodDesc">
											產品說明
										</label>
										<div class="col-sm-8">
											​<textarea class="string required form-control" 
												id="prodDesc" name="prodDesc" 
												rows="5" cols="50">${product.prodDesc}</textarea>
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="prodDesc">
											產品圖片
										</label>
										<div class="col-sm-8">
											<input id="prodImgFile" name="prodImgFile" type="file" class="file-loading">
											<script>
											$(document).on('ready', function() {
											    $("#prodImgFile").fileinput({
											        showUpload: false,
											        maxFileCount: 1,
											        mainClass: "input-group-sm",
											        initialPreview: [
											        	"/products/show?prodImg="+$('#prodImg').val(),
											        ],
						                     		initialPreviewAsData: true,
						                     		initialPreviewFileType: 'image',
											    });
											});
											</script>
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<input type="hidden" id="prodImg" name="prodImg" value="${product.prodImg}" />
									
									<div class="form-group">
										<div class="col-sm-3"></div>	
										<div class="col-sm-7">
											<input class="btn btn-primary" type="button" 
												id="save" name="save" value="Save" />
											<input class="btn btn-primary" type="button" 
												id="clear" name="clear" value="Reset" />
											<input class="btn btn-primary" type="button" 
												id="cancel" name="cancel" value="Cancel" 
												onClick="location='/products/list'" />
										</div>
										<div class="col-sm-2"></div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-2"></div>
	                 
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
			
			// Set select init value
			$.ajax({
				url: '/brands/select',
				type: 'GET',
				dataType: 'json',
				success:function(response){
					var select = $('#brandId').empty();
					for(i=0; i<response.length; i++){
						select.append($('<option></option>').attr('value', response[i].brandId).text(i+1 + '. ' + response[i].brandName));
					}
					select.val("${product.brandId}");
				}
			});
			
			$.ajax({
				url: '/categories/select',
				type: 'GET',
				dataType: 'json',
				success:function(response){
					var select = $('#categoryId').empty();
					for(i=0; i<response.length; i++){
						select.append($('<option></option>').attr('value', response[i].categoryId).text(i+1 + '. ' + response[i].categoryName));
					}
					select.val("${product.categoryId}");
				}
			});
			
			$('#mainIgdt').val("${product.mainIgdt}");
			
			// Focus on first input
			$('#prodName').focus();
			
			// DateTimePicker
            $('#datetimepicker').datetimepicker(
            {
            	format: 'yyyy-mm-dd',
            	autoclose: true,
            	minView: 2,
            });
			
			// Validate
			var validate = $('#editForm').validate(
			{
				onfocusout: function (element) {
			        $(element).valid();
			    },
				rules: {
					weight: { range: [0, 5] },
					score: { range: [0, 5] },
					concentration: { range: [0, 1] },
					prodDesc: { rangelength: [1, 100] },
				},
				messages: {
					weight: { range: "range 0-5" },
					score: { range: "range 0-5" },
					concentration: { range: "range 0-1" },
					prodDesc: { rangelength: "text length 1-100" },
				}
			});
			
			// Save Click
			$('#save').click(function(){
				
				var validate = $('#editForm').validate().form();
				console.log(validate);
				
				var data = JSON.stringify($('form').serializeObject());
				console.log(data);
				
				if(validate){
					
					$('#prodId').prop('disabled', false);
					
					var formData = new FormData();
					formData.append('prodImgFile',$('#prodImgFile').prop('files')[0]);
					formData.append('product',
							new Blob([JSON.stringify($('#editForm').serializeObject())],
									{type: 'application/json'}));
					
					$.ajax({
						url: '/products/update',
						type: 'POST',
						contentType: false,
						processData: false,
						data:formData,
						dataType: 'json',
// 						contentType: 'application/json; charset=utf-8',
// 						data: JSON.stringify($('form').serializeObject()),
						success:function(response){
							//$('#prodId').prop('disabled', true);
							BootstrapDialog.show({
					            size: BootstrapDialog.SIZE_SMALL,
					            type: BootstrapDialog.TYPE_SUCCESS,
					            message: 'Update Product Success',
					        });
							console.log(response);
						}, 
						error: function(xhr, textStatus, errorThrown) {
							BootstrapDialog.show({
					            size: BootstrapDialog.SIZE_SMALL,
					            type: BootstrapDialog.TYPE_DANGER,
					            message: 'Update Product Fail, ' + 'Error! Status = ' + xhr.status,
					        });
						} 
					});
				}
			});
			
			// Reset Click
			$('#clear').click(
				function(){
					$("#editForm")[0].reset();
					$('#brandId').val("${product.brandId}");
					$('#categoryId').val("${product.categoryId}");
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