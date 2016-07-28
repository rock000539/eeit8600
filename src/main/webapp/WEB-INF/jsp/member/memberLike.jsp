<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>${member.nickname}'s Posted</title>

	<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="/css/animate.css">
	<link rel="stylesheet" href="/css/fms/style.css">
	<link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
	<!-- customize -->
    <link rel="stylesheet" href="/css/member/member-customize.css">
    
	<script type="text/javascript" src="/js/jquery.min.js"></script> 
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
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
.reviews, .articles{
	padding: 33px 0 40px 0;
	border-top: 1px solid #E0E0E0;
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
	font-family: "Neutra Face","Helvetica Neue",Helvetica,Arial,sans-serif;
}
.reviewTime>span{
	display: block;
	font-size: 15px;
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

.btn-delete, .articleDel{
	display: inline-block;
	vertical-align: middle;
	font-size: 10px;
	line-height: 20px;
	padding: 3px 6px;
	background: #727CB6;
	color: #fff;
	cursor: pointer;
}
.reviewContent h2>span:hover , .articleDel:hover{
	background: #000;
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
.articleType{
	color: #df3331;
	font-family: "Irvin Text",Georgia,"Times New Roman",Times,serif;
    font-size: 12px;
    line-height: 24px;
    margin-bottom: 12px;
}
.author{
	line-height: 14px;
    font-size: 12px;
	font-family: Savoy,Georgia,serif;
    padding-right: 5px;
    color: #999;
    font-style: italic;
    margin-top: 5px;
}
.author a{
	font-family: FranklinGothic,Helvetica,sans-serif;
    text-transform: uppercase;
    letter-spacing: .12em;
    color: #333;
    text-decoration: underline;
}
.author a:hover{
	color: #FF1E76;
}
.preview{
	overflow: hidden; 
	display: -webkit-box;
    -webkit-line-clamp: 4;
    -webkit-box-orient: vertical;
    text-align: justify;
    line-height: 20px;
    font-size: 18px;
    font-weight: 300;
    color: #333;
}
.modal-content{
	text-align: center;
	padding: 30px 0 20px 0;
}
.modal-content h2{
	font-weight: 400;
}
.modal {
  text-align: center;
}

@media screen and (min-width: 768px) { 
  .modal:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}
</style>
</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />

			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
<div class="row detail-div">
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
				<p id="count-review"><i class="fa fa-heart"></i> LIKED REVIEWS (${fn:length(reviews)})</p>
			</div>
			<div class="subtab">
				
			</div> <!-- subtab -->
	        <c:forEach var="item" items="${reviews}" varStatus="vs">
	        <div class="reviews col-lg-12" dataId=${item.reviewId}>
	        <div class="review-all">
	        	<div class="reviewTime">
	        		<span>${item.reviewTime}</span>
					<div class="rating">
					<c:forEach begin="1" end="${item.reviewRating}"><i class="fa fa-diamond"></i></c:forEach>
					</div>
	        		<div class="info"><i class="fa fa-heart"></i> ${item.rewCollect}
	        		&nbsp;&nbsp;<i class="fa fa-comments"></i> ${item.rewCollect}</div>
	        	</div>
		        <div class="reviewImg"><a href="<%=request.getContextPath()%>/products/view/${item.product.prodId}"><img src="/products/show?prodImg=${item.product.prodImg}"/></a></div>
		        <div class="reviewContent">
		        	<h2 class="reviewTitle">${item.reviewTitle}&nbsp;
		        	<span class="btn-delete"  value="${item.reviewId}"
	         		 data-toggle="modal" data-target="#myModal"><i class="fa fa-heartbeat" value="${item.reviewId}"></i>&nbsp;DisLike</span></h2>
		        	
		        	<h4 class="prod">${item.product.prodName} | ${item.product.brand.brandName} </h4>
		        	<h6 class="author">by&nbsp;
		        		<a href="<%=request.getContextPath()%>/members/overview/${item.memberId}">${item.member.nickname}</a></h6>
		        	<p class="preview">${fn:substring(item.review, 0, 76)} ...</p>
		        	<a class="singlepage" href="/reviews/review/${item.reviewId}">read more</a>
		        	<i class="fa fa-angle-right" style="color:#a60505;padding-left:5px;"></i>
		        </div>
		    </div>
	        </div> <!-- reviews -->
	        </c:forEach>
	    </div>
	    
	    
	    
	    <!-- articles -->
	    
	    <div id="article" class="tab-pane fade">
        	<div class="subject">
				<p id="count-article"><i class="fa fa-heart"></i> LIKED ARTICLES (${fn:length(articles)})</p>
			</div>
			<div class="subtab">
			</div> <!-- subtab -->
			<c:forEach var="item" items="${articles}" varStatus="vs">
			<div class="articles col-lg-12" dataId="${item.articleId}">
				<div class="articleTime">
					<h4>${item.articleTime}</h4>
					<h4 class="articleType">${item.articleType}</h4>
					
				</div>
				<div class="articleContent">
					<h2 class="articleTitle">${item.articleTitle}&nbsp;
						<span class="articleDel" name="${item.articleId}"
	         		 	data-toggle="modal" data-target="#myModal"><i class="fa fa-heartbeat" name="${item.articleId}"></i>&nbsp;DisLike</span></h2>
					<h6 class="author">by&nbsp;
		        <a href="<%=request.getContextPath()%>/members/overview/${item.memberId}">${item.member.nickname}</a></h6>	
					<p class="preview">${item.articleContent}</p>
					<a class="singlepage" href="<%=request.getContextPath()%>/articles/view/${item.articleId}">read more</a>
		        	<i class="fa fa-angle-right" style="color:#a60505;padding-left:5px;"></i>
				</div>
			</div>
			</c:forEach>
    	</div>
	</div> <!-- tab-content -->
</div> <!-- tabContent -->

	</div> <!-- col-lg -->
	
<div id="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
    	<h2>Delete ?</h2>
    	<br>
    	<button id="del-confirm" class="btn btn-default">Confirm</button>
    </div>
  </div>
</div>
	
	<c:import url="/WEB-INF/jsp/member/memberPages-nav.jsp" />
	
</div> <!-- row -->
					
				</div>        

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />

		
<script>
$(function(){
	//review
	var btn1;
	var reviewId;
	$('.btn-delete').click(function(e){
		btn1 = e.target;
		reviewId = btn1.getAttribute('value');
		console.log(btn1);
		console.log(reviewId);	
	});//btn-delete onClick
	
	//article
	var btna;
	var articleId;
	$('.articleDel').click(function(e){
		btna = e.target;
		articleId = btna.getAttribute('name');
		console.log(btna);
		console.log(articleId);	
	});//btn-delete onClick
	
	
	$('#del-confirm').click(function(){		
		if(reviewId != null){
		$.ajax({
			url:"/members/like/review/delete",
			data:{"reviewId": reviewId},
			type:'get',
			success:function(result){
				console.log(result);
				$(".reviews[dataId*="+reviewId+"]").remove();
				$('#count-review').html('<i class="fa fa-heart"></i> LIKED REVIEWS ('+result+')');
				$('#myModal').modal('toggle');
				reviewId=null;
			}
		}); //ajax
		} //if review
		
		if(articleId != null){
			$.ajax({
				url:"/members/like/article/delete",
				data:{"articleId": articleId},
				type:'get',
				success:function(result){
					console.log(result);
					$(".articles[dataId*="+articleId+"]").remove();
					$('#count-article').html('<i class="fa fa-heart"></i> LIKED ARTICLES ('+result+')');
					$('#myModal').modal('toggle');
					articleId = null;
				}
			}); //ajax
		} //if article
	});
		
	
	
	//timeline
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