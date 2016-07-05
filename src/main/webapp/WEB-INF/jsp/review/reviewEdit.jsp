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
    	
    <link rel="stylesheet" 
		href="/css/bootstrap-dialog.min.css" />
    <script
    	src="/js/bootstrap-dialog.min.js"></script>
    	
    <script src="/js/metisMenu.min.js"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Reivew Edit</title>
	
	<style>
		.col-md-6 {
			margin-top: 20px;
		}
		.error{
			color:red;
			font-style: italic;
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
	                
                	<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="panel panel-primary">
							<div class="panel-heading">Review Edit Form</div>
							<div class="panel-body">
								<form accept-charset="UTF-8"
									action="" class="simple_form form-horizontal" id="editForm" method="post">
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="reviewId">
											ID
										</label>
										<div class="col-sm-8">
											<input class="form-control" disabled="disabled"
												id="reviewId" name="reviewId" type="text"
												value="${review.reviewId}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
				
									<div class="form-group">
										<label class="col-sm-3 control-label" for="memberId">
											<abbr title="required">*</abbr>
											MemberId
										</label>
										<div class="col-sm-8">
											<select class="form-control" id="memberId" name="memberId"></select>
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">	
										<label class="col-sm-3 control-label" for="prodId">
											<abbr title="required">*</abbr>
											ProdID
										</label>
										<div class="col-sm-8">
											<select class="form-control" id="prodId" name="prodId"></select>
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="reviewTitle">
											ReviewTitle
										</label>
										<div class="col-sm-8">
											<input class="string required form-control"
												id="reviewTitle" name="reviewTitle"
												placeholder="請輸入reviewTitle" type="text"
												value="${review.reviewTitle}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									
									<!-- reviewRating 改用下拉是選單?-->
									<div class="form-group">
										<label class="col-sm-3 control-label" for="reviewRating">
											ReviewRating
										</label>
										<div class="col-sm-8">
											<input class="required number form-control"
												id="reviewRating" name="reviewRating"
												placeholder="請輸入reviewRating" type="text"
												value="${review.reviewRating}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
				
<!--
									<div class="form-group">
										<label class="col-sm-3 control-label" for="reviewRating">
											<abbr title="required"></abbr>
											ReviewRating
										</label>
										<div class="col-sm-8">
											<select class="form-control" id="reviewRating" name="reviewRating"></select>
										</div>
										<div class="col-sm-1"></div>
									</div>
-->

									<!--  圖片路徑 和 圖片
									<div class="form-group">
										<label class="col-sm-3 control-label" for="reviewImg">
											ReviewImgPath
										</label>
										<div class="col-sm-8">
											<input class="required number form-control"
												id="reviewImg" name="reviewImg"
												placeholder="請輸入reviewImg" 
												type="text" value="${review.reviewImg}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="prodImgFile">File</label>
										<div class="col-sm-9">
											<input class="file optional" id="user_horizontal_file"
												name="user_horizontal[file]" type="file" />
										</div>
									</div>
									-->
										
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="reviewTime">
											ReviewTime
										</label>
										<div class="col-sm-8">
							                <div class="input-group date" id="datetimepicker">
							                    <input class="form-control" 
							                    	id="reviewTime" name="reviewTime"
							                    	type="text" value="${review.reviewTime}" />
							                    <span class="input-group-addon">
							                        <span class="glyphicon glyphicon-calendar"></span>
							                    </span>
							                </div>
								        </div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="rewCollect">
											ReviewCollect
										</label>
										<div class="col-sm-8">
											<input class="required digits form-control"
												id="price" name="rewCollect"
												placeholder="請輸入rewCollect" type="text"
												value="${review.rewCollect}" />
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="reviewShow">
											ReviewShow
										</label>
										<div class="col-sm-8">		
										<label class="radio-inline">
									    	<input type="radio"
									    		name="reviewShow" value="Show" ${review.reviewShow=='true'? 'checked':''}> Show
									    </label>
									    <label class="radio-inline">
									    	<input type="radio"
									    		name="reviewShow" value="Hide" ${review.reviewShow=='false'? 'checked':''}> Hide
										</label>										
										</div>
										<div class="col-sm-1"></div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label" for="review">
											Review
										</label>
										<div class="col-sm-8">
											​<textarea class="string required form-control" 
												id="review" name="review" 
												rows="8" cols="50">${review.review}</textarea>
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
												onClick="location='/reviews/listgrid'" />
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
			// Set select init value
			$.ajax({
				url: '/members/select',
				type: 'GET',
				dataType: 'json',
				success:function(response){
					var select = $('#memberId').empty();
					for(i=0; i<response.length; i++){
						select.append($('<option></option>').attr('value', response[i].memberId).text(i+1 + '. ' + response[i].firstName + response[i].lastName));
					}
					select.val("${review.memberId}");
				}
			});
			
			$.ajax({
				url: '/products/select',
				type: 'GET',
				dataType: 'json',
				success:function(response){
					var select = $('#prodId').empty();
					for(i=0; i<response.length; i++){
						select.append($('<option></option>').attr('value', response[i].prodId).text(i+1 + '. ' + response[i].prodName));
					}
					select.val("${review.prodId}");
				}
			});
			
/*			$.ajax({
				url: '/reviews/select',
				type: 'GET',
				dataType: 'json',
				success:function(response){
					console.log(response);
					var select = $('#reviewRating').empty();
					for(i=1; i<=5; i++){
						select.append($('<option></option>').attr('value',i)
								.text(i));
					}
					select.val("${review.reviewRating}");
// 					select.val(response.reviewRating);
				}
			});
*/			
			
			//$('#mainIgdt').val("${product.mainIgdt}");   //??????
			
			// Focus on first input
			$('#reviewTitle').focus();
			
			// DateTimePicker
            $('#datetimepicker').datetimepicker(
            {
            	format: 'yyyy-mm-dd',
            	autoclose: true,
            	minView: 20,
            });
			
			
			//start  start  start  start   start  start
			
			
			// Validate
			var validate = $('#editForm').validate(
			{
				onfocusout: function (element) {
			        $(element).valid();
			    },
				rules: {
// 					reviewRating: { range: [0,1,2,3,4,5] },  //this is ok
					score: { range: [0, 5] },
					concentration: { range: [0, 1] },
					prodDesc: { rangelength: [1, 100] },
				},
				messages: {
// 					reviewRating: { range: "select 0,1,2,3,4,5" }, //this is ok
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
					$.ajax({
						url: '/products/update',
						type: 'POST',
						contentType: 'application/json; charset=utf-8',
						dataType: 'json',
						data: JSON.stringify($('form').serializeObject()),
						success:function(response){
							$('#prodId').prop('disabled', true);
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