<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>productAdd</title>

<style>
	.col-md-6 {
		margin-top: 20px;
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
					action="" class="simple_form form-horizontal" id="" method="post">
					
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
						<label class="col-sm-3 control-label" for="weight">
							weight
						</label>
						<div class="col-sm-8">
							<input class="string required form-control"
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
							<input class="string required form-control"
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
							<input class="string required form-control"
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
							<input class="string required form-control"
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
							<input class="string required form-control"
								id="launchDate" name="launchDate"
								placeholder="請輸入launchDate" type="text"/>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="mainIgdt">
							mainIgdt
						</label>
						<div class="col-sm-8">
							<input class="string required form-control"
								id="mainIgdt" name="mainIgdt"
								placeholder="請輸入mainIgdt" type="text"/>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="concentration">
							concentration
						</label>
						<div class="col-sm-8">
							<input class="string required form-control"
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
								rows="5" cols="50">
							</textarea>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="brandId">
							<abbr title="required">*</abbr>
							brandId
						</label>
						<div class="col-sm-8">
							<select class="required form-control" id="brandId" name="brandId">
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
							<input class="string required form-control"
								id="categoryId" name="categoryId"
								placeholder="請輸入categoryId" type="text"/>
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
						<div class="col-sm-4"></div>	
						<div class="col-sm-4">
							<input class="btn btn-primary" type="button" 
								id="save" name="save" value="Save" />
							<input class="btn btn-primary" type="button" 
								id="cancel" name="cancel" value="Cancel" />
						</div>
						<div class="col-sm-4"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-md-3"></div>

</body>
</html>