<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Ingredient Information</title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="/js/jquery.min.js"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
<style type="text/css">
body {
	font-family: Microsoft JhengHei, "Open Sans",Helvetica,Arial,sans-serif;	
}
.grey_bg{
/* background-image: url("/images/IngredientBackground.jpg"); */
-moz-background-size:cover;
-webkit-background-size:cover;
-o-background-size:cover;
background-size:cover;
min-height: 650px;}
.item{
margin: 6px;}
</style>		
</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row ">
				<br><br>
				<div class="container">
				<div class=" row ">
				
						<div class="item" style="width: 376px; height: 270px;display:inline-block;position:relative;float:left;text-align:center;">
                            <figure class="touching effect-bubba">
                                <img src="/img/cosmeticProducts.jpg"  alt="" class="img-responsive" >
                                <div class="option">
                                    <a href="/prodIngreList/prodNameSearchIngred" class="fa fa-link" ></a>
                                </div>
                                <figcaption class="item-description">
                                    <h5>產品成份查詢</h5>
                                </figcaption>
                            </figure>
                            <div><h1>Find by Product</h1></div>
                        </div>
                         
                                                                    
                        <div class="item mobile isotope-item" style="width: 376px; height: 270px; display:inline-block;position:relative;text-align:center;">
                            <figure class="touching effect-bubba">
                                <img src="/img/1-1502031R346120.jpg" alt="" class="img-responsive">

                                <div class="option">
                                    <a href="/ingredients/search" class="fa fa-link"></a>
                                </div>
                                <figcaption class="item-description">
                                    <h5>單一成份查詢</h5>
                                    
                                </figcaption>
                            </figure>
                            <div><h1>Find by Ingredient</h1></div>
                        </div>
                        
                        
                        
                       <div class="item mobile isotope-item" style="width: 376px; height: 270px; display:inline-block;position:relative;text-align:center;">
                            <figure class="touching effect-bubba">
                                <img src="/img/shareProductIngredient.jpg" alt="" class="img-responsive">

                                <div class="option">
                                    <a href="/prodIngreList/shareMainPage" class="fa fa-link"></a>
                                </div>
                                <figcaption class="item-description">
                                    <h5>分享產品成份資訊</h5>
                                </figcaption>
                            </figure>
                            <div><h1>Share your Information</h1></div>
                        </div>
					
				</div></div></div>     
				
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/jflickrfeed.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>



</body>
</html>