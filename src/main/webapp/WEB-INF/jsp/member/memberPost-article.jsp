<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>會員文章</title>

	<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
	<link rel="stylesheet" href="/css/member-post.css" type="text/css" media="all">
	<script type="text/javascript" src="/js/jquery.min.js"></script> 
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	<script src="https://use.typekit.net/riz5mva.js"></script>
	<script>try{Typekit.load({ async: true });}catch(e){}</script>
<style>
	#timelineDiv{
		width: 800px;
		margin: 0 auto;
		margin-top: 50px;
	}
	#header{
		width: 100%;
	}
	.wrapper{
		background-color: transparent;
	}
	.container{
		width: 100%;
	}
	@media (min-width: 768px){
		.container {
			width: 100%;			
		}
	}
</style>
</head>
<body>
<!--start wrapper-->
<section class="wrapper container">
<!--Start Header-->
<header id="header">
    <div class="col-sm-12 top-nav">
        <ul>
        <c:set var="nickname" scope="session" value='<%=request.getSession().getAttribute("MemberNickname")%>'/>
         <c:if test="${empty nickname}">
		<!--  登入前 -->
            <li>
                <a href="/login"><i class="fa fa-user" aria-hidden="true"></i>
                <span style="font-family: Open Sans;">&nbsp Login / Sign Up<span>
                </a>
            </li>
            
        </c:if>
         
        <!-- 登入後 -->            
        	 <c:if test="${not empty nickname}"> 
            <li>
                <a href="#"><span>${nickname}</span></a>
            </li>
            <li>
                <a class="" href="#">
                <div class="userdiv img-circle"><img id="userimg" src="/members/show?memberId=<%=request.getSession().getAttribute("memberId")%>"/></div>
                </a>
            </li>
         </c:if>
       
        </ul>
    </div>

    <div class="col-sm-12">
        <div id="logo">
            <h1><a href="index.html"><img src="/images/fms/logo_qutie.jpg"/></a></h1>
        </div>
    </div>

    <!-- Navigation
    ================================================== -->

    <div class="navbar navbar-default navbar-static-top col-sm-12" role="navigation">
        <span class="nav-caption">Navigation Menu...</span>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>

                <li><a href="/expdate/search">Date</a></li>

                <li><a href="#">Ingredient</a>
                    <ul class="dropdown-menu">
                        <li><a href="/prodIngreList/prodNameSearchIngred">Via Product</a></li>
                        <li><a href="/ingredients/SearchIngredient">Via Ingredient</a></li>
                    </ul>
                </li>

                <li><a href="#">Order</a></li>

                <li><a href="#"><span class="data-hover" data-hover="blog">Product</span></a></li>

                <li><a href="#">Review</a></li>
                <li><a href="#">Article</a></li>
                <li><a href="#">Ranking</a></li>
            </ul>
        </div>
    </div>
</header>
<!--End Header-->

<div id="timelineDiv">
<section id="cd-timeline">
	<c:forEach var="item" items="${articles}">
	<div class="cd-timeline-block">
		<div class="cd-timeline-img"></div>
		
		<div class="cd-timeline-content">
			<h2>${item.articleTitle}</h2>
			<small>${item.articleType}</small>
			<p>${item.article}</p>
			<a href="/articles/article-page?articleId=${item.articleId}" class="cd-info">觀看文章</a>
            <a href="/articles/edit?articleId=${item.articleId}" class="cd-info">編輯文章</a>
			<span class="cd-date">${item.articleTime}</span>
		</div> <!-- cd-timeline-content -->
	</div> <!-- cd-timeline-block -->
	</c:forEach>
</section>
</div> <!-- timeline Div -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />

<script>
$(function(){
	var timelineBlocks = $('.cd-timeline-block'),
		offset = 0.8;

	hideBlocks(timelineBlocks, offset);

	//on scolling, show/animate timeline blocks when enter the viewport
	$(window).on('scroll', function(){
		(!window.requestAnimationFrame) 
			? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
			: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
	});

	function hideBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.cd-timeline-img, .cd-timeline-content').addClass('is-hidden');
		});
	}

	function showBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.cd-timeline-img').hasClass('is-hidden') ) && $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
			console.log("show"+$(this));
		});
	}
	
	

   /*============ BUTTON UP ===========*/
    
   var btnUp = $('<div/>', {'class':'btntoTop'});
   btnUp.appendTo('body');
   $(document)
       .on('click', '.btntoTop', function() {
           $('html, body').animate({
               scrollTop: 0
           }, 700);
       });

   $(window)
       .on('scroll', function() {
           if ($(this).scrollTop() > 200)
               $('.btntoTop').addClass('active');
           else
               $('.btntoTop').removeClass('active');
      });

}); //onload
</script>
</body>
</html>