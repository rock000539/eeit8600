<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- **taglib沒有的話記得要加入** -->
<!-- **加入2個css，請按照此順序** -->
<link href="/css/bootstrap.min.css" rel="stylesheet" >
<link href="/css/bootstrap-theme.css" rel="stylesheet">
<link href="/css/review-customize.css" rel="stylesheet">



<title>Review List</title>
</head>
<body>


<div class="row row-body">
	<c:forEach var='review' items="${reviews}">

	  <div class="col-sm-6 col-md-3 body">
	    <div class="thumbnail">
					<!-- Img start -->
			<a href="/reviews/list" > <!-- ???連結要換成去一篇的心得頁面 -->
	    	<div class="reviewImg">
	      		<img class="reviewImg-Img" src="/reviews/show?reviewId=${review.reviewId}">
	      	</div></a>
	      			<!-- Img end -->
<!--???去除文字超連結所設的div還沒好-->	
		      	<div class="reviewTime">${review.reviewTime}</div>
						<!--(???心得table要再加"推"?,心得留言table要再加"數量") -->
		      	<div class="reviewState">1推,1留言</div>
		      	
		      	<div class="caption">
						<!--心得發布者資訊start -->
					<div class="user-info">
						<a href="/members/list"><!-- ???放no1會員有發過的心得list連結-->
							<!--會員照片 -->
							<div class="card-header-circle">
								<img class="memeberImg" src="/reviews/show?reviewId=${review.reviewId}" alt="memeberImg"> 
							</div>
						</a>
						<!--會員暱稱 -->
						<div class="user-name">
							<a href="/members/list">要抓會員暱稱</a> <!-- ???*同38行*放no1會員有發過的心得list連結-->
						</div>
						<!--心得評分 -->
						<div class="review-uc-heart ">
							<div class="urcosme-score-display">
							    <img class="inline-block-heart" src="/img/loading.gif" alt="reviewScore"> 
							    <img class="inline-block-heart" src="/img/loading.gif" alt="reviewScore"> 
							    <img class="inline-block-heart" src="/img/loading.gif" alt="reviewScore"> 
							    <img class="inline-block-heart" src="/img/loading.gif" alt="reviewScore"> 
							    <img class="inline-block-heart" src="/img/loading.gif" alt="reviewScore"> 
							 </div><span class="review-rating">${review.reviewRating}分</span>  
						</div>
						<!-- ???到時候抓會員的肌膚和年齡 -->
						<div class="user-skin">混合性肌膚、25歲</div>
					</div>
					<!-- user-info end -->	 <!--心得發布者資訊end -->
				
				<!--心得內容Start -->
				<a class="review" href="/reviews/list" > <!-- ???連結要換成去一篇的心得頁面 -->
		      		<div> ${review.review}</div>
		        </a>
		        <p>
<!-- 			        <a href="http://www.google.com" class="btn btn-primary" role="button">Button1</a>  -->
<!-- 			        <a href="http://www.yahoo.com.tw" class="btn btn-default" role="button">Button2</a> -->
		        </p>
	        </div>
	        <!-- caption end --> 
	    </div>
	    <!-- thumbnail end --> 
	  </div>
	  <!-- col-sm-6 col-md-3 end --> 
	  </c:forEach>

</div>
<!-- row end --> 



<!-- **加入2個js，請按照此順序** -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>


</body>
</html>