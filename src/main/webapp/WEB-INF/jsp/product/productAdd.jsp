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
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>productAdd</title>
	
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
			<div class="panel-heading">Product Add Form</div>
			<div class="panel-body">
				<form accept-charset="UTF-8"
					action="" class="simple_form form-horizontal" id="addForm" method="post">
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="prodName">
							prodName
						</label>
						<div class="col-sm-8">
							<input class="string required form-control"
								id="prodName" name="prodName"
								placeholder="請輸入prodName" type="text"/>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="brandId">
							<abbr title="required">*</abbr>
							brandId
						</label>
						<div class="col-sm-8">
							<select class="form-control" id="brandId" name="brandId">
								<option value="1">1. 蜜妮</option>
								<option value="2">2. 蘭蔻</option>
								<option value="3">3. 巴黎萊雅</option>
							</select>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="categoryId">
							<abbr title="required">*</abbr>
							categoryId
						</label>
						<div class="col-sm-8">
							<select class="form-control" id="categoryId" name="categoryId">
								<option value="1">1. lotion</option>
								<option value="2">2. cream</option>
								<option value="3">3. sun protection</option>
							</select>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="weight">
							weight
						</label>
						<div class="col-sm-8">
							<input class="required form-control"
								id="weight" name="weight"
								placeholder="請輸入weight" type="text"/>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="score">
							score
						</label>
						<div class="col-sm-8">
							<input class="required form-control"
								id="score" name="score"
								placeholder="請輸入score" type="text"/>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="price">
							price
						</label>
						<div class="col-sm-8">
							<input class="required form-control"
								id="price" name="price"
								placeholder="請輸入price" type="text"/>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="capacity">
							capacity
						</label>
						<div class="col-sm-8">
							<input class="required form-control"
								id="capacity" name="capacity"
								placeholder="請輸入capacity" type="text"/>
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
			                    	type="text" />
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
								<option value="1">1. 二氧化鈦</option>
							</select>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="concentration">
							concentration
						</label>
						<div class="col-sm-8">
							<input class="required form-control"
								id="concentration" name="concentration"
								placeholder="請輸入concentration" type="text"/>
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
								rows="5" cols="50"></textarea>
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
			
			// DateTimePicker
            $('#datetimepicker').datetimepicker(
            {
            	format: 'yyyy-mm-dd',
            	autoclose: true,
            	minView: 2,
            	
            });
			
			// Validate
			var validate = $('#addForm').validate(
			{
				rules: {
					weight: { number: true, range: [0, 5] },
					score: { number: true, range: [0, 5] },
					price: { digits: true },
					capacity: { digits: true },
					concentration: { number: true, range: [0, 1] },
					prodDesc: { rangelength: [1, 100] }
				},
				messages: {
					weight: { number: "This field is a positive integer", range: "range 0-5" },
					score: { number: "This field is a positive integer", range: "range 0-5" },
					price: "This field is a positive integer",
					capacity: "This field is a positive integer",
					concentration: { number: "This field is a positive float", range: "range 0-1" },
					prodDesc: { rangelength: "text length 1-100" }
				}
			});
			
			// Save Click
			$('#save').click(function(){
				
				var validate = $('#addForm').validate().form();
				console.log(validate);
				
				var data = JSON.stringify($('form').serializeObject());
				console.log(data);
				
				if(validate){
					$.ajax({
						url: '/products/insert',
						type: 'POST',
						contentType: 'application/json; charset=utf-8',
						dataType: 'json',
						data: JSON.stringify($('form').serializeObject()),
						success:function(response){
							console.log(response);
						}, 
						error: function(xhr, textStatus, errorThrown) { 
						    alert('Error! Status = ' + xhr.status); 
						} 
					});
				}
			});
			
			// Reset Click
			$('#clear').click(
				function(){
					$("#addForm")[0].reset();
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