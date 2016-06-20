<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!-- BootStrap 基本檔案  -->
	<link rel="stylesheet"
		href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
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
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>productEdit</title>
	
	<style>
		.col-md-6 {
			margin-top: 20px;
		}
		.error{
			color:red;
		}
		textarea {
		    resize: none;
		}
	</style>

</head>
<body>

	<div class="col-md-3"></div>
	<div class="col-md-6">
		<div class="panel panel-primary">
			<div class="panel-heading">Product Edit Form</div>
			<div class="panel-body">
				<form accept-charset="UTF-8"
					action="" class="simple_form form-horizontal" id="editForm" method="post">
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="prodId">
							prodId
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
							prodName
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
							brandId
						</label>
						<div class="col-sm-8">
							<select class="form-control" id="brandId" name="brandId"></select>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="categoryId">
							<abbr title="required">*</abbr>
							categoryId
						</label>
						<div class="col-sm-8">
							<select class="form-control" id="categoryId" name="categoryId"></select>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="weight">
							weight
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
							score
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
							price
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
							capacity
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
							launchDate
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
							mainIgdt
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
							concentration
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
							prodDesc
						</label>
						<div class="col-sm-8">
							​<textarea class="string required form-control" 
								id="prodDesc" name="prodDesc" 
								rows="5" cols="50">${product.prodDesc}</textarea>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<!--
					<div class="form-group">
						<label class="col-sm-3 control-label" for="prodImgFile">File</label>
						<div class="col-sm-9">
							<input class="file optional" id="user_horizontal_file"
								name="user_horizontal[file]" type="file" />
						</div>
					</div>
					-->
					
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
	<div class="col-md-3"></div>
	
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