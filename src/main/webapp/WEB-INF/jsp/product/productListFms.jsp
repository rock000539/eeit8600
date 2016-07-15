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
	
	<!-- Edge Template -->
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/animate.css"/>
	
	<!-- CheckBox Plugin -->
	<link rel="stylesheet" href="/css/awesome-bootstrap-checkbox.css">
	
	<!-- Pagination Plugin -->
	<script src="/js/jquery.bootpag.min.js"></script>	
	
	<!-- jQuery Redirect Plugin -->
	<script src="/js/jquery.redirect.js"></script>	
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ProductListPage</title>

	<style>
		
		.blog_medium .post {
		    padding-bottom: 25px;
		    margin-bottom: 30px;
		    border-bottom: 3px solid #f2f2f2;
		}
		
		.blog_medium .post_content > p {
			margin-bottom: 10px;
		}
		
		a:hover {
  			cursor:pointer;
 		}
		
	</style>

</head>
<body>
	
	<div class="col-lg-2"></div>
	
	<div class="col-lg-2 col-md-6 col-sm-8 col-xs-12">
		<div class="widget_title" style="margin-top:50px;">
			<h4><span>Date</span></h4>
		</div>
		<div id="Date" class="pre-scrollable" style="max-height:200px;">
			<div class="checkbox">
                <input id="checkbox1" class="styled" type="checkbox" checked>
                <label for="checkbox1">
                    Default
                </label>
            </div>
            <div class="checkbox checkbox-primary">
                <input id="checkbox2" class="styled" type="checkbox" checked>
                <label for="checkbox2">
                    Primary
                </label>
            </div>
            <div class="checkbox checkbox-success">
                <input id="checkbox3" class="styled" type="checkbox" checked>
                <label for="checkbox3">
                    Success
                </label>
            </div>
            <div class="checkbox checkbox-info">
                <input id="checkbox4" class="styled" type="checkbox" checked>
                <label for="checkbox4">
                    Info
                </label>
            </div>
            <div class="checkbox checkbox-warning">
                <input id="checkbox5" type="checkbox" class="styled" checked>
                <label for="checkbox5">
                    Warning
                </label>
            </div>
            <div class="checkbox checkbox-danger">
                <input id="checkbox6" type="checkbox" class="styled" checked>
                <label for="checkbox6">
                    Check me out
                </label>
            </div>
		</div>
		<div class="widget_title">
			<h4><span>Brand</span></h4>
		</div>
		<div id="Brand" class="pre-scrollable" style="max-height:200px;">
			<div class="checkbox">
                <input id="checkbox1" class="styled" type="checkbox" checked>
                <label for="checkbox1">
                    Default
                </label>
            </div>
            <div class="checkbox checkbox-primary">
                <input id="checkbox2" class="styled" type="checkbox" checked>
                <label for="checkbox2">
                    Primary
                </label>
            </div>
            <div class="checkbox checkbox-success">
                <input id="checkbox3" class="styled" type="checkbox" checked>
                <label for="checkbox3">
                    Success
                </label>
            </div>
            <div class="checkbox checkbox-info">
                <input id="checkbox4" class="styled" type="checkbox" checked>
                <label for="checkbox4">
                    Info
                </label>
            </div>
            <div class="checkbox checkbox-warning">
                <input id="checkbox5" type="checkbox" class="styled" checked>
                <label for="checkbox5">
                    Warning
                </label>
            </div>
            <div class="checkbox checkbox-danger">
                <input id="checkbox6" type="checkbox" class="styled" checked>
                <label for="checkbox6">
                    Check me out
                </label>
            </div>
		</div>
		<div class="widget_title">
			<h4><span>Score</span></h4>
		</div>
		<div id="Score" class="pre-scrollable" style="max-height:200px;">
			<div class="checkbox">
                <input id="checkbox1" class="styled" type="checkbox" checked>
                <label for="checkbox1">
                    Default
                </label>
            </div>
            <div class="checkbox checkbox-primary">
                <input id="checkbox2" class="styled" type="checkbox" checked>
                <label for="checkbox2">
                    Primary
                </label>
            </div>
            <div class="checkbox checkbox-success">
                <input id="checkbox3" class="styled" type="checkbox" checked>
                <label for="checkbox3">
                    Success
                </label>
            </div>
            <div class="checkbox checkbox-info">
                <input id="checkbox4" class="styled" type="checkbox" checked>
                <label for="checkbox4">
                    Info
                </label>
            </div>
            <div class="checkbox checkbox-warning">
                <input id="checkbox5" type="checkbox" class="styled" checked>
                <label for="checkbox5">
                    Warning
                </label>
            </div>
            <div class="checkbox checkbox-danger">
                <input id="checkbox6" type="checkbox" class="styled" checked>
                <label for="checkbox6">
                    Check me out
                </label>
            </div>
		</div>
	</div>
	
	<div id="post_list" class="col-lg-6 col-md-6 col-sm-8 col-xs-12 blog_medium row wow fadeInDown" style="margin-top:50px;">
		
		<c:forEach items="${products}" var="product">
			<article class="post">
			
				<figure class="post_img effect-bubba" style="margin-left:50px;">
					<img src="http://localhost:8080/products/show?prodId=${product.prodId}" style="border:1px solid #f2f2f2;">
					
					<div class="option" style="margin-top:30px;">
					    <a href="http://localhost:8080/products/show?prodId=${product.prodId}" class="fa fa-search mfp-image"></a>
					    <a href="#" class="fa fa-link"></a>
					</div>
					
<!-- 					<figcaption> -->
<!-- 					    <h6 style="margin-top:20px;">查看圖片或商品</h6> -->
<!-- 			        </figcaption> -->
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
					<a class="btn btn-small btn-default" style="margin-left:130px; margin-top:10px;"> <i class="glyphicon glyphicon-fire"></i>&nbsp;&nbsp;升火 </a>
					<a class="btn btn-small btn-default" style="margin-top:10px;" data-prodId="${product.prodId}" onClick="info_click($(this))"> <i class="fa fa-info"></i>&nbsp;&nbsp;查看商品 </a>
	            </div>
					
			</article>
		</c:forEach>
		
		<div id="page_btn" class="col-sm-12 text-center">
	        <ul class="pagination">
	            <li><a href="#">&laquo;</a></li>
	            <c:forEach var="index" begin="1" end="${totalPage}">
	            	<c:choose>
	            		<c:when test="${index == 1}">
	            			<li class="active"><a>${index}</a></li>
	            		</c:when>
	            		<c:otherwise>
				            <li><a>${index}</a></li>
	            		</c:otherwise>
	            	</c:choose>
	            </c:forEach>
				<li><a href="#">&raquo;</a></li>
			</ul>
    	</div>
		
	</div>
	
	<div class="col-lg-1"></div>
	
    <script src="/js/product/jquery-scrolltofixed-min.js"></script>
    <script src="/js/product/jflickrfeed.js"></script>
    <script src="/js/product/jquery.magnific-popup.min.js"></script>
    <script src="/js/product/swipe.js"></script>
    <script src="/js/product/main.js"></script>
	
	<script src="/js/product/wow.min.js"></script>
    <script>
        // WOW Animation
        new WOW().init();
    </script>
	
	<script>
	
		$(function() {
			
			console.log("brandId = ${brandId}");
			console.log("categoryId = ${categoryId}");
			console.log("products.size() = ${products.size()}");
			console.log("totalPage = ${totalPage}");
			
			var a_list = $('#page_btn li a');
			for(var i=0; i<(a_list).length; i++) {
				$(a_list[i]).on('click', function() { page_click(this); });
			}
			
		});
		
		function info_click(a) {
			console.log($(a).attr('data-prodId'));
			$.redirect('/products/view_fms', { 'prodId': $(a).attr('data-prodId') });
		}
		
		function page_click(a) {
			
			console.log('page_index = '+$(a).text());
// 			console.log('brandId = ${brandId}');
// 			console.log('categoryId = ${categoryId}');
			
			if($(a).text() == '«') {
				
			} else {
				
			} 
			
			$('#page_btn li[class="active"]').removeClass('active').children().on('click', function() { page_click($(this)); });
			$(a).off('click').parent().attr('class', 'active');
			
			$.ajax({
				url: '/products/list_data',
				type: 'POST',
				dataType: 'json',
				contextType: 'application/json; charset=utf-8;',
				data: { 'brandId': '${brandId}', 'categoryId': '${categoryId}', 'page': $(a).text() , 'rows': 5 },
				success: function(response){
					
					// 刪除產品列表的元素
					$('#post_list > article').remove();
					
					// 新增產品列表的元素
					for(var i=0; i<response.length; i++) {
						
						var figure = $('<figure></figure>', 
						{
							'class': 'post_img effect-bubba',
							css: {
								'margin-left': '50px',
						    },
						});
						
						$('<img>', {
							src: "http://localhost:8080/products/show?prodId=" + response[i].prodId,
							css: {
								'border': '1px solid #f2f2f2',
						    },
						}).appendTo(figure);
								
						$('<div></div>', {
							"class": "option",
							css: {
								'margin-top': '30px',
						    },
						    html: '<a href="http://localhost:8080/products/show?prodId="' + response[i].prodId + ' class="fa fa-search mfp-image"></a><a href="#" class="fa fa-link"></a>',
						}).appendTo(figure);
						
						var article = $('<article></article>', {
							'class': 'post',
						}).append(figure);
						
						var content = $('<div></div>', {
							'class': 'post_content',
						});
						
						var meta = $('<div></div>', {
							'class': 'post_meta',
						});
						
						$('<h2></h2>', {
							text: response[i].prodName,
						}).appendTo(meta);
						
						$('<div></div>', {
							'class': 'metaInfo',
							html: ' <span><i class="fa fa-calendar"></i>' + response[i].launchDate + ' </span><span><i class="fa fa-tag"></i> ' + response[i].brandName + '${product.brand.brandName} </span><span><i class="fa fa-comments"></i>' + $(response[i].reviews).size() + ' </span> '
						}).appendTo(meta);
						
						meta.appendTo(content);
						
						var desc = '';
						if(response[i].prodDesc.substring(0, 4) == '產品說明') {
							desc = '<p>Lorem ipsum dolor sit amet, consectetur adip Etu eros omnes theophratus mei, cumit usulan dicit omnium eripuit. Qui tever iluma facete gubergren ... </p>';
						} else {
							desc = '<p>' + response[i].prodDesc.substring(0, 25) + ' ... </p>'
						}
						
						content.html(content.html() + desc + '<a class="btn btn-small btn-default" style="margin-left:130px; margin-top:10px;"> <i class="glyphicon glyphicon-fire"></i>&nbsp;&nbsp;升火 </a> <a class="btn btn-small btn-default" style="margin-top:10px;" data-prodId="' + response[i].prodId + '" onClick="info_click($(this))"> <i class="fa fa-info"></i>&nbsp;&nbsp;查看商品 </a>');
						
						content.appendTo(article);
						
						article.insertBefore($('#page_btn'));
						
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
		
	</script>

</body>
</html>