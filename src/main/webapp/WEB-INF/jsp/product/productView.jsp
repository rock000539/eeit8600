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
	
	<!-- Sweet Alert 2 -->
	<link rel="stylesheet" href="/css/product/sweetalert2.min.css">
	
	<link rel="stylesheet" href="/css/animate.css">
	
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
			border-radius: 35px;
			background: white;
		}
		
		.img-prod
		{
 			border: 3px solid #727CB6;
			border-radius: 20px;
		
			-moz-box-shadow: 0 0 5px #fff;
			-webkit-box-shadow: 0 0 5px #fff;
			box-shadow: 0px 0px 5px #fff;
		}
		
		.view_tab span {
			font-size: 13px;
		}
		
		.bgcolor{
			background: -webkit-linear-gradient(#EBDBFF , #FFEFD5); /* For Safari 5.1 to 6.0 */
		 	background: -o-linear-gradient(#EBDBFF , #FFEFD5); /* For Opera 11.1 to 12.0 */
		  	background: -moz-linear-gradient(#EBDBFF , #FFEFD5); /* For Firefox 3.6 to 15 */
		  	background: linear-gradient(#EBDBFF , #FFEFD5); /* Standard syntax */
		}
		
		.dividerHeading h4 span {
		    background: #EBDBFF;
		}
		
		.our-team .names {
		    border-top: 3px solid #bdbacf;
		}
		
		.team-social-media {
			background: #faeae1
		}
		
		.swal {
		    border-radius: 20px !important;
		    width: 400px !important;
		    margin-left: -200px !important;
		}
		
		a.save{
			background: #EA3556;
			color: #fff;
		}
		a.write{
			background: #ED146F;
			color: #fff;
		}
		a.share{
			background: #3b5998;
			color: #fff;
		}
		a.analyze{
			background: #41ced9;
			color: #fff;
		}
		
		#navigationDiv{
			float:left;
			margin-left: 50px;
		}
		#navigationMenu li{
			list-style:none;
			height:39px;
			width:40px;
			padding:2px;
		}
		#navigationMenu span.nav-span{
			width:0;
			right:38px;
			padding:0;
			position:absolute;
			overflow:hidden;
			font-family:Microsoft JhengHei, "Droid Serif", serif;
			font-size:18px;
			font-weight:bold;
			letter-spacing:0.6px;
			white-space:nowrap;
			line-height:39px;
			-webkit-transition: 0.25s;
			transition: 0.25s;
		}
		#navigationMenu a{
			height:39px;
			width:38px;
			display:block;
			position:relative;
			text-align: center;
		}
		#navigationMenu a>span.nav-icon{
			display: inline-block;
			padding-top: 9px;
			font-size: 22px;
		}
		#navigationMenu a:hover span.nav-span{
			width:auto; 
			padding:0 20px;
			overflow:visible; 
		}
		#navigationMenu a:hover{
			text-decoration:none;
			-webkit-box-shadow:0 0 5px #9ddff5;
			box-shadow:0 0 5px #9ddff5;
		}
		#navigationMenu .save {	background-position:0 0;}
		#navigationMenu .save:hover {	background-position:0 -39px;}
		#navigationMenu .save span.nav-span{
			background-color: #EA3556;
			color: #fff;
		/* 	text-shadow:1px 1px 0 #99bf31; */
		}
		#navigationMenu .write { background-position:-38px 0;}
		#navigationMenu .write:hover { background-position:-38px -39px;}
		#navigationMenu .write span.nav-span{
			background-color: #ED146F;
			color: #fff;
		/* 	text-shadow:1px 1px 0 #44a8d0; */
		}
		#navigationMenu .share { background-position:-152px 0;}
		#navigationMenu .share:hover { background-position:-152px -39px;}
		#navigationMenu .share span.nav-span{
			background-color: #3b5998;
			color: #fff;
		/* 	text-shadow:1px 1px 0 #d244a6; */
		}
		#navigationMenu .analyze { background-position:-76px 0;}
		#navigationMenu .analyze:hover { background-position:-76px -39px;}
		#navigationMenu .analyze span.nav-span{
			background-color: #41ced9;
			color: #fff;
		/* 	text-shadow:1px 1px 0 #d28344; */
		}
		
		a {
			cursor: pointer;
		}
		
		.progress-skill-bar .lable {
			width: 80px;
		}
		
		.progress_skill .bar {
			text-indent: 8px;
		}
		
	</style>
	
</head>
<body>
	
	<!--加入header&nav -->
	<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />

	<!-- **每頁不同的內容從這裡開始** -->
	<div class="grey_bg row bgcolor">
	
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<section class="team row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12" style="margin-top:30px;">
			            <div class="dividerHeading">
			                <h4><span>Product Introduction</span></h4>
			            </div>
			        </div>
		        </section>
			</div>
	        <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		
			<div class="col-sm-1"></div>
			
			<div class="col-sm-4" style="text-align: center;">
				<div id="navigationDiv">
					<ul id="navigationMenu">
					    <li>
						    <a class="save" data-prodId="${product.prodId}" onClick="save_prod_click($(this))">
						    	<span class="nav-icon"><i class="fa fa-heart"></i></span>
					            <span class="nav-span">收藏</span>
					        </a>
					    </li>
					    <li>
					    	<a class="write" data-prodId="${product.prodId}" onClick="write_review_click($(this))">
					            <span class="nav-icon"><i class="fa fa-pencil"></i></span>
					            <span class="nav-span">寫心得</span>
					        </a>
					    </li>
					    <li>
					    	<a class="analyze" data-toggle="modal" data-target="#myModal">
					    		<span class="nav-icon"><i class="fa fa-bar-chart"></i></span>
					            <span class="nav-span">心得分析</span>
					        </a>
					    </li>
					    <li>
					    	<a class="share">
					    		<span class="nav-icon"><i class="fa fa-facebook"></i></span>
					            <span class="nav-span">分享</span>
					        </a>
					    </li>
					</ul>
				</div>
				<img class="img-prod" src="<%= request.getContextPath() %>/products/show?prodImg=${product.prodImg}" />
			</div>
			
			<div class="col-sm-5">
			
				<div class="col-sm-6">
					<div class="view_tab" style="margin-top: 15px;">
			    		<label for="tab-one"><span>Name : ${product.prodName}</span></label>
				    </div>
			    	<div class="view_tab">
			      		<label for="tab-two"><span>Date : ${product.launchDate}</span></label>
			    	</div>
			    	<div class="view_tab">
				    	<label for="tab-one"><span>Brand : ${product.brandName}</span></label>
				    </div>
			    	<div class="view_tab">
				    	<label for="tab-one"><span>Category : ${product.categoryName}</span></label>
				    </div>
				    <div class="view_tab">
				    	<label for="tab-one"><span>Ingredient : ${product.mainIgdt}</span></label>
				    </div>
				</div>
				
				<div class="col-sm-6">
					<div class="view_tab" style="margin-top: 15px;">
				    	<label for="tab-one">
				    		<span>Qutie分數&nbsp;:&nbsp;
				    			<c:forEach begin="1" end="${product.score}">
									<i class="fa fa-diamond"></i>
								</c:forEach>
<%-- 								<c:if test="${product.score/1!=0}"> --%>
<!-- 									<i class="fa fa-diamond"></i> -->
<%-- 								</c:if> --%>
								&nbsp;${product.score}
				    		</span>
				    	</label>
				    </div>
					<div class="view_tab">
				      	<input id="tab-three" type="checkbox" name="tabs">
				      	<label for="tab-three"><span>Description</span></label>
				    	<div class="view_tab-content" style="overflow:auto;">
				    		<c:choose>
				    			<c:when test="${product.prodDesc.length() > 10}">
				    				<p>${product.prodDesc}</p>
				    			</c:when>
				    			<c:otherwise>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur, architecto, explicabo perferendis nostrum, maxime impedit atque odit sunt pariatur illo obcaecati soluta molestias iure facere dolorum adipisci eum? Saepe, itaque.</p>			    			
				    			</c:otherwise>
				    		</c:choose>
				    	</div>
				    </div>
				</div>
			
			</div>
			
			<div class="col-sm-2"></div>
			
		</div>
			
		<div class="row">
		
			<div class="col-sm-1"></div>
		
			<div class="col-sm-10">
			
				<section class="team row sub_content">
				
			        <div class="col-lg-12 col-md-12 col-sm-12" style="margin-bottom:30px;">
			            <div class="dividerHeading">
			                <h4><span>Recent Reviews</span></h4>
			            </div>
			        </div>
					
					<c:forEach items="${product.reviews}" var="review">
					
				        <div class="col-md-4 col-sm-6 portfolio-item" style="margin-bottom: 30px;">
				            <div class="our-team prodContent" style="height:455px;">
				                <div class="team-pic image">
				                    <img src="<%= request.getContextPath() %>/products/show?prodImg=${review.reviewImg}" style="width:auto; height:245.06px; margin:0 auto; padding: 10% 0;">
		<!-- 		                    <div class="team-overlay"></div> -->
				                    <div class="serviceBox_4">
					                    <div class="service-icon">
					                        <a>
					                            <span>
					                            	<img src="<%= request.getContextPath() %>/members/show?memberId=${review.member.memberId}" style="transform:rotate(-60deg); margin-top:-2px;">
					                            </span>
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
				                	<a class="btn btn-default" style="margin-top:-2.5%;" data-reviewId="${review.reviewId}" onClick="save_review_click($(this))"><i class="fa fa-heart"></i>&nbsp;&nbsp;收藏心得</a>
				                	<a class="btn btn-default" style="margin-top:-2.5%;" data-reviewId="${review.reviewId}" onClick="watch_review_click($(this))"><i class="fa fa-eye"></i>&nbsp;&nbsp;觀看心得</a>
				                </div>
				            </div>
				        </div>
			        
			        </c:forEach>
			        
			    </section>
			    
			</div>
			
			<div class="col-sm-1"></div>
			
		</div>
		
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
		    <div class="modal-content">
		    
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				  	<h3 class="modal-title">心得投稿分析</h3>
				</div>
				
				<div class="modal-body">
					<div class="row sub_content">
					
			            <div class="col-lg-6 ">
			            	
			            	<ul class="progress-skill-bar mrg-0">
			                    <li>
			                        <span class="lable">1顆鑽石</span>
			                        <div class="progress_skill">
			                            <div data-height="100" role="progressbar" data-value="${stars[1]/size}" class="bar" style="width: 0px; height: 0px;">
			                            </div>
			                        </div>
			                    </li>
			                    <li>
			                        <span class="lable">2顆鑽石</span>
			                        <div class="progress_skill">
			                            <div data-height="100" role="progressbar" data-value="${stars[2]/size}" class="bar" style="width: 0px; height: 0px;">
			                            </div>
			                        </div>
			                    </li>
			                    <li>
			                        <span class="lable">3顆鑽石</span>
			                        <div class="progress_skill">
			                            <div data-height="100" role="progressbar" data-value="${stars[3]/size}" class="bar" style="width: 0px; height: 0px;">
			                            </div>
			                        </div>
			                    </li>
			                    <li>
			                        <span class="lable">4顆鑽石</span>
			                        <div class="progress_skill">
			                            <div data-height="100" role="progressbar" data-value="${stars[4]/size}" class="bar" style="width: 0px; height: 0px;">
			                            </div>
			                        </div>
			                    </li>
			                    <li>
			                        <span class="lable">5顆鑽石</span>
			                        <div class="progress_skill">
			                            <div data-height="100" role="progressbar" data-value="${stars[5]/size}" class="bar" style="width: 0px; height: 0px;">
			                            </div>
			                        </div>
			                    </li>
			                </ul>
			                
			            </div>
			
			            <div class="col-lg-6 ">
			                <ul class="progress-skill-bar mrg-0">
			                    <li>
			                        <span class="lable">19 歲以下</span>
			                        <div class="progress_skill">
			                            <div data-height="100" role="progressbar" data-value="${ages[0]/size}" class="bar" style="width: 0px; height: 0px;">
			                            </div>
			                        </div>
			                    </li>
			                    <li>
			                        <span class="lable">20 - 24歲</span>
			                        <div class="progress_skill">
			                            <div data-height="100" role="progressbar" data-value="${ages[1]/size}" class="bar" style="width: 0px; height: 0px;">
			                            </div>
			                        </div>
			                    </li>
			                    <li>
			                        <span class="lable">25 - 29歲</span>
			                        <div class="progress_skill">
			                            <div data-height="100" role="progressbar" data-value="${ages[2]/size}" class="bar" style="width: 0px; height: 0px;">
			                            </div>
			                        </div>
			                    </li>
			                    <li>
			                        <span class="lable">30 - 34歲</span>
			                        <div class="progress_skill">
			                            <div data-height="100" role="progressbar" data-value="${ages[3]/size}" class="bar" style="width: 0px; height: 0px;">
			                            </div>
			                        </div>
			                    </li>
			                    <li>
			                        <span class="lable">35 歲以上</span>
			                        <div class="progress_skill">
			                            <div data-height="100" role="progressbar" data-value="${ages[4]/size}" class="bar" style="width: 0px; height: 0px;">
			                            </div>
			                        </div>
			                    </li>
			                </ul>
			            </div>
			            
			        </div>
				</div>
				
				<!--
				<div class="modal-footer">
					<button type="button" name="confirm" id="confirm" class="btn btn-default" data-dismiss="modal">Confirm</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
				-->
				
		    </div>
	    </div>
	</div>
	
    <!-- **每頁不同的內容結束** -->
	
	<!--加入footer -->
	<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
	
	<!-- Header & Footer -->
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>
	
	<!-- Sweet Alert 2 -->
	<script type="text/javascript" src="/js/product/sweetalert2.min.js"></script>
	
	<script type="text/javascript" src="/js/product/view/main.js"></script>
	
	<script>
		
		// 收藏心得
		function save_review_click (a) {
			
			var reviewId = $(a).attr('data-reviewId');
			
			$.ajax({
				url: '',
				type: 'POST',
				dataType: 'json',
				contextType: 'application/json; charset=utf-8;',
				data: { 'reviewId': reviewId },
				success: function(response) {
					if(response == true) {
						swal({
							type: 'success',
							text: '<h1 style="line-height:0px;">Save this review!</h1>',
							showConfirmButton: false,
							customClass: 'swal',
							timer: 1000,
						});
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log('jqXHR = ' + jqXHR + ', textStatus = ' + textStatus + ', errorThrown = ' + errorThrown);
				},
			});
			
		}
		
		// 觀看心得
		function watch_review_click (a) {
			document.location.href='/reviews/review?reviewId=' + $(a).attr('data-reviewId');
		}
		
		// 收藏產品
		function save_prod_click(a) {
			
			var prodId = $(a).attr('data-prodId');
			
			$.ajax({
				url: '/members/like/product/' + prodId,
				dataType: 'json',
				contextType: 'application/json; charset=utf-8;',
				success: function(response) {
					if(response == true) {
						swal({
							type: 'success',
							text: '<h1 style="line-height:0px;">收藏成功!</h1>',
							showConfirmButton: false,
							customClass: 'swal',
							timer: 1500,
						});
					} else {
						swal({
							type: 'info',
							text: '<h1 style="line-height:0px;">已經收藏過囉!</h1>',
							showConfirmButton: false,
							customClass: 'swal',
							timer: 1500,
						});
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log('jqXHR = ' + jqXHR + ', textStatus = ' + textStatus + ', errorThrown = ' + errorThrown);
				},
			});
			
		}
		
		// 寫心得
		function write_review_click(a) {
			document.location.href='/reviews/add?prodId=' + $(a).attr('data-reviewId');
		}
		
		// 分享產品
		function share_prod_click(a) {
			
		}
	
	</script>
	
	<script>
	
		var timelineBlocks = $('.portfolio-item'),
		offset = 0.8;

		hideBlocks(timelineBlocks, offset);
	
		$(window).on('scroll', function(){
			(!window.requestAnimationFrame) 
				? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
				: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
		});
	
		function hideBlocks(blocks, offset) {
			blocks.each(function(){
				( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.prodContent').addClass('is-hidden');
			});
		}
	
		function showBlocks(blocks, offset) {
			blocks.each(function(){
				( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.prodContent').hasClass('is-hidden') ) && $(this).find('.prodContent').removeClass('is-hidden').addClass('animated fadeInDown');
			});
		}
		
	</script>
	
</body>
</html>