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

</style>
</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />

			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">

<!-- <div id="selectCondition"> -->
<!-- 	<form> -->
<!-- 		<div class="checkbox"> -->
<!-- 			<label> -->
<!-- 				<input type="checkbox" name="" value=""> -->
<!-- 			</label> -->
<!-- 		</div> -->
<!-- 	</form> -->
<!-- </div> -->

<div id="timelineDiv">
<section id="cd-timeline">
	<c:forEach var="item" items="${articles}">
	<div class="cd-timeline-block">
		<div class="cd-timeline-img"></div>
		
		<div class="cd-timeline-content">
			<h2>${item.articleTitle}</h2>
			<small>${item.articleType}</small>
			<p>${item.articleContent}</p>
			<a href="/articles/article-page?articleId=${item.articleId}" class="cd-info">觀看文章</a>
            <a href="/articles/edit?articleId=${item.articleId}" class="cd-info">編輯文章</a>
			<span class="cd-date">${item.articleTime}</span>
		</div> <!-- cd-timeline-content -->
	</div> <!-- cd-timeline-block -->
	</c:forEach>
	<input type="hidden" id="pageNum" value="${pageNum}">
</section>
</div> <!-- timeline Div -->

				</div>        
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />

<script id="blockTemplate" type="text/template">
	<div class="cd-timeline-block">
		<div class="cd-timeline-img"></div>

		<div class="cd-timeline-content">
			<h2>_articleTitle</h2>
			<small>_articleType</small>
			<p>_articleContent</p>
			<a href="/articles/article-page?articleId=_articleId" class="cd-info">觀看文章</a>
            <a href="/articles/edit?articleId=_articleId" class="cd-info">編輯文章</a>
			<span class="cd-date">_articleTime</span>
		</div>
	</div>
</script>
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
	
	$(window).scroll(function(){
	    if($(window).scrollTop() + $(window).height() >= $(document).height()){	
	    	var pageNum = parseInt($('#pageNum').val())+1;
	    	console.log("pageNum: "+pageNum);
	    	$.ajax({
	    		url: '/members/post/article/'+pageNum,
				type: 'POST',
				dataType: 'json',
				contextType: 'application/json; charset=utf-8;',
				success: function(response){
					var result = response[0];
					
					var articles = result.articles;
					var member = result.member;
					var pageNum = result.pageNum;
					
					$('#pageNum').val(pageNum);
					
					for(var i=0; i<articles.length; i++){
						$($('#blockTemplate').html()
							.replace('_articleTitle', articles[i].articleTitle)
							.replace('_articleType', articles[i].articleType)
							.replace('_articleContent', articles[i].articleContent)
							.replace('_articleId', articles[i].articleId)
							.replace('_articleId', articles[i].articleId)
							.replace('_articleTime', articles[i].articleTime))
							.appendTo($('#cd-timeline'));
					}
				}
	    	});
	    }
	});
	
	

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