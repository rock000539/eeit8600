<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>${member.nickname}'s 發佈清單</title>

	<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="/css/animate.css">
	<link rel="stylesheet" href="/css/fms/style.css">
	<link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
	<!-- customize -->
    <link rel="stylesheet" href="/css/member/member-customize.css">
    
	<script type="text/javascript" src="/js/jquery.min.js"></script> 
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	<script src="https://use.typekit.net/riz5mva.js"></script>
	<script>try{Typekit.load({ async: true });}catch(e){}</script>
	<script src="/js/member/member.js"></script>
<style>
h2, h4{
	margin: 0;
	font-weight: normal;
}
#member-header{
	border-bottom: 0px;
}
.nav-tabs{
	border-bottom: 1px solid #000;
}
.nav-tabs li a{
	display: block;
	padding: 13px 50px;
	border: 0px;
	background: #fff;
}
.nav-tabs li, .nav-tabs li:hover, .nav-tabs li.active{
	margin: 0 5px 0 0;
}
.nav-tabs li.active, .nav-tabs li.active a, .nav-tabs li.active a:hover,
.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus,
.nav-tabs li a:hover{
    background: #000;
    color: #fff;
	border: 0px;
}

.tab-content{
 	border: 0px;
 	padding-left: 0px;
}

.prod{
	color:#000;
	font-weight: 400;
	font-size: 16px;
	line-height: 20px;
	display:inline-block;
	padding-bottom: 5px;
}
.reviewTime, .articleTime{
	position:relative;
	display: block;
	float: left;
	min-height: 200px;
	text-align: right;
	font-size: 12px;
	line-height: 24px;
	letter-spacing: 0.1em;
	color:#666;
	margin-right: 30px;
	margin-bottom: 20px;
	width: 90px;
	top:2px;
	border-top: 2px solid #000;
	font-family: FranklinGothic,Helvetica,sans-serif;
}
.reviewTime>span{
	display: block;
	font-size: 15px;
	line-height: 24px;
}
.articleTime h4{
	font-family: FranklinGothic,Helvetica,sans-serif;
}
.reviewImg{
	display: table-cell;
	position: relative;
	width: 200px;
}
.reviewImg img{
	width: 100%;
}

.reviewContent{
	display: table-cell;
	padding-left: 30px;
	vertical-align: top;
}
.reviewContent h2, .reviewContent p, .reviewContent h4
.articleContent h2, .articleContent p, .articleContent h4{
	font-family: Microsoft YaHei;
}
.reviewContent h2.reviewTitle, .articleTitle{
	color: #000;
	font-size: 28px;
	font-weight: normal;
	letter-spacing: 0.05em;
	padding-bottom: 5px;
}
.reviewContent h2.reviewTitle>span, .articleEdit{
	display: inline-block;
	vertical-align: middle;
	font-size: 10px;
	padding: 0 10px 0 4px;
	background: #727CB6;
	cursor: pointer;
}
.reviewContent h2>span a, .articleEdit{
	color: #fff;
	line-height: 20px;
}
.reviewContent h2>span:hover , .articleEdit:hover{
	background: #000;
	color:fff;
}

.singlepage{
    font-family: Savoy,Georgia,serif;
    font-size: 16px;
    text-decoration: underline;
    color: #000;
}
.singlepage:hover{
	text-decoration: underline;
}
.blog_single{
	display: inline-block;
}
.blog_single .post_date{
	float: right;
	padding-top: 5px;
}
.blog_single .day{
	font-size: 16px;
	padding: 5px;
}
.blog_single .month{
	padding: 2px 8px 4px;
}
.subject{
	text-align: center;
	letter-spacing: 1px;
	font-family: "Proxima Nova",sans-serif;
	font-size: 14px;
	padding: 13px 16px;
	text-transform: uppercase;
}
.articleType{
	color: #df3331;
	font-family: "Irvin Text",Georgia,"Times New Roman",Times,serif;
    font-size: 12px;
   	line-height: 24px;
    margin-bottom: 12px;
}

</style>
</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />

			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
<div class="row detail-div animated fadeIn">
	<div class="col-lg-10 col-sm-6 wow fadeInLeft delay-05s memberDiv">
		<c:import url="/WEB-INF/jsp/member/memberPages-header.jsp" />
		
<div id="tabnav">
	<div id="maintab">
		<ul class="nav nav-tabs">
            <li id="tab-r" class=" active"><a data-toggle="tab" href="#review">Review</a></li>
            <li id="tab-a" class=""><a data-toggle="tab" href="#article">Article</a></li>
        </ul>
	</div> <!-- maintab -->
</div> <!-- tabnav -->

<div id="container">
	<div class="tab-content clearfix">
	    <div id="review" class="tab-pane fade active in">
	    	<div class="subject">
				<p>POSTED REVIEWS (${reviewsTotalElement})</p>
			</div>
			<div class="subtabs">
				<span class="subtab selected">ALL (${reviewsTotalElement})</span>
				<span class="sep"> · </span>
				<span value="MAKEUP" class="subtab">MAKEUP (${countMakeUp})</span>
				<span class="sep"> · </span>
				<span value="SKINCARE" class="subtab">SKINCARE (${countSkinCare})</span>
				<span class="sep"> · </span>
				<span value="BATHBODY" class="subtab">BATHBODY (${countBathBody})</span>
				<span class="sep"> · </span>
				<span value="HAIR" class="subtab">HAIR (${countHair})</span>
				<div class="dropdown arrow">
				  <div class="dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
				    <i class="fa fa-sort" aria-hidden="true"></i>
				  </div>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
				    <li style="margin-bottom: 10px;"><a value="DESC"> <i class="fa fa-sort-amount-desc" aria-hidden="true"></i></a></li>
				    <li><a value="ASC"> <i class="fa fa-sort-amount-asc" aria-hidden="true"></i></a></li>
				  </ul>
				</div>
				<div id="reviewsort" class="dropdown">
				  <div class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
				    Time
				    <span class="caret"></span>
				  </div>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
				    <li><a value="reviewTime">Time</a></li>
				    <li><a value="reviewRating">Rating</a></li>
				  </ul>
				</div>
				<div style="display:inline-block; float:right;">Order By</div>
			</div> <!-- subtabs -->
	        <div id="reviewContentDiv">
	        <c:forEach var="item" items="${reviews}" varStatus="vs">
	        <div class="reviews col-lg-12">
	        <div class="review-all">
	        	<div class="reviewTime">
	        		<span>${item.reviewTime}</span>
	        		<span class="articleType">${item.categoryTitle}</span>
					<div class="rating">
					<c:forEach begin="1" end="${item.reviewRating}"><i class="fa fa-diamond"></i></c:forEach>
					</div>
	        		<div class="info"><i class="fa fa-heart"></i> ${item.rewCollect}
	        		&nbsp;&nbsp;<i class="fa fa-comments"></i> </div>
	        	</div>
		        <div class="reviewImg"><a href="<%=request.getContextPath()%>/products/view/${item.prodId}"><img src="/products/show?prodImg=${item.prodImg}"/></a></div>
		        <div class="reviewContent">
		        	<h2 class="reviewTitle">${item.reviewTitle}&nbsp;
		        	<span><a href="/reviews/edit_fms/${item.reviewId}"><i class="fa fa-pencil"></i>&nbsp;EDIT</a></span></h2>
		        	<h4 class="prod">${item.prodName} | ${item.brandName}</h4>
		        	<div class="preview">${item.review}</div>
		        	<a class="singlepage" href="<%=request.getContextPath()%>/reviews/review/${item.reviewId}">read more</a>
		        	<i class="fa fa-angle-right" style="color:#a60505;padding-left:5px;"></i>
		        </div>
		    </div>
	        </div> <!-- reviews -->
	        </c:forEach>
	        </div>
	        <input type="hidden" id="reviewsPageNum" value="${reviewsPageNum}">
			<input type="hidden" id="reviewsTotalPages" value="${reviewsTotalPages}">
	    </div>
	    
	    <!-- articles -->
	    
	    <div id="article" class="tab-pane fade">
        	<div class="subject">
				<p>POSTED ARTICLES (${articlesTotalElement})</p>
			</div>
			<div class="subtabs">
				<span class="subtab selected">ALL (${articlesTotalElement})</span>
				<span class="sep"> · </span>
				<span value="NEWS" class="subtab">NEWS (${countNews})</span>
				<span class="sep"> · </span>
				<span value="SOLICIT" class="subtab">SOLICIT (${countSolicit})</span>
				<span class="sep"> · </span>
				<span value="QUESTION" class="subtab">QUESTION (${countQuestion})</span>
				<span class="sep"> · </span>
				<span value="CHAT" class="subtab">CHAT (${countChat})</span>
			</div> <!-- subtabs -->
			<div id="articleContentDiv">
				<c:forEach var="item" items="${articles}" varStatus="vs">
				<div class="articles col-lg-12">
					<div class="articleTime">
						<h4>${fn:substring(item.articleTime,0,19)}</h4>
						<h4 class="articleType">${item.articleType}</h4>
						<h4 class="info"><i class="fa fa-comments"></i> ${item.arSize}</h4>
					</div>
					<div class="articleContent">
						<h2 class="articleTitle">${item.articleTitle}&nbsp;
							<a  class="articleEdit" href="/articles/edit/${item.articleId}">
							<span>
							<i class="fa fa-pencil"></i>&nbsp;EDIT</span></a></h2>
						<div class="preview">${item.articleContent}</div>
						<a class="singlepage" href="/articles/view/${item.articleId}">read more</a>
			        	<i class="fa fa-angle-right" style="color:#a60505;padding-left:5px;"></i>
					</div>
				</div>
				</c:forEach>
			</div>
			<input type="hidden" id="articlesPageNum" value="${articlesPageNum}">
			<input type="hidden" id="articlesTotalPages" value="${articlesTotalPages}">
    	</div>
	</div> <!-- tab-content -->
</div> <!-- tabContent -->



	</div> <!-- col-lg -->
	
	<c:import url="/WEB-INF/jsp/member/memberPages-nav.jsp" />
	
</div> <!-- row -->
					
				</div>        

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
<script type="text/javascript" src="/js/jquery.min.js"></script> 
<script id="reviewTemplate" type="text/template">
<div class="reviews col-lg-12 animated fadeIn">
	<div class="reviewTime">
		<span>_reviewTime</span>
		<span class="articleType">_categoryTitle</span>
		<div class="rating">_rating</div>
		<div class="info"><i class="fa fa-heart"></i> _rewCollect
			&nbsp;&nbsp;<i class="fa fa-comments"></i> _rcmNum</div>
	</div>
	<div class="reviewImg"><a href="<%=request.getContextPath()%>/products/view/_prodId">
		<img src="/products/show?prodImg=_prodImg"/></a></div>
	<div class="reviewContent">
		<h2 class="reviewTitle">_reviewTitle&nbsp;
			<span><a href="/reviews/edit_fms/_reviewId"><i class="fa fa-pencil"></i>&nbsp;EDIT</a></span></h2>
		<h4 class="prod">_prodName | _brandName </h4>		
		<p class="preview">_review</p>
		<a class="singlepage" href="/reviews/review/_reviewId">read more</a>
		<i class="fa fa-angle-right" style="color:#a60505;padding-left:5px;"></i>
	</div>
</div>
</script>
<script id="articleTemplate" type="text/template">
<div class="articles col-lg-12 animated fadeIn">
	<div class="articleTime">
		<h4>_articleTime</h4>
		<h4 class="articleType">_articleType</h4>
		<h4 class="info"><i class="fa fa-comments"></i> _arSize</h4>
	</div>
	<div class="articleContent">
		<h2 class="articleTitle">_articleTitle&nbsp;
			<a class="articleEdit" href="/articles/edit/_articleId">
			<span><i class="fa fa-pencil"></i>&nbsp;EDIT</span></a></h2>
		<p class="preview">_articleContent</p>
		<a class="singlepage" href="/articles/view/_articleId">read more</a>
       	<i class="fa fa-angle-right" style="color:#a60505;padding-left:5px;"></i>
	</div>
</div>
</script>		
<script>
$(function(){
	var memberId = ${member.memberId};
	var categoryTitle;
	var sortProperty="reviewTime"; //default
	var articleType;
	var direction = "DESC"; //default
	
	//根據sortProperty排序
	$('#reviewsort a').click(function(){
		if(sortProperty == $(this).attr('value')){
			return;
		}
		sortProperty = $(this).attr('value');
		console.log(sortProperty);
		$('#reviewsort #dropdownMenu1').html($(this).html()+' <span class="caret"></span>');
		$('#reviewContentDiv').empty();
		loadReviewData();
	});
	
	//DESC或ASC
	$('.arrow a').click(function(){
		if(direction == $(this).attr('value')){
			return
		}
		direction = $(this).attr('value');
		if(direction=="DESC"){
			$('.arrow #dropdownMenu2').html('<i class="fa fa-sort-amount-desc" aria-hidden="true"></i>');
		}
		if(direction=="ASC"){
			$('.arrow #dropdownMenu2').html('<i class="fa fa-sort-amount-asc" aria-hidden="true"></i>');
		}
		$('#reviewContentDiv').empty();
		loadReviewData();
	});
	
	
	$('.subtabs>.subtab').click(function(){
		// 改變樣式，但同一個tab不作用
		if($(this).hasClass('selected')){
			return;
		}
		
		//review 指定categoryTitle
		if($('#tab-r').hasClass('active')){
			$('#review .subtabs>.selected').removeClass('selected');
			$(this).addClass('selected');
			console.log($(this).attr('value'));
			categoryTitle = $(this).attr('value');
			$('#reviewContentDiv').empty();
			loadReviewData();
		}
		
		// articles 指定articleType
		if($('#tab-a').hasClass('active')){
			$('#article .subtabs>.selected').removeClass('selected');
			$(this).addClass('selected');
			articleType = $(this).attr('value');
			$('#articlesPageNum').attr("value", 0);
			$('#articleContentDiv').empty();
			loadArticleData(0, articleType, direction);
		}
	});
	
	$(window).scroll(function(){
		
		if($(window).scrollTop() + $(window).height() >= $(document).height()){	
			if($('#tab-a').hasClass('active')){
				var nextPage = parseInt($('#articlesPageNum').val())+1;
				loadArticleData(nextPage, articleType, direction);
			}
		}  /* scroll-bottom*/
	}); /* onScroll */
	
	
	var timelineBlocks = $('.reviews'),
	offset = 0.95;
	hideBlocks(timelineBlocks, offset);
	$(window).on('scroll', function(){
		(!window.requestAnimationFrame) 
			? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
			: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
	});
	function hideBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.review-all').addClass('is-hidden');
			console.log("hide");
		});
	}
	function showBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.review-all').hasClass('is-hidden') ) && $(this).find('.review-all').removeClass('is-hidden').addClass('animated fadeInDown');
			console.log("show"+$(this));
		});
	}  	
	
	
	function loadReviewData(){
		var data= {"memberId": memberId,"categoryTitle":categoryTitle, "sortProperty": sortProperty, "direction": direction};

		$.ajax({
			url: '/members/post/review',
			type: 'GET',
			dataType: 'json',
			data: data,
			contextType: 'application/json; charset=utf-8;',
			success: function(result){
				console.log(result[0].reviewRating);
				
				for(var i=0; i<result.length; i++){
					var reviewRating = result[i].reviewRating;
					var dimand = '<i class="fa fa-diamond"></i>';
					var rating = "";
					for(var j=0; j<reviewRating; j++){
						rating += dimand;
					}
					$($('#reviewTemplate').html()
						.replace('_reviewTime', result[i].reviewTime)
						.replace('_categoryTitle', result[i].categoryTitle)
						.replace('_rating', rating)
						.replace('_rewCollect', result[i].rewCollect)
						.replace('_rcmNum', result[i].rcmNum)
						.replace('_prodId', result[i].prodId)
						.replace('_prodImg', result[i].prodImg)
						.replace('_reviewTitle', result[i].reviewTitle)
						.replace('_reviewId', result[i].reviewId)
						.replace('_prodName', result[i].prodName)
						.replace('_brandName', result[i].brandName)
						.replace('_review', result[i].review)
						.replace('_reviewId', result[i].reviewId))
						.appendTo($('#reviewContentDiv'));
				}
			} /* success */
    	}); /* ajax */
	} /* loadReviewData */ 
	
	
	function loadArticleData(pageNum, articleType, direction){
		var data= {"memberId": memberId, "articleType": articleType, "direction": direction};
		console.log(data);
		var totalPages = $('#articlesTotalPages').val();
    	var loadedPageNum = $('#articlesPageNum').val();
    	
    	if(loadedPageNum < totalPages){
	    	$.ajax({
	    		url: '/members/post/article/'+pageNum,
				type: 'POST',
				data: data,
				dataType: 'json',
				contextType: 'application/json; charset=utf-8;',
				success: function(response){
					var result = response[0];
					var articles = result.articles;
					var returnPagea = result.articlesPageNum;
					var articlesTotalPages = result.articlesTotalPages;
					var member = result.member;
					
					$('#articlesPageNum').attr("value",returnPagea);
					$('#articlesTotalPages').val(articlesTotalPages);
					
					for(var i=0; i<articles.length; i++){
						$($('#articleTemplate').html()
							.replace('_articleTime', articles[i].articleTime)
							.replace('_articleType', articles[i].articleType)
							.replace('_arSize', articles[i].arSize)
							.replace('_articleTitle', articles[i].articleTitle)
							.replace('_articleId', articles[i].articleId)
							.replace('_articleContent', articles[i].articleContent)
							.replace('_articleId', articles[i].articleId))
							.appendTo($('#articleContentDiv'));
					}
				} /* success */
	    	});} /* ajax */
 			
	} /* loadArticleData */
	    	
	
	  /*============ BUTTON UP ===========*/
    
	var btnUp = $('<div/>', {'class':'btntoTop'});
	btnUp.appendTo('body');
	$(document).on('click', '.btntoTop', function() {
	    $('html, body').animate({scrollTop: 0}, 700);
    });
	
	$(window).on('scroll', function() {
        if ($(this).scrollTop() > 200)
            $('.btntoTop').addClass('active');
        else
            $('.btntoTop').removeClass('active');
   });

});
	

</script>
</body>
</html>