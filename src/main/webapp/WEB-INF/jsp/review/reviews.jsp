<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- **taglib沒有的話記得要加入** -->

<!-- **加入4個css，請按照此順序** -->
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css"/> <!--**new**-->
<link href="/css/review/bootstrap-reviews.css" rel="stylesheet" >
<link rel="stylesheet" href="/css/fms/style.css">
<link href="/css/review/reviews-customize.css" rel="stylesheet">
<link rel="stylesheet" href="/css/fms/fms-customize.css">
<script src="/js/jquery.min.js"></script>

<!-- jQuery Redirect Plugin -->
<script src="/js/jquery.redirect.js"></script>	

<title>心得總覽</title>
</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
				
<!-- <div class="container text-center" style="text-align: center"> -->
<div class="container">
<div>
<a href="/reviews/add"><button class="btn btn-danger btn-lg" type="button" style="width:110px;margin:10px 0 0 10px;font-family:'Microsoft JhengHei'">
	<i class="fa fa-plus"></i>&nbsp;寫心得</button>
</a>	
<!-- <button class="btn btn-default btn-lg" type="button" data-toggle="modal" data-target="#myModal" onclick="toModal()"><i class="fa fa-check fa-fw" aria-hidden="true"></i>&nbspSave</button> -->

<!-- <input type ="button" onclick="history.back()" class="btn btn-danger btn-lg" value="回到上一頁"></input> -->
</div>
<!-- <div class="row row-body"> -->
	<c:forEach var='review' items="${reviews}" >
	  <div class="col-sm-6 col-md-3 body" name="body">
	    <div class="thumbnail" >
					<!-- Img start -->
			<a href="/reviews/review/${review.reviewId}" >
	    	<div class="reviewImg">
	      		<img class="reviewImg-Img" src="/products/show?prodImg=${review.product.prodImg}">
	      	</div></a>
	      			<!-- Img end -->
		      	<div class="reviewTime" style="font-family:'Microsoft JhengHei'">${review.reviewTime}</div>
		      	<div class="reviewState" style="font-family:'Microsoft JhengHei'">${review.rcms.size()}&nbsp;留言</div>
		      	
		      	<div class="caption">
						<!--心得發布者資訊start -->
					<div class="user-info">
						<a class="user-info-link" href="/members/overview/${review.memberId}">
							<!--會員照片 -->
							<div class="img-circle userdiv">
								<img id="userimg" src="/members/show?memberId=${review.memberId}" alt="memeberImg"> 
							</div>
						</a>
						<!--會員暱稱 -->
						<div class="user-name" style="font-family:'Microsoft JhengHei'">
							<a href="/members/overview/${review.memberId}">${review.member.nickname}</a>
						</div>
						<!--心得評分 start-->
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
							</div>&nbsp;&nbsp;&nbsp;<span name="review-rating" class="review-rating" style="font-family:'Microsoft JhengHei'">${review.reviewRating}分</span>  
						</div>
						<!--心得評分  end -->
						<div class="user-skin" style="font-family:'Microsoft JhengHei'">${review.member.skinType}&nbsp;皮膚、${review.member.age}&nbsp;歲</div>
					</div>
					<!-- user-info end -->	 <!--心得發布者資訊end -->
				
				<!--心得內容Start -->
				<a class="review-link" href="/reviews/review/${review.reviewId}" > ${review.review}</a>
				 <!--心得內容end -->
				<a name="review-bottom-title" class="review-bottom-title" id="review-bottom-title" href="/reviews/review/${review.reviewId}" > ${review.reviewTitle}</a>
<%-- 		      		<div  name="review-bottom-title" class="review-bottom-title" id="review-bottom-title">${review.reviewTitle}</div> --%>
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


</div>        
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />


<!-- **加入2個js，請按照此順序** -->
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/fms/swipe.js"></script>
<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/fms/fms-main.js"></script>
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
		 	
 		 	  /*  ============ USER IMG =========== 	*/ 
 		 		var w = $('#userimg').width();
 		 		var h = $('#userimg').height();
 		 		if (h > w) {
 		 			$('#userimg').addClass('portrait');
 		 		} else {
 		 			$('#userimg').removeClass('portrait');
 		 		}
//  		 		console.log('w=' + $('#userimg').width());
//  		 		console.log('h=' + $('#userimg').height());

 				function category_click(a) {
 					console.log($(a).attr('data-categoryId'));
 					$.redirect('/products/inventory', { 'categoryId': $(a).attr('data-categoryId') });
 				}
		  
		  });

</script>


</body>
</html>