<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 	<title>Review</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">

    
    <!-- CSS FILES -->
    <link href="/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    <link href="/css/review/style.css" rel="stylesheet" >
	<link href="/css/review/reviewjQueryRain-customize.css" rel="stylesheet">
	
	<!-- Sweet Alert 2 -->
	<link rel="stylesheet" href="/css/product/sweetalert2.min.css">
	
	<script src="/js/jquery.min.js"></script>
</head> 
<style>
.wrapper {
    background: #FFFFFF;
    margin-top: 0px;
    border-top: 5px solid #648CD5;
}

.pbhead  ul > li{
    margin-top:10px;
	float: right;
}

.pbhead  ul > li>a{
	float: right;
	height:50px;
}

.btn-like{
	background: #ff9b9b;
}

.btn-like:hover{
	background: #ff7f7f;
}

.pbhead_comment  ul > li{
    margin-bottom:10px;
	float: right;
}

.pbhead_comment ul > li>a{
 	float: right; 
	height: 27px;
	width: 27px;
}


</style>
<body>

<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="row">
	<div style="border:3px solid #efefef"></div>
<!--start wrapper-->
<section class=" container">
    <!--Start Header-->

    <!--End Header-->

		<!-- start site search -->
<!-- 			<div class="widget widget_search"
				style="width: 200px; height: 40px; float: right">
				<div class="site-search-area">
					<form method="get" id="site-searchform" action="#">
						<div>
							<input class="input-text" name="s" id="s"
								placeholder="Enter Search keywords..." type="text" /> <input
								id="searchsubmit" value="Search" type="submit" />
						</div>
					</form>
				</div>
				
			</div>
		<!-- end site search -->
        <section class="content blog">
                <div class="row">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                        <div class="blog_single">
                            <article class="post">
                                <figure class="post_img">
                                    <img class="reviewImg" src="/reviews/show?reviewImg=${review.reviewImg}" alt="reviewImg">
                                </figure>
                                <div class="post_date">
                                    <span class="day">${day}</span>
                                    <span class="month">${month}</span>
                                </div>
                                <div class="post_content">
                                    <div class="post_meta">
                                    <h2>${review.reviewTitle}</h2>
                                        <div class="metaInfo">
                                            <span><i class="fa fa-calendar"></i>&nbsp;${review.reviewTime}</span>
                                            <span><a href="#shares"><i class="fa fa-user"></i> By ${review.member.nickname}</a> </span>                          
                                            <c:choose> 
												<c:when test="${review.reviewCMs.size()==0}">
		                                            <span><i class="fa fa-comments"></i> <a id="myComments" href="#Comments">${review.reviewCMs.size()} Comment</a></span> 
												</c:when>
												<c:otherwise>
		                                            <span><i class="fa fa-comments"></i> <a id="myComments" href="#Comments">${review.reviewCMs.size()} Comments</a></span> 
												</c:otherwise>
											</c:choose>
<!--                                             <span><i class="fa fa-tag"></i> <a href="#">Emin</a>, <a href="#">News</a> </span> --><!--??tag標籤數量?? -->
                                        <!--心得評分 start-->
											<span class="review-uc-diamond">
												<span class="urcosme-score-display">
													<span class=" fa fa-diamond diamond" id="diamond1"></span>
													<span class=" fa fa-diamond diamond" id="diamond2"></span>
													<span class=" fa fa-diamond diamond" id="diamond3"></span>
													<span class=" fa fa-diamond diamond" id="diamond4"></span>
													<span class=" fa fa-diamond diamond" id="diamond5"></span>					
													<script type="text/javascript">
														$(function(){
															for(var i=0;i<"${review.reviewRating}";i++){
																$("#diamond"+(i+1)).css('color','rgb(100, 140, 213)');
															}
														});
													</script>
												</span>&nbsp;&nbsp;&nbsp;<span name="review-rating" class="review-rating">${review.reviewRating}&nbsp;scores</span>  
											</span>
											<!--心得評分  end -->
                                        </div>
                                    </div>
                                    
                                    <blockquote class="default">
                                    	<p>${review.review}</p>
                                    </blockquote>
                                    
                                </div>
                                <ul class="shares" id="shares">
                                    <li class="shareslabel"><h3>Share This Story</h3></li>
                                    <li><a class="twitter" data-placement="bottom" data-toggle="tooltip" title="Twitter"></a></li>
                                    <li><a class="facebook" data-placement="bottom" data-toggle="tooltip" title="Facebook"></a></li>
                                    <li><a class="gplus" data-placement="bottom" data-toggle="tooltip" title="Google Plus"></a></li>
                                    <li><a class="pinterest" data-placement="bottom" data-toggle="tooltip" title="Pinterest"></a></li>
                                    <li><a class="yahoo" data-placement="bottom" data-toggle="tooltip" title="Yahoo"></a></li>
                                    <li><a class="linkedin" data-placement="bottom" data-toggle="tooltip" title="LinkedIn"></a></li>
                                </ul>
                                <div class="pbhead">
                                <ul>
                                    <li><a href="javascript:;" class="btn-danger" title="report"><i class="fa fa-warning" id="reportBtn" style="font-size:22px;margin:12px 11px"></i></a></li>
									<c:if test="${review.memberId==memberId}">
										<li><a href="/reviews/edit_fms/${review.reviewId}" class="btn-info" title="edit"><i class="fa fa-pencil" style="font-size:22px;margin:12px 13px"></i></a></li>
									</c:if>
									<li><a href="#Comments" class="btn-success" title="comments"><i class="fa fa-comments-o" style="font-size:22px;margin:11px 11px"></i></a></li>
									<li><a href="#replyarea" class="btn-warning btn-like" title="like" data-prodId="${review.reviewId}" onClick="save_review_click($(this))"><i class="fa fa-heart" style="font-size:22px;margin:12px 15px"></i></a></li>
                                </ul>
                                </div>	
                            </article>
                            <div class="about_author">
                                <div class="author_desc">
<!--                                     <img src="/images/review/author.png" alt="about author"> -->
<%--                                     <img id="userimg" src="/members/show?memberId=${review.memberId}" alt="memeberImg">  --%>
                                    <img src="/members/show?memberId=${review.memberId}" alt="memeberImg"> 
                                    <ul class="author_social">
                                        <li><a class="fb" href="#." data-placement="top" data-toggle="tooltip" title="Facbook"><i class="fa fa-facebook"></i></a></li>
                                        <li><a class="twtr" href="#." data-placement="top" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                        <li><a class="skype" href="#." data-placement="top" data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
                                    </ul>
                                </div>
                                <!--心得發布者資訊start -->
                                <div class="author_bio">
                                    <h3 class="author_name"><a href="/members/post/review?memberId=${review.member.memberId}">${review.member.nickname}</a></h3><!-- ???放no1會員有發過的心得list連結-->
                                  	<ul>
                                  		<li class="user-detail">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gender:&nbsp;${review.member.gender}</li>
                                  		<li class="user-detail">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Skin Type:&nbsp;${review.member.skinType}&nbsp;Skin</li>
                                  		<li class="user-detail">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Age:&nbsp;${review.member.age}&nbsp;Age</li>
                                  		<p></p><!--不可以刪,為了版型好看-->
                                  	</ul>
                                </div>
                                <!--心得發布者資訊end -->
                            </div>
                        </div>

                        <!--News Comments-->
                        <div class="news_comments">
                            <div class="dividerHeading">
                            	<c:choose> 
									<c:when test="${review.reviewCMs.size()==0}">
                              			<h4 id="Comments"><span id="MyComments">Comment</span></h4>
									</c:when>
									<c:otherwise>
                                		<h4 id="Comments"><span id="MyComments">Comments (${review.reviewCMs.size()})</span></h4>
									</c:otherwise>
								</c:choose>
                            </div>
                            <div id="comment">
                                <ul id="comment-list">
                                
                                
<!--                                 	<li class="comment"> -->
<!-- 								    	<div class="avatar"><img alt="" src="/members/show?memberId=_memberId" class="avatar"></div> -->
<!-- 								        <div class="comment-container"> -->
<!-- 									        <h4 class="comment-author"><a href="#">_memberNickname</a></span></h4> -->
<!-- 								            <div class="comment-meta"><a href="#" class="comment-date link-style1">_reviewCMTime </a></div> -->
<!-- 								            <div class="comment-body"> -->
<!-- 								    	        <p>_reviewCMMsg</p> -->
								    	        
<!-- 								            </div> -->
<!-- 								        </div> -->
<!-- 								     	<div class="pbhead_comment"> -->
<!-- 					                        <ul> -->
<!-- 					                            <li><a href="javascript:;" class="btn-danger" title="report"><i class="fa fa-warning" id="reportBtn" style="font-size:13px;margin:8px 8px"></i></a></li> -->
<!-- 												<li><a href="#" class="btn-info" title="edit"><i class="fa fa-pencil" style="font-size:13px;margin:8px 8px"></i></a></li> -->
<!-- 												<li><a href="#replyarea" class="btn-warning btn-like" title="like"><i class="fa fa-heart" style="font-size:13px;margin:8px 8px"></i></a></li> -->
<!-- 					                        </ul> -->
<!-- 					                    </div> -->
<!-- 								    </li> -->
								    
								    
<!--                                     <li class="comment"> -->
<!--                                         <div class="avatar"><img alt="" src="/images/review/avatar_1.png" class="avatar"></div> -->
<!--                                         <div class="comment-container"> -->
<!--                                             <h4 class="comment-author"><a href="#">John Smith</a></span></h4> -->
<!--                                             <div class="comment-meta"><a href="#" class="comment-date link-style1">February 22, 2015</a></div> -->
<!--                                             <div class="comment-body"> -->
<!--                                                 <p>Ne omnis saperet docendi nec, eos ea alii molestiae aliquand. Latine fuisset mele, mandamus atrioque eu mea, wi forensib argumentum vim an. Te viderer conceptam sed, mea et delenit fabellas probat.</p> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </li> -->
                                    
<!--                                     <li class="comment"> -->
<%--                                         <div class="avatar"><img alt="" src="/members/show?memberId=${review.reviewCMs[0].memberId}" class="avatar"></div> --%>
<!--                                         <div class="comment-container"> -->
<%--                                             <h4 class="comment-author"><a href="#">${review.reviewCMs[0].member.nickname}</a></span></h4> --%>
<%--                                             <div class="comment-meta"><a href="#" class="comment-date link-style1">${review.reviewCMs[0].reviewCMTime} </a><a class="comment-reply-link link-style3" href="#respond">Reply &raquo;</a></div> --%>
<!--                                             <div class="comment-body"> -->
<%--                                                 <p>${review.reviewCMs[0].rcmMsg}</p> --%>
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </li> -->
                                </ul>
                            </div>
                            <!-- /#comments -->
                            <div class="dividerHeading">
                                <h4><span>Leave a comment</span></h4>
                                </div>
						<form id="addForm" action="/reviewCMs/insert" method="post">
                            <input type="hidden" name="memberId" id="memberInfo" value="${memberId}"/>
                            <input id="reviewId" type="hidden" name="reviewId" value="${review.reviewId}"/>
                           
                            <input id="rcmShow" type="hidden" name="rcmShow" value="true"/>
                            <input id="rcmReport" type="hidden" name="rcmReport" value="0"/>
                            <div class="comment-box row">
                                <div class="col-sm-12">
                                    <p>	
                                    	<textarea class="ckeditor" id="rcmMsg" name="rcmMsg" rows="10" cols="40"></textarea>
                                    </p>
                                </div>
                            </div>
							<button class="btn btn-lg btn-default" type="button"  id="postComment"onclick="">Post Comment</button>
                         </form>
                        </div>
                    </div>
					
                    <!--Sidebar Widget-->
                    <div class="col-xs-12 col-md-4 col-lg-4 col-sm-4" >
                        <div class="sidebar">
                            
                                <div class="widget_title">
                                    <h4><span>Product</span></h4>
                                </div>
                            
                            <div class="velocity-tab sidebar-tab">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#Popular" data-toggle="tab">DETAILS</a></li>
                                    <li class=""><a href="#Recent" data-toggle="tab">DESCRIPTIONS</a></li>
<!--                                     <li class="last-tab"><a href="#Comment" data-toggle="tab"><i class="fa fa-tint"></i>&nbsp;成份</a></li>  -->
                                </ul>

                                <div class="tab-content clearfix">
                                    <div class="tab-pane fade active in" id="Popular">
                                        <ul class="recent_tab_list">
                                            <li style="border:0px">
                                                <span><img class="product-image" src="/products/show?prodImg=${review.product.prodImg}" alt="product-image" /></a></span>
                                                <p><span>Brand :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${review.product.brand.brandName}</p>
                                                <p><span>Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${review.product.prodName}</p>
                                                <p><span>Category :</span>${review.product.category.categoryName}</p>
                                                <p><span class="product-score">Score :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${review.product.score}&nbsp;&nbsp;scores</p>
                                            </li>
                                        </ul>
                                    </div>
                                    
                                    <div class="tab-pane fade" id="Recent">
                                        <ul class="recent_tab_list">
                                            <li style="border:0px">
                                                <span><img class="product-image" src="/products/show?prodImg=${review.product.prodImg}" alt="product-image" /></a></span>
                                                <p><span></span>${review.product.prodDesc}</p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
							
<!--                             <div class="widget widget_tags"> -->
<!--                                 <div class="widget_title"> -->
<!--                                     <h4><span>Tags Widget</span></h4> -->
<!--                                 </div> -->
<!--                                 <ul class="tags"> -->
<!--                                     <li><a href="#"><b>business</b></a></li> -->
<!--                                     <li><a href="#">corporate</a></li> -->
<!--                                     <li><a href="#">css3</a></li> -->
<!--                                     <li><a href="#"><b>html5</b></a></li> -->
<!--                                     <li><a href="#">javascript</a></li> -->
<!--                                     <li><a href="#"><b>jquery</b></a></li> -->
<!--                                     <li><a href="#">multipurpose</a></li> -->
<!--                                     <li><a href="#"><b>mysql</b></a></li> -->
<!--                                     <li><a href="#">portfolio</a></li> -->
<!--                                     <li><a href="#">premium</a></li> -->
<!--                                     <li><a href="#">responsive</a></li> -->
<!--                                     <li><a href="#"><b>theme</b></a></li> -->
<!--                                     <li><a href="#"><b>jQuery Rain</b></a></li> -->
<!--                                 </ul> -->
<!--                             </div> -->
                            

                        </div>
                    </div>
                </div><!--/.row-->
        </section>

    <!--start footer-->

    <!--end footer-->
<!-- </section> -->
<!--end wrapper-->

<!-- 使用model1 ----------------------------------------------------------------->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">Report this Review :
          	<!-- title 位置 --><input type="text" id="reportTitle" name="reportTitle" placeholder="檢舉標題">
            </h4>
         </div>
        
         <div class="modal-body" id="modal-body">
<!--在这里添加一些文本-->				
			
			<br>
			<textarea cols="50" rows="5" id="reportDetail" name="reportDetail" placeholder="檢舉內容"></textarea>
			<br><br>
<!-- 		<input type="button" name="cancel" class="btn btn-sm btn-default" value="cancel" > -->
			<button id="sendReprot" class="btn btn-sm btn-default" name="submit" >Confirm</button>
         </div>
         
         <div class="modal-footer">
            <button type="button" class="btn btn-default"   id="cancelInsert"   data-dismiss="modal" >
         	 Close
            </button>
<!--             <button type="button" class="btn btn-primary" id="insertNewIngredient" > -->
<!--             	   提交更改 -->
<!--             </button> -->
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->

<!-- 結束model1 ----------------------------------------------------------------->




            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />


	<!--內縮的script是必加的 -->
	<script type="text/javascript" src="/js/review/jquery-1.10.2.min.js"></script>
  		  <script src="/js/bootstrap.min.js"></script>
    <script src="/js/review/jquery.easing.1.3.js"></script>
    <script src="/js/review/retina-1.1.0.min.js"></script>
    <script type="text/javascript" src="/js/review/jquery.cookie.js"></script> <!-- jQuery cookie -->
    <script type="text/javascript" src="/js/review/styleswitch.js"></script> <!-- Style Colors Switcher -->
          <script type="text/javascript" src="/js/review/jquery.smartmenus.min.js"></script>
   		  <script type="text/javascript" src="/js/review/jquery.smartmenus.bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/review/jflickrfeed.js"></script>
   		  <script type="text/javascript" src="/js/review/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="/js/review/jquery.isotope.min.js"></script>
  		  <script type="text/javascript" src="/js/review/swipe.js"></script>
    	  <script type="text/javascript" src="/js/review/jquery-scrolltofixed-min.js"></script>
		  <script type="text/javascript" src="/js/fms/fms-main.js"></script>
    <script src="/js/review/main.js"></script>
    	  <script src="/ckeditor/ckeditor.js"></script>
    	  
   	<!-- Sweet Alert 2 -->
		  <script type="text/javascript" src="/js/product/sweetalert2.min.js"></script>
    	  
<script id="reviewCM_mode" type="text/template">

	<li class="comment">
    	<div class="avatar"><img alt="" src="/members/show?memberId=_memberId" class="avatar"></div>
        <div class="comment-container">
	        <h4 class="comment-author"><a href="#">_memberNickname</a></span></h4>
            <div class="comment-meta"><a href="#" class="comment-date link-style1">_reviewCMTime </a></div>
            <div class="comment-body">
    	        <p>_reviewCMMsg</p>
            </div>
        </div>
     	<div class="pbhead_comment">
			 <ul>
				<li><a href="javascript:;" class="btn-danger" title="report"><i class="fa fa-warning" id="reportBtn" style="font-size:13px;margin:8px 8px"></i></a></li>
			 </ul>
		</div>
    </li>

</script>    	  
    	  
<script type="text/javascript">
$(function(){  //=$(document.)ready
	/*  ============ USER IMG =========== 	*/ 
// 		var w = $('#userimg').width();
// 		var h = $('#userimg').height();
// 		if (h > w) {
// 			$('#userimg').addClass('portrait');
// 		} else {
// 			$('#userimg').removeClass('portrait');
// 		}
// 		console.log('w=' + $('#userimg').width());
// 		console.log('h=' + $('#userimg').height());

		$.fn.serializeObject = function()
		{
		    var o = {};
		    var a = this.serializeArray();
		    $.each(a, function() {
		        if (o[this.name] !== undefined) {
		            if (!o[this.name].push) {
		                o[this.name] = [o[this.name]];
		            }
		            o[this.name].push(this.value || '');
		        } else {
		            o[this.name] = this.value || '';
		        }
		    });
		    return o;
		}; //serializeObject end
			
// 			$.ajax({
// 				url:"/reviewCMs/select/"+$('#reviewId').val(),
// 				type:'POST',
// // 				contentType:'application/json;charset=UTF-8',
// // 				data:JSON.stringify($('#addForm').serializeObject()),
// 				data:{'reviewId':$('#reviewId').val()},
// 				dataType:'json',
// 				success:function(result){
// 					console.log("result1="+result);
// 					appendReviewCM(result);
// 				},error:function(x,y,z){
// 					console.log("x="+x);
// 					console.log("y="+y);
// 					console.log("z="+z);
// 				}
// 			})//onload ajax
			
			$.ajax({
				url:"/reviewCMs/select_data",
				type:'POST',
				contextType:'application/json;charset=UTF-8',
// 				data:JSON.stringify($('#addForm').serializeObject()),
				data:{'reviewId':$('#reviewId').val()},
				dataType:'json',
				success:function(result){
// 					console.log("result1="+result);
					appendReviewCMData(result);
				},error:function(x,y,z){
					console.log("x="+x);
					console.log("y="+y);
					console.log("z="+z);
				}
			})//onload ajax

		$('#postComment').click(function(){
			var value=CKEDITOR.instances['rcmMsg'].getData();
// 			console.log(value);
		});//check ckeditor data end

		$('#postComment').on('click',function(){
			$('#rcmMsg').val(CKEDITOR.instances['rcmMsg'].getData());
// 			console.log($('#addForm'));
// 			console.log(JSON.stringify($('#addForm').serializeObject()));
			$.ajax({
				url:'/reviewCMs/insert',
				type:'post',
				contentType:'application/json;charset=UTF-8',
				data:JSON.stringify($('#addForm').serializeObject()),
				dataType:'json',
				success:function(result){
// 					console.log("result1="+result);
					$("#MyComments").text('Comments (' + (parseInt($("#MyComments").text().substr(10, 1)) + 1) + ')');
					$("#myComments").text(parseInt($("#myComments").text().substr(0,1))+1+' Comments');					
					appendReviewCM(result);
					CKEDITOR.instances['rcmMsg'].setData("");
// 					location.href="#addForm";
				},error:function(x,y,z){
					console.log("x="+x);
					console.log("y="+y);
					console.log("z="+z);
				}
			})
		})//#postComment click end

		function appendReviewCMData(result){
// 			console.log("result2="+result);
			
// 			console.log("result[0]=",result[0]);
// 			console.log("result[0].memberId=",result[0].memberId);
// 			console.log("result[0].nickname=",result[0].nickname);
// 			console.log("result[0].reviewCMTime=",result[0].reviewCMTime);
// 			console.log("result[0].rcmMsg=",result[0].rcmMsg);
			for(var i=0 ; i < result.length; i++){
				var str =$('#reviewCM_mode').html();
// 				console.log("str="+str);
				$(str.replace("_memberId",result[i].memberId)
					  .replace("_memberNickname",result[i].nickname)
					  .replace("_reviewCMTime",result[i].reviewCMTime)
					  .replace("_reviewCMMsg",result[i].rcmMsg))					  
					  .appendTo($('#comment-list'));
			}
		}//appendReviewCMData end
		
		function appendReviewCM(result){
// 			console.log("result3="+result);
				var str =$('#reviewCM_mode').html();
// 				console.log("str="+str);
				$(str.replace("_memberId",result.memberId)
					  .replace("_memberNickname",result.nickname)
					  .replace("_reviewCMTime",result.reviewCMTime)
					  .replace("_reviewCMMsg",result.rcmMsg))
					  .appendTo($('#comment-list'));
		}//appendReviewCM end
		
		
		//--檢舉功能----------------------------------
		$("#reportBtn").click(function (){
			$('#myModal').modal("toggle");				
		});
		// 文章新增檢舉
			$("#sendReprot").click(function(){
			var reportTitle=$("#reportTitle").val();
			var reportDetail=$("#reportDetail").val();
			var memberId=$("#memberInfo").attr("value");
			var reviewId=$("#reviewId").attr("value");
			var articleId=0;  //不用參數要設0
			var acmId=0;
			var rcmId=0;
// 			alert("reportTitle="+reportTitle+" reportDetail="+reportDetail+" memberid="+memberid+"reviewId="+reviewId);
			$.ajax({
			"url":"/webmail/sendmail",
				type:"POST",
				data:{"memberId":memberId,
			"articleId":articleId,
			"reviewId":reviewId,
			"acmId":acmId,
			"rcmId":rcmId,
			"reportTitle":reportTitle,
			"reportDetail":reportDetail},
				success:function(result){
				$('#myModal').modal("toggle");		
				}
				})
				})
		
		
		
});//$(function () end

		
	//收藏心得
	function save_review_click(a) {
	
		var reviewId = $(a).attr('data-prodId');
		
		$.ajax({
			url: '/members/like/review/' + reviewId,
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








</script>

</body>
</html>