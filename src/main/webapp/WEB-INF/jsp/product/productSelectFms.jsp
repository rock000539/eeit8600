<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<script src="/js/jquery.min.js"></script>
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">	
	<script src="/js/bootstrap.min.js"></script>
	
	<!-- Select2 Plugin --> <!-- https://goo.gl/iMeVYA -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
	
	<!-- Electrify-Template -->
    <link rel="stylesheet" href="/css/pselect/style.css">
    <link rel="stylesheet" href="/css/pselect/wide.css">
	
	<!-- jQuery Redirect Plugin -->
	<script src="/js/jquery.redirect.js"></script>	
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ProductSelectPage</title>
	
	<style type="text/css">
	
		body {
			font-size: 100%;
			font-family: Microsoft JhengHei, "Droid Serif", serif;
		}
		
		.serviceBox_4 .service-icon {
			margin-left: 12px;
		}
		
		.glyphicon-search {
			margin-top: 30px;
		}
		
		.box {
			padding: 10px;
			text-align: center;
		}
		
		.box > img {
			width: 200px;
			height: 200px;
		}
		
	</style>
	
</head>
<body>

	<section class="content service" style="padding-bottom: 10px;">
		<div class="container">
			<div class="row sub_content">
			    <div class="col-lg-3"></div>
			    <div class="col-lg-6">
			        <div class="serviceBox_4">
			            <div class="service-icon">
			                <i class="glyphicon glyphicon-search" style="margin-top: 22px; margin-left: 8px;"></i>
			            </div>
			            <div class="service-content">
			                <h2>選擇品牌名稱，搜尋產品！</h2>
			            </div>
			            <div class="row">
							<select id="sbrand" class="js-example-basic-single" style="width: 80%;"></select>
						</div>
						<br/>
						<div class="row">
							<select id="sprod" class="js-example-basic-single" style="width: 80%;"></select>
						</div>
						<br/>
			            <div class="read">
			                <a id="search" class="btn btn-default"><i class="fa fa-search"></i>&nbsp;搜尋商品</a>
			                <a id="contact" class="btn btn-default"><i class="glyphicon glyphicon-question-sign"></i>&nbsp;找不到商品嗎？</a>
			            </div>
			        </div>
			    </div>
			    <div class="col-lg-3"></div>
			</div>
		</div>
	</section>
	
	<section class="super_sub_content" style="padding-top: 0px;">
	
        <div class="dividerHeading text-center">
            <h4><span>RECENT CATEGORIES ITEMS</span></h4>
        </div>

        <nav class="clearfix">
            <ul id="filter">
                <li data-filter="*" class="selected"><a href="#">All Categories</a></li>
                <li data-filter=".MAKEUP"><a href="#">MakeUp</a></li>
                <li data-filter=".SKINCARE"><a href="#">Skin Care</a></li>
                <li data-filter=".BATHBODY"><a href="#">Bath & Body</a></li>
                <li data-filter=".HAIR"><a href="#">Hair</a></li>
            </ul>
        </nav>

        <div class="portfolio-centered">
            <div id="categoryContainer" class="recentitems portfolio">

				<c:forEach items="${categories}" var="item">
	                <div class="portfolio-item ${item.categoryTitle}">
	                    <div class="box">
	                        <img src="http://localhost:8080/categories/show?categoryId=${item.categoryId}">
	                        <div class="option inner">
	                            <div>
	                                <h5>${item.categoryName}</h5>
	                                <a href="http://localhost:8080/categories/show?categoryId=${item.categoryId}" class="fa fa-search mfp-image"></a>
	                                <a href="portfolio_single.html" class="fa fa-link"></a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
				</c:forEach>

            </div>
        </div>
        
    </section>
	
	<script src="/js/product/pselect/jquery-hoverdirection.min.js"></script>
	<script src="/js/product/pselect/jquery.isotope.min.js"></script>

	<script src="/js/product/jquery-scrolltofixed-min.js"></script>
	<script src="/js/product/jquery.magnific-popup.min.js"></script>
    <script src="/js/product/jflickrfeed.js"></script>
    <script src="/js/product/swipe.js"></script>
	<script src="/js/product/pselect/main.js"></script>
	
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
					$.redirect('/products/list_fms', { 'brandId': $('#sbrand').val() });
				} else if($('#sprod').val() != '') {
					$.redirect('', { 'prodId': $('#sprod').val() });
				}
			});
			
			// Contact Button Click
			$('#contact').on('click', function() {
				console.log('contact');				
			});
			
		});
		
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
        
    </script>
	
	<script src="/js/product/wow.min.js"></script>
    <script>
        // WOW Animation
        new WOW().init();
    </script>
    
</body>
</html>