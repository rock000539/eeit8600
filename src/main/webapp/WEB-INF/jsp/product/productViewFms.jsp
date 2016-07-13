<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<script src="/js/jquery.min.js"></script>
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">	
	<script src="/js/bootstrap.min.js"></script>
	
    <link rel="stylesheet" href="/css/pview/wide.css">
    <link rel="stylesheet" href="/css/pview/style.css">
    <link href="/css/font-awesome.min.css" rel="stylesheet">
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ProductViewPage</title>
	
	<style>
	
		body {
			font-size: 100%;
			font-family: Microsoft JhengHei, "Droid Serif", serif;
		}
	
		.blogPic > img {
			border-radius: 10px 10px 0px 0px;
		}
		
		.blogDetail {
			border-radius: 0px 0px 10px 10px;
			margin-bottom: 30px;
		}
		
		.blogMeta > span {
			font-size: 14px;
		}
		
/* 		.fa-link { */
/* 			margin-top: 12px; */
/* 		} */
		
/* 		.blogPic .blog-hover .icon { */
/* 			margin: -5px 0px 0px -5px; */
/* 		} */
		
		.is-hidden {
			visibility: hidden;
		}
		
		.bounce-in {
			visibility: visible;
			-webkit-animation: cd-bounce-2 0.6s;
			-moz-animation: cd-bounce-2 0.6s;
			animation: cd-bounce-2 0.6s;
		}
		
		
		/* ---------- animate ---------- */
		@-webkit-keyframes cd-bounce-1 {
		
			0% { 
			  opacity: 0;
			  -webkit-transform: scale(0.5);
			}

			60% {
			  opacity: 1;
			  -webkit-transform: scale(1.2);
			}

			100% {
			  -webkit-transform: scale(1);
			}
			
		}
		
		@keyframes cd-bounce-1 {
		
			0% {
				opacity: 0;
				-webkit-transform: scale(0.5);
				-moz-transform: scale(0.5);
				-ms-transform: scale(0.5);
				-o-transform: scale(0.5);
				transform: scale(0.5);
			}

			60% {
				opacity: 1;
				-webkit-transform: scale(1.2);
				-moz-transform: scale(1.2);
				-ms-transform: scale(1.2);
				-o-transform: scale(1.2);
				transform: scale(1.2);
			}

	  		100% {
				-webkit-transform: scale(1);
				-moz-transform: scale(1);
				-ms-transform: scale(1);
				-o-transform: scale(1);
				transform: scale(1);
	  		}
	  		
		}

		@-webkit-keyframes cd-bounce-3 {
		
			0% { 
				opacity: 0;
				-webkit-transform: scale(0.5);
  			}

			60% {
				opacity: 1;
			  	-webkit-transform: scale(1.1);
			}

			100% {
			  	-webkit-transform: scale(1);
			}
			
		}

		@-webkit-keyframes cd-bounce-2 {
		
			0% {
			  	opacity: 0;
				-webkit-transform: translateX(-100px);
			}

			60% {
				opacity: 1;
			  	-webkit-transform: translateX(20px);
			}

			100% {
				-webkit-transform: translateX(0);
			}
			
		}
		
		@keyframes cd-bounce-2 {
		
			0% {
				opacity: 0;
			  	-webkit-transform: translateX(-100px);
			  	-moz-transform: translateX(-100px);
			  	-ms-transform: translateX(-100px);
			  	-o-transform: translateX(-100px);
			  	transform: translateX(-100px);
			}

			60% {
				opacity: 1;
				-webkit-transform: translateX(20px);
				-moz-transform: translateX(20px);
				-ms-transform: translateX(20px);
				-o-transform: translateX(20px);
				transform: translateX(20px);
			}

			100% {
				-webkit-transform: translateX(0);
				-moz-transform: translateX(0);
				-ms-transform: translateX(0);
				-o-transform: translateX(0);
				transform: translateX(0);
			}
		
		}

		@-webkit-keyframes cd-bounce-2-inverse {
		
			0% {
				opacity: 0;
			  	-webkit-transform: translateX(100px);
			}

			60% {
				opacity: 1;
			  	-webkit-transform: translateX(-20px);
			}

			100% {
				-webkit-transform: translateX(0);
			}
			
		}
		
		@keyframes cd-bounce-2-inverse {
		
			0% {
				opacity: 0;
				-webkit-transform: translateX(100px);
				-moz-transform: translateX(100px);
				-ms-transform: translateX(100px);
				-o-transform: translateX(100px);
				transform: translateX(100px);
			}

			60% {
			  	opacity: 1;
			  	-webkit-transform: translateX(-20px);
			  	-moz-transform: translateX(-20px);
			  	-ms-transform: translateX(-20px);
			 	-o-transform: translateX(-20px);
			  	transform: translateX(-20px);
			}

			100% {
				-webkit-transform: translateX(0);
				-moz-transform: translateX(0);
				-ms-transform: translateX(0);
				-o-transform: translateX(0);
				transform: translateX(0);
			}
		
		}
		
	</style>
	
</head>
<body>
	
	<!--start wrapper-->
	<section class="wrapper">
		<section class="content portfolio_single">
			<div class="container">
			
				<div class="row sub_content">
					
					<div class="col-lg-3 col-md-3 col-sm-3"></div>
				
					<div class="col-lg-3 col-md-3 col-sm-3">
						
						<div class="images-style-inner" style="text-align:center;">
							<img class="img-thumbnail" src="http://localhost:8080/products/show?prodId=${product.prodId}" style="width:250px; height:auto;" />
						</div>
						
						<div class="" style="margin-top:20px; text-align:center;">
							
			                <a href="#fakelink" class="btn btn-sm btn-social-facebook" style="border-radius:5px;">
			                    <i class="fa fa-facebook"></i>
			                    <span class="btn-tip">&nbsp;&nbsp;分享</span>
			                </a>
			
			                <a href="#fakelink" class="btn btn-sm btn-social-linkedin" style="border-radius:5px;">
			                    <i class="fa fa-pencil"></i>
			                    <span class="btn-tip">&nbsp;心得</span>
			                </a>
			
			                <a href="#fakelink" class="btn btn-sm btn-social-pinterest" style="border-radius:5px;">
			                    <i class="glyphicon glyphicon-fire"></i>
			                    <span class="btn-tip">&nbsp;升火</span>
			                </a>
	
			                <a href="#fakelink" class="btn btn-sm btn-social-stumbleupon" style="border-radius:5px;">
			                    <i class="glyphicon glyphicon-floppy-open"></i>
			                    <span class="btn-tip">&nbsp;收藏</span>
			                </a>
				            
						</div>
					</div>
					
					<div class="col-lg-4 col-md-4 col-sm-4">
						<div class="project_details">
							<div class="widget_title">
								<h4><span>Product Details</span></h4>
							</div>
							<ul class="details">
								<li><span>Name :</span>${product.prodName}</li>
								<li><span>Date :</span>${product.launchDate}</li>
								<li><span>Brand :</span>${product.brand.brandName}</li>
								<li><span>Category :</span>${product.category.categoryName}</li>
								<li><span>Ingredient :</span> <a href="#">${product.mainIgdt}</a></li>
							</ul>
						</div>
						<div class="project_description">
							<div class="widget_title">
								<h4><span>Product Descriptions</span></h4>
							</div>

							<p>${product.prodDesc}</p>
						</div>
					</div>
					
					<div class="col-lg-2 col-md-2 col-sm-2"></div>
					
				</div>
				
				<div class="row sub_content">
					<div class="carousel-intro">
						<div class="col-md-12">
							<div class="dividerHeading">
								<h4><span>Recent Reviews</span></h4>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				
				<div class="row">
					
					<c:forEach items="${product.reviews}" var="review">
					
						<div class="col-lg-3 col-md-4 col-xs-12 rec_blog">
							<div class="blogPic">
								<img src="http://localhost:8080/products/show?prodId=${review.prodId}" style="width:263px; height:auto; border: 1px solid #f2f2f2;">
								<div class="blog-hover">
									<a href="#">
									</a>
								</div>
							</div>
							<div class="blogDetail" style="width:263px; height:211px;">
								<div class="blogTitle">
									<a href="#">
										<h4>${fn:substring(review.reviewTitle, 0, 21)}</h4>
									</a>
									<span>
										<i class="fa fa-calendar"></i>
										${review.reviewTime} &nbsp;
									</span>
									<span>
										<c:forEach begin="1" end="${review.reviewRating}">
											<i class="fa fa-diamond"></i>
										</c:forEach>
									</span>
								</div>
								<div class="blogContent">
									<c:if test="${fn:substring(review.review, 0, 2) == '內文' }">
										<p>Etu eros omnes theophratus mei, cumit usulan dicit omnium eripuit. Qui tever iluma facete gubergren. </p>
									</c:if>
									<c:if test="${fn:substring(review.review, 0, 2) != '內文' }">
										<p>${fn:substring(review.review, 0, 50)} ...</p>
									</c:if>
								</div>
								<div class="blogMeta">
									<span>
										<i class="fa fa-user"></i>
										${review.member.nickname}&nbsp;&nbsp;&nbsp;
									</span>
									<span>
										<i class="fa fa-comment"></i>
										${review.rewCollect}
									</span>
								</div>
							</div>
						</div>
						
					</c:forEach>
					
				</div>
				
			</div>
		</section>
	</section>
	<!--end wrapper-->
	
	<script src="/js/product/pview/jquery.jcarousel.js"></script>	
    <script src="/js/product/pview/jquery-scrolltofixed-min.js"></script>
    <script src="/js/product/pview/jflickrfeed.js"></script>
    <script src="/js/product/pview/jquery.magnific-popup.min.js"></script>
    <script src="/js/product/pview/swipe.js"></script>
	<script src="/js/product/pview/main.js"></script>
	
	<script>
	
		//console.log('${product}');
		console.log('${product.category.categoryName}');
		console.log('${product.brand.brandName}');
		console.log('${product.reviews.size()}');
		
		var timelineBlocks = $('.rec_blog'),
		offset = 0.9;

		hideBlocks(timelineBlocks, offset);
	
		//on scolling, show/animate timeline blocks when enter the viewport
		$(window).on('scroll', function(){
			(!window.requestAnimationFrame) 
				? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
				: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
		});
	
		function hideBlocks(blocks, offset) {
			blocks.each(function(){
				( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.blogPic, .blogDetail').addClass('is-hidden');
			});
		}
	
		function showBlocks(blocks, offset) {
			blocks.each(function(){
				( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.blogPic').hasClass('is-hidden') ) && $(this).find('.blogPic, .blogDetail').removeClass('is-hidden').addClass('bounce-in');
				console.log("show"+$(this));
			});
		}
			
	</script>
	
</body>
</html>