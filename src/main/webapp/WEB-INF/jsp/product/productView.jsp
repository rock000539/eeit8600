<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<!-- 基本檔案 -->
	<script src="/js/jquery.min.js"></script>
	<link href="/css/bootstrap.min.css" rel="stylesheet">	
	<script src="/js/bootstrap.min.js"></script>
	
	<!-- Header & Footer -->
	<link rel="stylesheet" href="/css/fms/style.css">
	<link rel="stylesheet" href="/css/fms/fms-customize.css">
	
	<!-- ThisPage Template -->
	<link href="/css/product/product-view.css" rel="stylesheet" />
	
	<!-- jQuery Redirect Plugin -->
	<script src="/js/jquery.redirect.js"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ProductView</title>
	
	<style>
		
		.image { 
		   position: relative; 
		   width: 100%;
		}
		
		.serviceBox_4 { 
		   position: absolute; 
		   top: 73%; 
		   width: 100%; 
		}
		
		.serviceBox_4 .service-icon a > span {
			width: 65px;
			height: 65px;
		}
		
/* 		.our-team span.profile { */
/* 			visibility: hidden; */
/* 		} */
		
	</style>
	
</head>
<body>
	
	<!--加入header&nav -->
	<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />

	<!-- **每頁不同的內容從這裡開始** -->
	<div class="grey_bg row">
		
		<div class="col-sm-1"></div>
		
		<div class="col-sm-10">
		
			<section class="team row sub_content">
			
		        <div class="col-lg-12 col-md-12 col-sm-12">
		            <div class="dividerHeading">
		                <h4><span>Recent Reviews</span></h4>
		            </div>
		        </div>
				
				<c:forEach items="${product.reviews}" var="review">
				
			        <div class="col-md-4 col-sm-6" style="margin-bottom: 30px;">
			            <div class="our-team" style="height:455px;">
			                <div class="team-pic image">
			                    <img src="http://localhost:8080/products/show?prodId=${review.prodId}" style="width:auto; height:245.06px; margin:0 auto; padding: 10% 0;">
	<!-- 		                    <div class="team-overlay"></div> -->
			                    <div class="serviceBox_4">
				                    <div class="service-icon">
				                        <a href="#">
				                            <span></span>
				                        </a>
				                    </div>
				                </div>
			                </div>
			                
			                <div class="team-profile">
			                    <h4 class="names">
			                    	${fn:substring(review.reviewTitle, 0, 21)}<br/>
			                    	<i class="fa fa-calendar"></i>&nbsp;&nbsp;${review.reviewTime}&nbsp;&nbsp;
			                    	<c:forEach begin="1" end="${review.reviewRating}">
										<i class="fa fa-diamond"></i>
									</c:forEach> <br/>
			                    </h4>
			                    <span class="profile">
			                    	<c:if test="${fn:substring(review.review, 0, 2) == '內文' }">
										<p>Etu eros omnes theophratus mei, cumit usulan dicit omnium eripuit. Qui tever iluma facete gubergren ... </p>
									</c:if>
									<c:if test="${fn:substring(review.review, 0, 2) != '內文' }">
										<p>${fn:substring(review.review, 0, 50)} ...</p>
									</c:if>
									<span>
										<i class="fa fa-user"></i>&nbsp;&nbsp;${review.member.nickname}&nbsp;&nbsp;&nbsp;${review.member.skinType}&nbsp;性肌膚
				                    	<span style="float:right;"><i class="fa fa-comment"></i>&nbsp;&nbsp;${review.rewCollect}&nbsp;&nbsp;</span>
									</span>
			                    </span>
			                </div>
			
			                <div class="team-social-media" style="text-align: center;">
			                	<a id="search" class="btn btn-primary" style="margin-top:-2.5%;"><i class="fa fa-search"></i>&nbsp;&nbsp;收藏心得</a>
			                	<a id="save" class="btn btn-primary" style="margin-top:-2.5%;"><i class="fa fa-save"></i>&nbsp;&nbsp;觀看心得</a>
			                </div>
			            </div>
			        </div>
		        
		        </c:forEach>
		        
		    </section>
		    
		</div>
		
		<div class="col-sm-1"></div>
		
	</div>        
    <!-- **每頁不同的內容結束** -->
	
	<!--加入footer -->
	<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
	
	<!-- Header & Footer -->
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>
	
	<script>
	
		var timelineBlocks = $('.our-team'),
		offset = 0.9;

		hideBlocks(timelineBlocks, offset);
	
		//on scolling, show/animate timeline blocks when enter the viewport
		$(window).on('scroll', function(){
			(!window.requestAnimationFrame) 
				? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
				: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
		});
	
		function hideBlocks(blocks, offset) {
			blocks.each(function(){
				( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.team-pic, .team-profile, .team-social-media').addClass('is-hidden');
			});
		}
	
		function showBlocks(blocks, offset) {
			blocks.each(function(){
				( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.team-pic').hasClass('is-hidden') ) && $(this).find('.team-pic, .team-profile, .team-social-media').removeClass('is-hidden').addClass('bounce-in');
				console.log("show"+$(this));
			});
		}
			
	</script>
	
</body>
</html>