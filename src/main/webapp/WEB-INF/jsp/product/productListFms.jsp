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
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ProductListPage</title>

	<style>
		
		.blog_medium .post {
		    padding-bottom: 25px;
		    margin-bottom: 30px;
		    border-bottom: 3px solid #f2f2f2;
		}
		
	</style>

</head>
<body>
	
	<div class="col-lg-2"></div>
	
	<div class="col-lg-2">
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
	
	<div class="col-lg-6 blog_medium row wow fadeInDown" style="margin-top:50px;">
		
		<c:forEach items="${products}" var="product">
			<article class="post">
			
				<figure class="post_img effect-bubba" style="margin-left:50px;">
					<img src="http://localhost:8080/products/show?prodId=${product.prodId}" style="border:1px solid #f2f2f2;">
					
					<div class="option" style="margin-top:30px;">
					    <a href="#" class="fa fa-link"></a>
					    <a href="http://localhost:8080/products/show?prodId=${product.prodId}" class="fa fa-search mfp-image"></a>
					</div>
					
<!-- 					<figcaption> -->
<!-- 					    <h6 style="margin-top:20px;">查看圖片或商品</h6> -->
<!-- 			        </figcaption> -->
				</figure>
				
				<div class="post_content">
					<div class="post_meta">
						<h2>
							<a href="#">${product.prodName}</a>
						</h2>
						<div class="metaInfo">
							<span><i class="fa fa-calendar"></i> ${product.launchDate} </span>
							<span><i class="fa fa-tag"></i> ${product.brand.brandName} </span>
							<span><i class="fa fa-comments"></i> ${product.reviews.size()} </span>
						</div>
					</div>
					<c:if test="${fn:substring(prodDesc.prodDesc, 0, 2) == '內文' }">
						<p>Lorem ipsum dolor sit amet, consectetur adip ... </p>
					</c:if>
					<c:if test="${fn:substring(prodDesc.prodDesc, 0, 2) != '內文' }">
						<p>${fn:substring(review.review, 0, 25)} ... </p>
					</c:if>
					<a class="btn btn-small btn-default" href="#" style="margin-left:130px; margin-top:10px;"> <i class="glyphicon glyphicon-fire"></i>&nbsp;&nbsp;升火 </a>
					<a class="btn btn-small btn-default" href="#" style="margin-top:10px;"> <i class="fa fa-info"></i>&nbsp;&nbsp;查看商品 </a>
	            </div>
					
			</article>
		</c:forEach>
		
		<div class="col-sm-12 text-center">
	        <ul class="pagination">
	            <li><a href="#">&laquo;</a></li>
	            <li class="active"><a href="#">1</a></li>
	            <li><a href="#">2</a></li>
	            <li><a href="#">3</a></li>
	            <li><a href="#">4</a></li>
	            <li><a href="#">5</a></li>
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
			
			console.log("${products.size()}");
			console.log("${products[0].reviews.size()}");
		
		});
		
	</script>

</body>
</html>