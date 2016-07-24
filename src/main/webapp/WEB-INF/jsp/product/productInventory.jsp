<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<!-- jQuery -->
	<script src="/js/jquery.min.js"></script>
	
	<!-- BootStrap -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<script src="/js/bootstrap.min.js"></script>
	
	<!-- Header & Footer -->
	<link rel="stylesheet" href="/css/fms/style.css">
	<link rel="stylesheet" href="/css/fms/fms-customize.css">
	
	<!-- ThisPage Template -->
	<link rel="stylesheet" href="/css/product/product-inventory.css">
	
	<!-- Animate -->
	<link rel="stylesheet" href="/css/animate.css"/>
	
	<!-- CheckBox Plugin -->
	<link rel="stylesheet" href="/css/product/awesome-bootstrap-checkbox.css">
	
	<!-- Pagination Plugin -->
	<script src="/js/product/inventory/jquery.bootpag.min.js"></script>
	
	<!-- jQuery Redirect Plugin -->
	<script src="/js/jquery.redirect.js"></script>	
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ProductInventory</title>

	<style>
		
		.blog_medium .post {
		    padding-bottom: 25px;
		    margin-bottom: 30px;
		    border-bottom: 3px solid #f2f2f2;
/* 		    background: black; */
    		padding: 12px;
		}
		
		.blog_medium .post_content > p {
			margin-bottom: 10px;
		}
		
		a:hover {
  			cursor:pointer;
 		}
 		
 		.widget_title h4 {
 			margin-top: 20px;
 			margin-bottom: 5px;
		    font-size: 18px;
		    text-transform: uppercase;
		}
		
		.img-prod
		{
			-moz-box-shadow: 0 0 5px #fff;
			-webkit-box-shadow: 0 0 5px #fff;
			box-shadow: 0px 0px 5px #fff;
		}
		
		.buttons {
			text-align: right;
			margin: 20px auto 0;
			padding-right: 3%;
		}

		button {
			height: 36px;
			width: 40px;
			margin-left: 4px;
			font-size: 24px;
			color: #727CB6;
			text-align: center;
			line-height: 1.4;
			border-radius: 4px;
			border: none;
			outline: none;
			background-color: white;
			box-shadow: 0px 1px 2px #bbb;
		}

		button.on {
		    color: white;
		    background-color: #ccc;
		}
		
		.list-view:hover, grid-view:hover {
			cursor: pointer;
		    box-shadow: 0px 0px 3px #666;
		}
		
		/* Grid */
		#proList {
			margin-top: 20px;
			font-size: 24px;
		}

		.portfolio-content {
			border: 1px solid #E7E6E6;
			padding: 20px 10px 20px 10px;
			text-align: center;
		}
		
		.portfolio-content h3 {
			font-size: 15px;
		 	line-height: 15px;
		}
		
		.portfolio-img {
			margin: 0 auto;
			height: 130px;
			width: 130px;
			overflow:hidden;
		}
		
		.portfolio-content img{
			height: 130px;
			width: 130px;
		}
		
		.portfolio-content p {
			line-height: 1.1;
			margin: 5px;
			font-size: 15px;
		}
		
		.portfolio-btn {
			margin-top: 20px;
		}
		
		.portfolio-item {
		 	padding: 15px; 
		}
		
		.portfolio-item:hover .portfolio-content{
			border-bottom-color:#727CB6; 
		}
		
		.portfolio-all {
			background-color: #ffffff;
			margin-bottom: 10px;
		}
		
		.portfolio-title {
			height: 60px;
			background-color: #98DaD6;  /*blue */
			border-bottom: 1px solid #4FBAAA;
			color: #ffffff;
			text-align: center;
			padding: 15px 10px 10px 10px;
		}
		
		#proList div:nth-child(4n+2) .portfolio-title {
			background-color: #DDD5C9;	/*beige*/
			border-bottom: 1px solid #C6BFB4;
		} 
		
		#proList div:nth-child(4n+3) .portfolio-title {
			background-color: #FF95CA;	/*beige*/
			border-bottom: 1px solid #C6BFB4;
		} 
		
		#proList div:nth-child(4n+4) .portfolio-title {
			background-color: #FF9985;	/*pink*/
			border-bottom: 1px solid #D97F88;
		}
		
		.portfolio-title h3 {
			font-size: 15px;
		 	line-height: 15px; 
			color: #ffffff;
			margin: 5px;
		}
		
		.div-inline { 
			display:inline
		}
		
		/* Share Toggle */
		.card__share {
			float: right;
			position: relative;
			margin-top: -32px;
		}
	
		.card__social {
			position: absolute;
			top: 0;
			right: 0;
			visibility: hidden;
			width: 135px;
			transform: translateZ(0);
		  	transform: translateX(0px);
		  	transition: transform 0.35s ease;
		}
		
		.card__social--active {
			visibility: visible;
			transform: translateZ(0);
	 		transform: translateX(-6px);
	  		transition: transform 0.35s ease;
		}
		
		.share-toggle {
			z-index: 2;
		}
		
		.share-toggle:before {
			content: "\f1e0";
			font-family: 'FontAwesome';
			color: #3498db;
		}
		
		.share-toggle.share-expanded:before {
			content: "\f00d";
		}
		
		.share-icon {
			display: inline-block;
			width: 30px;
			height: 30px;
			line-height: 30px;
			text-align: center;
			border-radius: 50%;
			background-color: #fff;
			transition: all 0.3s ease;
			outline: 0;
		
			box-shadow: 
			  		0 2px 4px rgba(0,0,0, 0.12),
			    	0 2px 4px rgba(0,0,0, 0.24);
		}
		
		.share-icon:hover,
		.share-icon:focus {
			box-shadow: 
		  		0 3px 6px rgba(0,0,0, 0.12),
		    	0 3px 6px rgba(0,0,0, 0.24);
	
		    -webkit-transform: scale(1.2);
		    -moz-transform: scale(1.2);
		    -ms-transform: scale(1.2);
		    -o-transform: scale(1.2);
		    transform: scale(1.2);
		}
		
		.info {
			background-color: #0080FF;
		}
		
		.bookmark {
			background-color: #FF8040;
		}
		
		.info,
		.bookmark {
			padding-top:2px;
			color: #fff;
		}
	
		.info:hover,
		.bookmark:hover {
			color: #eee;
		}
		
	</style>

</head>
<body>

	<!-- http://codepen.io/amortka/pen/KqfoB -->

	<!--加入header&nav -->
	<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
	
	<!-- **每頁不同的內容從這裡開始** -->
	<div class="grey_bg row">
	
		<input id="mode" type="hidden" value="list" />
		<input id="brandId" type="hidden" value="${brandId}" />
		<input id="categoryId" type="hidden" value="${categoryId}" />
		<input id="page" type="hidden" value="1" />
		<input id="rows" type="hidden" value="10" />
		<input id="totalPage" type="hidden" value="${totalPage}" />
	
		<div class="row">
			<div class="buttons">
				<button class="list-view on"><i class="fa fa-bars"></i></button>
			  	<button class="grid-view"><i class="fa fa-th"></i></button>
			</div>
		</div>
		
		<div id="list" class="row sub_content">
			
			<div id="lpost_list" class="col-lg-6 col-md-4 col-sm-2 col-xs-12 blog_medium wow fadeInDown" style="margin-top:50px; border:3px solid black;">
				
				<c:forEach items="${products}" var="product" begin="0" step="2">
					<article class="post">
						
						<figure class="post_img effect-bubba" style="margin-left:50px;">
							<img class="img-prod" src="<%= request.getContextPath() %>/products/show?prodImg=${product.prodImg}" style="border:1px solid #f2f2f2;">
							
							<div class="option" style="margin-top:30px;">
							    <a href="/products/show?prodImg=${product.prodImg}" class="fa fa-search mfp-image"></a>
							    <a href="#" class="fa fa-link"></a>
							</div>
							
							<figcaption class="item-description"></figcaption>
						</figure>
						
						<div class="post_content">
							<div class="post_meta">
								<h2>
									${product.prodName}
								</h2>
								<div class="metaInfo">
									<span><i class="fa fa-calendar"></i> ${product.launchDate} </span>
									<span><i class="fa fa-tag"></i> ${product.brandName} </span>
									<span><i class="fa fa-comments"></i> ${product.rSize} </span>
								</div>
							</div>
							<c:if test="${fn:substring(product.prodDesc, 0, 4) == '產品說明' }">
								<p>Lorem ipsum dolor sit amet, consectetur adip Etu eros omnes theophratus mei, cumit usulan dicit omnium eripuit. Qui tever iluma facete gubergren ... </p>
							</c:if>
							<c:if test="${fn:substring(product.prodDesc, 0, 4) != '產品說明' }">
								<p>${fn:substring(review.review, 0, 25)} ... </p>
							</c:if>
							<span style="float:right;">
								<a class="btn btn-small btn-default" data-prodId="${product.prodId}" onClick="save_click($(this))"> <i class="fa fa-bookmark"></i>&nbsp;&nbsp;收藏商品</a>
								<a class="btn btn-small btn-default" data-prodId="${product.prodId}" onClick="info_click($(this))"> <i class="fa fa-info"></i>&nbsp;&nbsp;查看商品 </a>
							</span>
			            </div>
					
					</article>
				</c:forEach>
				
			</div>
		
			<div id="rpost_list" class="col-lg-6 col-md-4 col-sm-2 col-xs-12 blog_medium wow fadeInDown" style="margin-top:50px; border:3px solid black;">
				
				<c:forEach items="${products}" var="product" begin="1" step="2">
					<article class="post">
						
						<figure class="post_img effect-bubba" style="margin-left:50px;">
							<img class="img-prod" src="<%= request.getContextPath() %>/products/show?prodImg=${product.prodImg}" style="border:1px solid #f2f2f2;">
							
							<div class="option" style="margin-top:30px;">
							    <a href="<%= request.getContextPath() %>/products/show?prodImg=${product.prodImg}" class="fa fa-search mfp-image"></a>
							    <a href="#" class="fa fa-link"></a>
							</div>
							
							<figcaption class="item-description"></figcaption>
						</figure>
						
						<div class="post_content">
							<div class="post_meta">
								<h2>
									${product.prodName}
								</h2>
								<div class="metaInfo">
									<span><i class="fa fa-calendar"></i> ${product.launchDate} </span>
									<span><i class="fa fa-tag"></i> ${product.brandName} </span>
									<span><i class="fa fa-comments"></i> ${product.rSize} </span>
								</div>
							</div>
							<c:if test="${fn:substring(product.prodDesc, 0, 4) == '產品說明' }">
								<p>Lorem ipsum dolor sit amet, consectetur adip Etu eros omnes theophratus mei, cumit usulan dicit omnium eripuit. Qui tever iluma facete gubergren ... </p>
							</c:if>
							<c:if test="${fn:substring(product.prodDesc, 0, 4) != '產品說明' }">
								<p>${fn:substring(review.review, 0, 25)} ... </p>
							</c:if>
							<span style="float:right;">
								<a class="btn btn-small btn-default" data-prodId="${product.prodId}" onClick="save_click($(this))"> <i class="fa fa-bookmark"></i>&nbsp;&nbsp;收藏商品</a>
								<a class="btn btn-small btn-default" data-prodId="${product.prodId}" onClick="info_click($(this))"> <i class="fa fa-info"></i>&nbsp;&nbsp;查看商品 </a>
							</span>
			            </div>
					
					</article>
				</c:forEach>
				
			</div>
			
		</div>
		
		<div id="grid" class="row sub_content">
			<div class="col-md-1"></div>
			<div id="proList" class="col-md-10 wow fadeInDown"></div>
			<div class="col-md-1"></div>
		</div>
		
		<div id="page_btn" class="col-sm-12 text-center"></div>
	
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
    
    <script src="/js/product/inventory/main.js"></script>

	<script src="/js/product/wow.min.js"></script>
    <script>
        // WOW Animation
        new WOW().init();
    </script>
    
    <script id="list_mode" type="text/template">
		
		<article class="post">
						
			<figure class="post_img effect-bubba" style="margin-left:50px;">
				<img class="img-prod" src="<%= request.getContextPath() %>/products/show?prodImg=_prodImg" style="border:1px solid #f2f2f2;">
				
				<div class="option" style="margin-top:30px;">
				    <a href="<%= request.getContextPath() %>/products/show?prodImg=_prodImg" class="fa fa-search mfp-image"></a>
				    <a href="#" class="fa fa-link"></a>
				</div>
				
				<figcaption class="item-description"></figcaption>
			</figure>
			
			<div class="post_content">
				<div class="post_meta">
					<h2>
						_prodName
					</h2>
					<div class="metaInfo">
						<span><i class="fa fa-calendar"></i> _launchDate </span>
						<span><i class="fa fa-tag"></i> _brandName </span>
						<span><i class="fa fa-comments"></i> _size </span>
					</div>
				</div>
				<p>Lorem ipsum dolor sit amet, consectetur adip Etu eros omnes theophratus mei, cumit usulan dicit omnium eripuit. Qui tever iluma facete gubergren ... </p>				
				<span style="float:right;">
					<a class="btn btn-small btn-default" data-prodId="_prodId" onClick="save_click($(this))"> <i class="fa fa-bookmark"></i>&nbsp;&nbsp;收藏商品</a>
					<a class="btn btn-small btn-default" data-prodId="_prodId" onClick="info_click($(this))"> <i class="fa fa-info"></i>&nbsp;&nbsp;查看商品 </a>
				</span>
            </div>
		
		</article>

	</script>
	
	<script id="grid_mode" type="text/template">
		
		<div class="col-md-3 portfolio-item">
			<div class="portfolio-all">
				<div class="portfolio-content">
					<div class="portfolio-img">
						<a data-prodId="_prodId" onClick="info_click($(this))">
							<img src="/products/show?prodImg=_prodImg">
						</a>
					</div>
				</div>
				<div class="portfolio-title">
					<div class="card__share">
			            <div class="card__social">  
			                <a class="share-icon info" data-prodId="_prodId" onClick="info_click($(this))"><span class="fa fa-info"></span></a>
			                <a class="share-icon bookmark" data-prodId="_prodId" onClick="save_click($(this))"><span class="fa fa-bookmark"></span></a>
			            </div>
			            <a id="share" class="share-toggle share-icon" href="#"></a>
			        </div>
					<a data-prodId="_prodId" onClick="info_click($(this))">
						<h3>_prodName</h3>
					</a>
				</div>
			</div>
		</div>

	</script>
	
	<script>
		
		// 初始化資料
		$(function() {
			
			console.log("mode = ${mode}");
			console.log("brandId = ${brandId}");
			console.log("categoryId = ${categoryId}");
			console.log("products.size() = ${products.size()}");
			console.log("totalPage = ${totalPage}");
			
			$('#list').show();
			$('#grid').hide();
			
			$('#page_btn').bootpag({
			   total: "${totalPage}",
			   page: 1,
			   maxVisible: 5,
			   href: "#pro-page-{{number}}",
			   leaps: false,
			   next: 'next',
			   prev: 'prev',
			}).on('page', function(event, num) {
				$('#page').val(num);
				appendData();
			});
			
		});
		
		// 根據情況取得不同資料
		function appendData() {
			
			console.log('mode = ' + $('#mode').val());
			console.log('brandId = ' + $('#brandId').val());
			console.log('categoryId = ' + $('#categoryId').val());
			console.log('page = ' + $('#page').val());
			console.log('rows = ' + $('#rows').val());
			console.log('totalPage = ' + $('#totalPage').val());
			
			$.ajax({
				url: '/products/inventory_data',
				type: 'POST',
				dataType: 'json',
				contextType: 'application/json; charset=utf-8;',
				data: { 
					'mode': $('#mode').val(), 
					'brandId': $('#brandId').val(), 
					'categoryId': $('#categoryId').val(), 
					'page': $('#page').val(), 
					'rows': $('#rows').val(),
				},
				success: function(response) {
					
					console.log(response);
					
					$('#totalPage').val(response.totalPage);
					$('#page_btn').bootpag({
						total: $('#totalPage').val(),
					});
					
					var products = response.products;
					
					if($('#mode').val() == 'list') {
						
						$('#list').show();
						$('#grid').hide();
						
						// 刪除產品列表的元素
						$('#lpost_list > article').remove();
						$('#rpost_list > article').remove();

						// 宣告左右列的商品列表
						var l_list = $('#lpost_list');
						var r_list = $('#rpost_list');
						
						// 新增產品列表的元素
						for(var i=0; i<products.length; i++) {
							
							var list = i%2 == 0 ? l_list : r_list;
							
							$($('#list_mode').html()
								.replace('_prodImg', products[i].prodImg)
								.replace('_prodImg', products[i].prodImg)
								.replace('_prodName', products[i].prodName)
								.replace('_launchDate', products[i].launchDate)
								.replace('_brandName', products[i].brandName)
								.replace('_size', products[i].rSize)
								//.replace('_prodDesc', products[i].prodDesc)
								.replace('_prodId', products[i].prodId)
								.replace('_prodId', products[i].prodId))
								.appendTo(list);
							
						}
						
					} else {
						
						$('#list').hide();
						$('#grid').show();
						
						// 刪除產品列表的元素
						$('#proList > .portfolio-item').remove();

						// 宣告商品列表
						var list = $('#proList');
						
						// 新增產品列表的元素
						for(var i=0; i<products.length; i++) {
							
							$($('#grid_mode').html()
								.replace('_prodId', products[i].prodId)
								.replace('_prodImg', products[i].prodImg)
								.replace('_prodId', products[i].prodId)
								.replace('_prodId', products[i].prodId)
								.replace('_prodId', products[i].prodId)
								.replace('_prodName', products[i].prodName))
								.appendTo(list);
							
						}
						
						bindShareEvent();
					}
					
					// 重跑列表載入動畫
					new WOW().init();
					
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR);
					console.log(textStatus);
					console.log(errorThrown);
				},
			});
			
		}
		
		// 查看商品
		function info_click(a) {
			console.log($(a).attr('data-prodId'));
			$.redirect('/products/view', { 'prodId': $(a).attr('data-prodId') });
		}
		
		// 收藏商品
		function save_click (a) {
			console.log($(a).attr('data-prodId'));
		}
		
		// Grid/List System
		function bindShareEvent() {
			$('.card__share > a').on('click', function(e){ 
				e.preventDefault() // prevent default action - hash doesn't appear in url
		   		$(this).parent().find( 'div' ).toggleClass( 'card__social--active' );
				$(this).toggleClass('share-expanded');
		    });
		}
		
		listButton = $('button.list-view');
		gridButton = $('button.grid-view');

		listButton.on('click',function(){
			
			if(listButton.attr('class') == 'list-view') {
				
				// 修改樣式
				gridButton.removeClass('on');
			  	listButton.addClass('on');
			  	
			  	// 設定參數
			  	$('#mode').val('list');
			  	$('#page').val(1);
			  	$('#rows').val(10);
			  	
			  	// 取得資料
			  	appendData();
			}
			
		});

		gridButton.on('click',function(){
			
		  	if(gridButton.attr('class') == 'grid-view') {
		  		// 修改樣式
				listButton.removeClass('on');
		  		gridButton.addClass('on');
		  		
		  		// 設定參數
			  	$('#mode').val('grid');
			  	$('#page').val(1);
			  	$('#rows').val(20);
			  	
			  	// 取得資料
			  	appendData();
		  	}
		  	
		});
		
	</script>

</body>
</html>