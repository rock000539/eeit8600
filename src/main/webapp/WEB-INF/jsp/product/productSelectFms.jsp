<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<script src="/js/jquery.min.js"></script>
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">	
	<script src="/js/bootstrap.min.js"></script>
	
	<!-- Select2 Plugin --> <!-- https://goo.gl/iMeVYA -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
	
	<!-- Tabs Plugin --> <!-- http://goo.gl/rw6ooU -->
	<link href="/css/bootstrap-tabs-x.min.css" media="all" rel="stylesheet" type="text/css" />
	<script src="/js/bootstrap-tabs-x.min.js" type="text/javascript"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ProductSelect</title>
	
	<style type="text/css">
	
		.panel {
			margin-top: 10px;
			border:1px solid #FF95CA;
		}
		.panel > .panel-heading {
    		background-image: none;
    		background-color: #FF95CA;
    		color: white;
    		border-bottom:1px solid #FF95CA;
    		text-align: center;
		}
		
		li {
			text-align: center
		}
		
		.row > .btn {
			background-color: #FF95CA;
			color: white;
		}
		
	</style>
	
</head>
<body>

	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="panel">
				<div class="panel-heading">選擇品牌名稱，搜尋產品！</div>
				<div class="panel-body">
					<div class="col-sm-1"></div>
					<div class="col-sm-10 text-center">
						<div class="row">
							<select id="sbrand" class="js-example-basic-single" style="width: 80%;"></select>
						</div>
						<br/>
						<div class="row">
							<select id="sprod" class="js-example-basic-single" style="width: 80%;"></select>
						</div>
						<br/>
						<div class="row">
							<button id="search" type="button" class="btn">搜尋商品</button>
							<button id="contact" type="button" class="btn">找不到商品嗎？</button>
						</div>
					</div>
					<div class="col-sm-1"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	
	<div>
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class='tabs-x tabs-above tab-bordered tabs-krajee'>
			    <ul id="myTab-5" class="nav nav-tabs" role="tablist">
			        <li class="active"><a href="#home-5" role="tab" data-toggle="tab">Home</a></li>
			        <li><a href="#profile-5" role="tab-kv" data-toggle="tab">Profile</a></li>
			        <li class="dropdown">
			            <a href="#" id="myTabDrop-5" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
			            <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop-1">
			                <li><a href="#dropdown-5-1" tabindex="-1" role="tab" data-toggle="tab">Option 1</a></li>
			                <li><a href="#dropdown-5-2" tabindex="-1" role="tab" data-toggle="tab">Option 2</a></li>
			            </ul>
			        </li>
			        <li class="disabled"><a href="#disabled-5"><i class="glyphicon glyphicon-knight"></i> Disabled</a></li>
			    </ul>
			    <div id="myTabContent-5" class="tab-content">
			        <div class="tab-pane fade in active" id="home-5"><p>...</p></div>
			        <div class="tab-pane fade" id="profile-5"><p>...</p></div>
			        <div class="tab-pane fade" id="dropdown-5-1"><p>...</p></div>
			        <div class="tab-pane fade" id="dropdown-5-2"><p>...</p></div>
			        <div class="tab-pane fade" id="disabled-5">Disabled Content</div>
			    </div>
			</div>
		</div>
		<div class="col-lg-3"></div>
	</div>
		
	<script type="text/javascript">
		$(document).ready(function() {
			
			$('#sbrand').select2({
				placeholder: 'Select a brand',
				allowClear: true,
				theme: 'classic',
			});
			
			// append data to select #sbrand
			$.ajax({
				url: '/brands/select',
				type: 'GET',
				dataType: 'json',
				success:function(response){
					var select = $('#sbrand').empty();
					select.append($('<option></option>'));
					for(i=0; i<response.length; i++){
						select.append($('<option></option>').attr('value', response[i].brandId).text(response[i].brandName));
					}
				}
			});
			
			$('#sbrand').on('select2:select', function (evt) {
				
			});
			
			$('#sprod').select2({
				placeholder: 'Select a Product',
				allowClear: true,
				theme: 'classic',
			});
			
			$('#sprod').attr('disabled', true);
			
		});
	</script>
	
</body>
</html>