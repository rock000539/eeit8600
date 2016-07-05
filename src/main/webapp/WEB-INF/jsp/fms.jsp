<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>FMS index</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<!-- CSS -->
	<link rel="stylesheet" href="/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/fms-main.css" />
	<link rel="stylesheet" href="/css/fms-customize.css" />
	
	<style>
	.carousel-inner>.item>img, .carousel-inner>.item>a>img {
		width: 70%;
		margin: auto;
	}
	
	.carousel-control.left, .carousel-control.right {
		background-image: none;
		border-bottom: 0;
	}
	
	.carousel-indicators .active {
		background-color: #2ebaae
	}
	
	.carousel-indicators li {
		border: 1px solid #2ebaae;
	}
	
	.carousel-indicators {
		bottom: -10px;
	}
	
	
	
	table {
		border: 1px solid #95a6a3;
	}
	
	table td {
		text-align: center;
		vertical-align: middle;
		font-family: "Microsoft YaHei";
	}
	
	table th {
		border-bottom: 1px solid #95a6a3;
		color: #2ebaae;
		font-size: 1.2em;
		font-weight: 700;
		font-family: "Microsoft YaHei";
		padding: 0.5em 0.75em;
		text-align: center;
		background-color: #cefdf3;
	}
	
	table tbody tr {
		border: 0;
		border-left: 0;
		border-right: 0;
	}
	
	table tbody tr:nth-child(2n + 1) {
		background-color: #f4f4f4;
	}
	
	.error {
		color: #ff5353;
		margin-bottom: 0;
		font-family: "Microsoft YaHei";
	}
	
	#expdate input[type=button] {
		margin: 0 10px;
	}
	
	@media screen and (max-width: 480px) {
		.carousel-indicators {
			bottom: -20px;
		}
	}
	
	@media screen and (max-width: 768px) {
		.col-centered {
		float: none;
		margin: 0 auto;
	}
	}
	
	
	</style>
	
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	
	<script src="/js/jquery.validate.min.js"></script>
	
	<script src="/js/jquery.dropotron.min.js"></script>
	<script src="/js/skel.min.js"></script>
	<script src="/js/util.js"></script>
	<script src="/js/fms-main.js"></script>



</head>

<body>

	<!-- Wrapper -->
	<div id="wrapper">
		<!--加入header&nav -->
		<c:import url="fms_header_nav.jsp" />

		<!-- Main -->
		<div id="main">

			<!-- **每頁不同的內容從這裡開始** -->
			<div class="container">

				<div class="row">
				
					<!--Carousel -->
					<div class="col-md-8 col-sm-6">

						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="/img/carousel.jpg" alt="rank">
								</div>
								<div class="item">
									<img src="/img/carousel.jpg" alt="rank">
								</div>
								<div class="item">
									<img src="/img/carousel.jpg" alt="rank">
								</div>

							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel" role="button"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>

					<!-- 日期快搜 -->
					<div class=" col-centered col-md-3 col-sm-6">
						<form id="expdate">
							<table>
								<tr>
									<th colspan="2" id="title">日期快搜</th>
								</tr>
								<tr>
									<td>品牌</td>
									<td>
										<!--select要用div class="select-wrapper"包起來 -->
										<div class="select-wrapper">
										<select id="sbrand" name="sbrand">
										</select>
										</div>
									</td>
								</tr>
								<tr>
									<td>批號</td>
									<td><input type="text" id="batchCode" name="batchCode"
										size="15" /></td>
								</tr>
								<tr id="buttons">
									<td colspan="2"><input type="button" id="confirm"
										value="確認" /> <!--   		<input type="button" value="收藏"/> --></td>
								</tr>
							</table>
						</form>
					</div>

					<div class="col-md-1 col-sm-0"></div>

				</div>
			</div>
			<!-- 內容若要有方框效果，請用下面的article包起來 -->
			<!--                 <article class="post"> -->


			<!--                 </article> -->

			<!-- **每頁不同的內容結束** -->

			<!--加入intro&footer -->
			<c:import url="fms_intro_footer.jsp" />
		</div>
	</div>

	<script>
	$(function(){
		$('.carousel').carousel({
		  interval: 3000
		});
		
		$.ajax({
			url:'/brands/select',
			type:'post',
			dataType:'json',
			success:function(result){
				$('#sbrand').empty().append('<option></option>');
				$.each(result, function(index,value){					
// 					console.log(value.brandName);
					$('#sbrand').append($('<option></option>').attr('value',value.brandId).text(value.brandName));
				});
			}		
		});
		
		//日期快搜表單驗證
		$('#expdate').validate({
			rules:{
				sbrand:'required',
				batchCode:'required'
			},
			messages:{
				sbrand:'請輸入品牌',
				batchCode:'請輸入批號'
			}
		});
				
		$('#confirm').click(function(){
			if($('#expdate').validate().form()){
				var sbrand = $('#sbrand').val();
				var batchCode= $('#batchCode').val();
				$.ajax({
					url : '/expdate/batchCodeController',
					type : 'GET',
					data : {"brandIdstr" : sbrand,
							"batchCode" : batchCode},
					success:function(result){
						console.log(result);
						$('#buttons').before('<tr><td>製造日期</td><td>'+ result.mfdDate +'</td><tr>');
						$('#confirm').after('<input type="button" value="收藏"/>');
					}		
				});
			}else{
				alert('請依訊息更正錯誤');
			}
			
			
		});
		
	});
	</script>


</body>
</html>