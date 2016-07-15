<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>FMS Template</title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
<style type="text/css">
.grey_bg{
min-height: 450px;}</style>		
</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row ">
				<div class="container">
				<div class=" row ">
					<div class="item mobile isotope-item" style="width: 376px; height: 186px;display:inline-block;position:relative;float:left;transform: translate3d(130px, 30px, 0px);">
                            <figure class="touching effect-bubba">
                                <img src="/img/cosmeticProducts.jpg"  alt="" class="img-responsive" >

                                <div class="option">
                                    <a href="/prodIngreList/prodNameSearchIngred" class="fa fa-link" ></a>
                                </div>
                                <figcaption class="item-description">
                                    <h5>查看產品成份</h5>
                                   
                                </figcaption>
                            </figure>
                        </div>
                                                                    
                        <div class="item mobile isotope-item" style="width: 376px; height: 186px; display:inline-block;position:relative;transform: translate3d(280px, 30px, 0px);">
                            <figure class="touching effect-bubba">
                                <img src="/img/1-1502031R346120.jpg" alt="" class="img-responsive">

                                <div class="option">
                                    <a href="/ingredients/search" class="fa fa-link"></a>
                                </div>
                                <figcaption class="item-description">
                                    <h5>利用成份查詢產品</h5>
                                    
                                </figcaption>
                            </figure>
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
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>

</body>
</html>