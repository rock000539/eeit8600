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

		button:hover {
		    cursor: pointer;
		    box-shadow: 0px 0px 3px #666;
		}

		button.on {
		    color: white;
		    background-color: #ccc;
		}
		
	</style>

</head>
<body>

	<!-- http://codepen.io/amortka/pen/KqfoB -->

	<!--加入header&nav -->
	<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
	
	<!-- **每頁不同的內容從這裡開始** -->
	<div class="grey_bg row">
	
		<div class="row">
			<div class="buttons">
				<button class="list-view on"><i class="fa fa-bars"></i></button>
			  	<button class="grid-view"><i class="fa fa-th"></i></button>
			</div>
		</div>
		
		<div class="row sub_content">
		
			<div id="lpost_list" class="col-lg-6 col-md-4 col-sm-2 col-xs-12 blog_medium wow fadeInDown" style="margin-top:50px; border:3px solid black;">
				
				<c:forEach items="${products}" var="product" begin="0" step="2">
					<article class="post">
						
						<figure class="post_img effect-bubba" style="margin-left:50px;">
							<img class="img-prod" src="<%= request.getContextPath() %>/products/show?prodImg=${product.prodImg}" style="border:1px solid #f2f2f2;">
							
							<div class="option" style="margin-top:30px;">
							    <a href="/products/show?prodId=${product.prodId}" class="fa fa-search mfp-image"></a>
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
									<span><i class="fa fa-tag"></i> ${product.brand.brandName} </span>
									<span><i class="fa fa-comments"></i> ${product.reviews.size()} </span>
								</div>
							</div>
							<c:if test="${fn:substring(product.prodDesc, 0, 4) == '產品說明' }">
								<p>Lorem ipsum dolor sit amet, consectetur adip Etu eros omnes theophratus mei, cumit usulan dicit omnium eripuit. Qui tever iluma facete gubergren ... </p>
							</c:if>
							<c:if test="${fn:substring(product.prodDesc, 0, 4) != '產品說明' }">
								<p>${fn:substring(review.review, 0, 25)} ... </p>
							</c:if>
							<span style="float:right;">
								<a class="btn btn-small btn-default" data-prodId="${product.prodId}"> <i class="fa fa-bookmark"></i>&nbsp;&nbsp;收藏商品</a>
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
							    <a href="<%= request.getContextPath() %>/products/show?prodId=${product.prodId}" class="fa fa-search mfp-image"></a>
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
									<span><i class="fa fa-tag"></i> ${product.brand.brandName} </span>
									<span><i class="fa fa-comments"></i> ${product.reviews.size()} </span>
								</div>
							</div>
							<c:if test="${fn:substring(product.prodDesc, 0, 4) == '產品說明' }">
								<p>Lorem ipsum dolor sit amet, consectetur adip Etu eros omnes theophratus mei, cumit usulan dicit omnium eripuit. Qui tever iluma facete gubergren ... </p>
							</c:if>
							<c:if test="${fn:substring(product.prodDesc, 0, 4) != '產品說明' }">
								<p>${fn:substring(review.review, 0, 25)} ... </p>
							</c:if>
							<span style="float:right;">
								<a class="btn btn-small btn-default" data-prodId="${product.prodId}"> <i class="fa fa-bookmark"></i>&nbsp;&nbsp;收藏商品</a>
								<a class="btn btn-small btn-default" data-prodId="${product.prodId}" onClick="info_click($(this))"> <i class="fa fa-info"></i>&nbsp;&nbsp;查看商品 </a>
							</span>
			            </div>
					
					</article>
				</c:forEach>
				
			</div>
		
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
	
	<script src="/js/product/wow.min.js"></script>
    <script>
        // WOW Animation
        new WOW().init();
    </script>
    
    <script id="article_list" type="text/template">
		
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
					<a class="btn btn-small btn-default" data-prodId="_prodId"> <i class="fa fa-bookmark"></i>&nbsp;&nbsp;收藏商品</a>
					<a class="btn btn-small btn-default" data-prodId="_prodId" onClick="info_click($(this))"> <i class="fa fa-info"></i>&nbsp;&nbsp;查看商品 </a>
				</span>
            </div>
		
		</article>

	</script>
	
	<script id="article_grid" type="text/template">
		
		

	</script>
	
	<script>
	
		$(function() {
			
			console.log("brandId = ${brandId}");
			console.log("categoryId = ${categoryId}");
			console.log("products.size() = ${products.size()}");
			console.log("totalPage = ${totalPage}");
			
			$('#page_btn').bootpag({
			   total: "${totalPage}",
			   page: 1,
			   maxVisible: 5,
			   href: "#pro-page-{{number}}",
			   leaps: false,
			   next: 'next',
			   prev: 'prev',
			}).on('page', function(event, num){
				
				$.ajax({
					url: '/products/list_data',
					type: 'POST',
					dataType: 'json',
					contextType: 'application/json; charset=utf-8;',
					data: { 'brandId': '${brandId}', 'categoryId': '${categoryId}', 'page': num, 'rows': 10 },
					success: function(response){
						
						// 刪除產品列表的元素
						$('#lpost_list > article').remove();
						$('#rpost_list > article').remove();

						// 宣告左右列的商品列表
						var l_list = $('#lpost_list');
						var r_list = $('#rpost_list');
						
						// 新增產品列表的元素
						for(var i=0; i<response.length; i++) {
							
							var list = i%2 == 0 ? l_list : r_list;
							
							console.log(response[i].prodImg)
							
							$($('#article_list').html()
								.replace('_prodImg', response[i].prodImg)
								.replace('_prodImg', response[i].prodImg)
								.replace('_prodName', response[i].prodName)
								.replace('_launchDate', response[i].launchDate)
								.replace('_brandName', response[i].brandName)
								.replace('_size', response[i].reviews.length)
								//.replace('_prodDesc', response[i].prodDesc)
								.replace('_prodId', response[i].prodId)
								.replace('_prodId', response[i].prodId))
								.appendTo(list);
							
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
				
			});
			
		});
		
		function info_click(a) {
			console.log($(a).attr('data-prodId'));
			$.redirect('/products/view', { 'prodId': $(a).attr('data-prodId') });
		}
		
		listButton = $('button.list-view');
		gridButton = $('button.grid-view');

		listButton.on('click',function(){
			gridButton.removeClass('on');
		  	listButton.addClass('on');
		});

		gridButton.on('click',function(){
			listButton.removeClass('on');
		  	gridButton.addClass('on');
		});
		
	</script>

</body>
</html>