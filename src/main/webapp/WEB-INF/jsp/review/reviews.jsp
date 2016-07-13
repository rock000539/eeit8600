<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- **taglib沒有的話記得要加入** -->

<!-- **加入4個css，請按照此順序** -->
<link href="/css/review/bootstrap-reviews.css" rel="stylesheet" >
<link href="/css/review/bootstrap-theme.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css"/> <!--**new**-->
<link href="/css/review/reviews-customize.css" rel="stylesheet">
<script src="/js/jquery.min.js"></script>


<title>Reviews</title>
</head>
<body>
<!-- <div class="container text-center" style="text-align: center"> -->
<div class="container">
<!-- <div class="row row-body"> -->
	<c:forEach var='review' items="${reviews}" >
	  <div class="col-sm-6 col-md-3 body" name="body">
	    <div class="thumbnail" >
					<!-- Img start -->
			<a href="/reviews/list" > <!-- ???連結要換成去一篇的心得頁面 -->
	    	<div class="reviewImg">
<%-- 	      		<img class="reviewImg-Img" src="/reviews/show?reviewId=${review.reviewId}"> --%>
	      		<img class="reviewImg-Img" src="/products/show?prodId=${review.prodId}">
	      	</div></a>
	      			<!-- Img end -->
		      	<div class="reviewTime">${review.reviewTime}</div>
						<!--(???心得table要再加"推"?,心得留言table要再加"數量") -->
		      	<div class="reviewState">1推,1留言</div>
		      	
		      	<div class="caption">
						<!--心得發布者資訊start -->
					<div class="user-info">
						<a class="user-info-link" href="/members/list"><!-- ???放no1會員有發過的心得list連結-->
							<!--會員照片 -->
							<div class="card-header-circle">
								<img class="memeberImg" src="/reviews/show?reviewId=${review.reviewId}" alt="memeberImg"> 
							</div>
						</a>
						<!--會員暱稱 -->
						<div class="user-name">
							<a href="/members/list">${review.member.nickname}</a> <!-- ???*同38行*放no1會員有發過的心得list連結-->
						</div>
						<!--心得評分 end-->
						<div class="review-uc-diamond">
							<div class="urcosme-score-display">
								<span class=" fa fa-diamond diamond" id="tb${review.reviewId}diamond1"></span>
								<span class=" fa fa-diamond diamond" id="tb${review.reviewId}diamond2"></span>
								<span class=" fa fa-diamond diamond" id="tb${review.reviewId}diamond3"></span>
								<span class=" fa fa-diamond diamond" id="tb${review.reviewId}diamond4"></span>
								<span class=" fa fa-diamond diamond" id="tb${review.reviewId}diamond5"></span>						
								<script type="text/javascript">
// 								console.log("${review.product.reviews}");
									$(function(){
										for(var i=0;i<"${review.reviewRating}";i++){
											$("#tb${review.reviewId}diamond"+(i+1)).css('color','#FF5151');
										}
									});
								</script>
							</div>&nbsp;&nbsp;&nbsp;<span name="review-rating" class="review-rating">${review.reviewRating}分</span>  
						</div>
						<!--心得評分  end -->
						<!-- ???到時候抓會員的肌膚和年齡 -->
						<div class="user-skin">混合性肌膚、25歲</div>
					</div>
					<!-- user-info end -->	 <!--心得發布者資訊end -->
				
				<!--心得內容Start -->
				<a class="review-link" href="/reviews/list" > ${review.review}</a>
				<!-- ???連結要換成去一篇的心得頁面 -->
				 <!--心得內容end -->
				<a name="review-bottom-title" class="review-bottom-title" id="review-bottom-title" href="/reviews/list" > ${review.reviewTitle}</a>
					<!-- ???連結要換成去一篇的心得頁面 -->
<%-- 		      		<div  name="review-bottom-title" class="review-bottom-title" id="review-bottom-title">${review.reviewTitle}</div> --%>
<!-- 		        </a> -->
	        </div>
	        <!-- caption end --> 
	    </div>
	    <!-- thumbnail end --> 
	  </div>
	  <!-- col-sm-6 col-md-3 end --> 
	  </c:forEach>	  
<!-- </div> -->
<!-- row end --> 
</div>

<!-- **加入2個js，請按照此順序** -->
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript">
		
		
		  $(function () {  //=$(document.)ready
				
 		 	$("div[name='body']").hover(function(){
				$(this).find("#review-bottom-title").css('opacity','1');
		 		$(this).css('border','1px solid');
		 		$(this).css('border-color','#BEBEBE');
		 	},function(){
				$(this).find("#review-bottom-title").css('opacity','0');
		 		$(this).css('border','');
		 		$(this).css('border-color','#BEBEBE');
		 	});//hover end
		 	
		 	
		  });

		  //瀑布流 no ok
// 		  $('.row').masonry({
// 			    itemSelector: '.item',  //選擇要做佈局的項目方塊
// 			    columnWidth: 30,        //網格對齊的寬度 
// 			})

</script>


</body>
</html>