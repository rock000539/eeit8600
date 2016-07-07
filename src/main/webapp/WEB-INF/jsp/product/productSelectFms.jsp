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
	<title>ProductSelectPage</title>
	
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
		
		.panel > .panel-body {
			height: 160px;
		}
		
		li {
			text-align: center
		}
		
		.row > .btn {
			background-color: #FF95CA;
			color: white;
		}
		
		.nav-tabs a {
			color: #FF95CA;
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
			<div class='tabs-x tabs-above tab-align-center tab-bordered tab-height-md tabs-krajee'>
			    <ul id="tabTitle" class="nav nav-tabs" role="tablist">
			        <li class="active"><a href="#home" role="tab" data-toggle="tab">基礎保養</a></li>
			        <li><a href="#profile" role="tab-kv" data-toggle="tab">加強保養</a></li>
			        <li><a href="#profile" role="tab-kv" data-toggle="tab">特別護理</a></li>
			        <li><a href="#profile" role="tab-kv" data-toggle="tab">底妝產品</a></li>
			        <li><a href="#profile" role="tab-kv" data-toggle="tab">重點彩妝</a></li>
			    </ul>
			    <div id="tabContent" class="tab-content">
			        <div class="tab-pane fade in active" id="tab1"><p>...</p></div>
			        <div class="tab-pane fade" id="tab2"><p>...</p></div>
			        <div class="tab-pane fade" id="tab3"><p>...</p></div>
			        <div class="tab-pane fade" id="tab4"><p>...</p></div>
			        <div class="tab-pane fade" id="tab5">...</div>
			    </div>
			</div>
		</div>
		<div class="col-lg-3"></div>
	</div>
		
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			// hide btn & select
			$('#search').hide();
			$('#contact').hide();
			$('#sprod').hide();
			
			// select-brand init
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
				success:function(response) {
					var select = $('#sbrand').empty();
					select.append($('<option></option>'));
					for(i=0; i<response.length; i++){
						select.append($('<option></option>').attr('value', response[i].brandId).text(response[i].brandName));
					}
				}
			});
			
			$('#sbrand').on('select2:select', function (evt) {
				// select-product init
				$('#sprod').select2({
					placeholder: 'Select a Product',
					allowClear: true,
					theme: 'classic',
				});
			});
			
			$('#sbrand').on('select2:select', function (evt) {
				// show btn
				$('#search').show();
				$('#contact').show();
				
				// append data to select #sprod
				$.ajax({
					url: '/products/searchbybrand',
					type: 'POST',
					dataType: 'json',
					contextType: 'application/json; charset=utf-8;',
					data: { 'brandId': $(this).val() },
					success:function(response){
						console.log(response);
						var select = $('#sprod').empty();
						select.append($('<option></option>'));
						for(i=0; i<response.length; i++){
							select.append($('<option></option>').attr('value', response[i].prodId).text(response[i].prodName));
						}
					}
				});
			});
			
			// Search Button Click
			$('#search').on('click', function() {
				console.log('search');
				if($('#sprod').val() == '') {
					
				} else {
					
				}
			});
			
			// Contact Button Click
			$('#contact').on('click', function() {
				console.log('contact');				
			});
			
			// tabs click
			$('div.tabs-x .nav-tabs [data-toggle="tab"]').on('tabsX.click', function (event) {
				
			});
			
			
		});
		
	</script>
	
</body>
</html>