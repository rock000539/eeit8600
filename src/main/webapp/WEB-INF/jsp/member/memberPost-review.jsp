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
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />

<div id="timelineDiv">
<section id="cd-timeline">
	<c:forEach var="item" items="${reviews}">
	<div class="cd-timeline-block">
		<div class="cd-timeline-img"></div>
		
		<div class="cd-timeline-content">
			<h2>${item.reviewTitle}</h2>
			<div class="cd-img"><img src="/products/show?prodId=${item.reviewId}"/></div>
			<p>Rating: ${item.reviewRating}</p>
			<p>${item.review}</p>
			<p>收藏數: ${item.rewCollect}</p>
			<a href="#" class="cd-info">觀看心得</a>
            <a href="#" class="cd-info">編輯心得</a>
			<span class="cd-date">${item.reviewTime}</span>
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