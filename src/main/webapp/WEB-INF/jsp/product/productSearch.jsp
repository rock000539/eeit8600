<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<!-- 基本檔案 -->
	<script src="/js/jquery.min.js"></script>
	<link href="/css/bootstrap.min.css" rel="stylesheet">	
	<script src="/js/bootstrap.min.js"></script>
	
	<!-- Header & Footer -->
	<link rel="stylesheet" href="/css/fms/style.css">
	<link rel="stylesheet" href="/css/fms/fms-customize.css">
	
	<!-- ThisPage Template --> <!-- Electrify Template -->
	<link href="/css/product/product-search.css" rel="stylesheet" />

	<!-- Select2 Plugin -->
	<link href="/css/product/select2.min.css" rel="stylesheet" />
	<script src="/js/product/search/select2.min.js"></script>
	
	<!-- jQuery Redirect Plugin -->
	<script src="/js/jquery.redirect.js"></script>	
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>搜尋產品</title>
	
	<style>
		
	</style>
	
</head>
<body>

	<!--加入header&nav -->
	<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />

	<!-- **每頁不同的內容從這裡開始** -->
	<div class="grey_bg row bgcolor">
	
		<section class="content service">
			<div class="container">
				<div class="row sub_content">
				    <div class="col-sm-3"></div>
				    <div class="col-sm-6">
				        <div class="serviceBox_4">
				            <div class="service-icon">
				                <i class="glyphicon glyphicon-search" style="margin-top: 22px; margin-left: 8px;"></i>
				            </div>
				            <div class="service-content">
				                <h2>選擇品牌名稱，搜尋產品！</h2>
				            </div>
				            <div class="row">
								<select id="sbrand" class="js-example-basic-single" style="width: 80%; visibility: hidden;">
									<option value="0">請選擇品牌</option>
									<c:forEach items="${brands}" var="brand">
										<option value="${brand.brandId}">${brand.brandName}</option>
									</c:forEach>
								</select>
							</div>
							<br/>
							<div class="row">
								<select id="sprod" class="js-example-basic-single" style="width: 80%"></select>
							</div>
							<br/>
				            <div class="read">
				                <a id="search" class="btn btn-default"><i class="fa fa-search"></i>&nbsp;搜尋商品</a>
				                <a id="contact" class="btn btn-default"><i class="glyphicon glyphicon-question-sign"></i>&nbsp;找不到商品嗎？</a>
				            </div>
				        </div>
				    </div>
				    <div class="col-sm-3"></div>
				</div>
			</div>
		</section>
		
		<section class="super_sub_content" style="padding-top: 0px;">
		
	        <div class="dividerHeading text-center col-sm-12">
	            <h4><span>RECENT CATEGORIES ITEMS</span></h4>
	        </div>
	
	        <nav class="clearfix col-sm-12">
	            <ul id="filter">
	                <li data-filter="*" class="selected"><a href="#">所有分類</a></li>
	                <li data-filter=".MAKEUP"><a href="#">化妝相關</a></li>
	                <li data-filter=".SKINCARE"><a href="#">護膚保養</a></li>
	                <li data-filter=".BATHBODY"><a href="#">美體健康</a></li>
	                <li data-filter=".HAIR"><a href="#">美髮美甲</a></li>
	            </ul>
	        </nav>
			
	        <div class="portfolio-centered">
	            <div id="categoryContainer" class="recentitems portfolio">
	
					<c:forEach items="${categories}" var="category">
		                <div class="portfolio-item ${category.categoryTitle}">
		                    <div class="box">
		                        <img src="<%= request.getContextPath() %>/categories/show?categoryId=${category.categoryId}" style="width:200px; height:200px;">
		                        <div class="option inner">
		                            <div>
		                                <h5>${category.categoryName}</h5>
		                                <a href="<%= request.getContextPath() %>/categories/show?categoryId=${category.categoryId}" class="fa fa-search mfp-image"></a>
		                                <a class="fa fa-link" data-categoryId="${category.categoryId}" onClick="category_click($(this))" ></a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
					</c:forEach>
	
	            </div>
	        </div>
	    </section>
	    
	</div>        
    <!-- **每頁不同的內容結束** -->

	<!--加入footer -->
	<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
	
	<!-- Header & Footer -->
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>

	<!-- Product相關頁面共用檔案 -->
	<script src="/js/product/jquery-scrolltofixed-min.js"></script>
	<script src="/js/product/jquery.magnific-popup.min.js"></script>
    <script src="/js/product/jflickrfeed.js"></script>
    <script src="/js/product/swipe.js"></script>
    <script src="/js/product/wow.min.js"></script>

	<!-- 此頁面特定檔案 -->
	<script src="/js/product/search/jquery-hoverdirection.min.js"></script>
	<script src="/js/product/search/jquery.isotope.min.js"></script>
	<script src="/js/product/search/main.js"></script>
	
	<script>
	
		$(function() {
			
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
			
			$('#sbrand').on('select2:select', function (evt) {
				
				if($(this).val() > 0) {
					
					// select-product init
					$('#sprod').select2({
						placeholder: '請選擇產品',
						allowClear: true,
						theme: 'classic',
					});
					
					// show btn
					$('#search').show();
					$('#contact').show();
					
					// append data to select #sprod
					$.ajax({
						url: '/products/search/' + $(this).val(),
						type: 'POST',
						dataType: 'json',
						contextType: 'application/json; charset=utf-8;',
						success:function(response){
							var select = $('#sprod').empty();
							select.append($('<option>請選擇產品</option>'));
							for(i=0; i<response.length; i++) {
								select.append($('<option></option>').attr('value', response[i].prodId).text(response[i].prodName));
							}
						}
					});
					
				}
				
			});
			
			// Search Button Click
			$('#search').on('click', function() {
				console.log($('#sprod').val());
				if($('#sprod').val() == '請選擇產品' || $('#sprod').val() == null) {
					document.location.href='/products/inventory?brandId=' + $('#sbrand').val();
				} else if($('#sprod').val() != '請選擇產品') {
					document.location.href='/products/view/' + $('#sprod').val();
				}
			});
			
			// Contact Button Click
			$('#contact').on('click', function() {
				document.location.href='/contact';		
			});
			
		});
		
		// Category Button Click
		function category_click(a) {
			document.location.href='/products/inventory?categoryId=' + $(a).attr('data-categoryId');
		}

	</script>
	
	<!-- Categories Items Animate -->
	<script>
	
        $(function() {
        	
            "use strict";
            
            var $container = $('.portfolio'),
                    $items = $container.find('.portfolio-item'),
                    portfolioLayout = 'fitRows';

            if( $container.hasClass('portfolio-centered') ) {
                portfolioLayout = 'masonry';
            }

            $container.isotope({
                filter: '*',
                animationEngine: 'best-available',
                layoutMode: portfolioLayout,
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false
                },
                masonry: {
                }
            }, refreshWaypoints());

            function refreshWaypoints() {
                setTimeout(function() {
                }, 1000);
            }

            $('ul#filter li').on('click', function() {
                var selector = $(this).attr('data-filter');
                $container.isotope({ filter: selector }, refreshWaypoints());
                $('ul#filter li').removeClass('selected');
                $(this).addClass('selected');
                return false;
            });

            function getColumnNumber() {
                var winWidth = $(window).width(),
                        columnNumber = 1;

                if (winWidth > 1200) {
                    columnNumber = 5;
                } else if (winWidth > 950) {
                    columnNumber = 4;
                } else if (winWidth > 600) {
                    columnNumber = 3;
                } else if (winWidth > 400) {
                    columnNumber = 2;
                } else if (winWidth > 250) {
                    columnNumber = 1;
                }
                return columnNumber;
            }

            function setColumns() {
                var winWidth = $(window).width(),
                        columnNumber = getColumnNumber(),
                        itemWidth = Math.floor(winWidth / columnNumber);

                $container.find('.portfolio-item').each(function() {
                    $(this).css( {
                        width : itemWidth + 'px'
                    });
                });
            }

            function setPortfolio() {
                setColumns();
                $container.isotope('reLayout');
            }

            $container.imagesLoaded(function () {
                setPortfolio();
            });

            $(window).on('resize', function () {
                setPortfolio();
            });
            
    	});
        
    	// WOW Animation
        new WOW().init();
        
    </script>
	
</body>
</html>