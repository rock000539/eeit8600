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
	
	<script src="/js/jquery.min.js"></script>
</head> 
<body>

<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">


<!--start wrapper-->
<section class="wrapper container">
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
                                            <span><i class="fa fa-comments"></i> <a href="#Comments">12 Comments</a></span> <!--做動態抓留言數 -->
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
												</span>&nbsp;&nbsp;&nbsp;<span name="review-rating" class="review-rating">${review.reviewRating}score</span>  
											</span>
											<!--心得評分  end -->
                                        
                                        
                                        </div>
                                    </div>
                                    
                                         <img class="reviewImg" src="/reviews/show?reviewImg=${review.reviewImg}" alt="reviewImg">
                                    
                                    <blockquote class="default">
                                       
                                    <p>${review.review}</p>
                                        Nulla nunc dui, tristique in semper vel, congue sed ligula. Nam dolor ligula, faucibus id sodales in, auctor fringilla libero. Pellentesque pellentesque eget tempor tellus. Fusce lacinia tempor malesuada. Ut lacus sapien, placerat a ornare nec, elementum sit amet felis. Maecenas pretium lorem hendrerit eros sagittis fermentum.
                                    <p>${review.review}</p>
                                    </blockquote>
                                    
                                    
                                </div>
                                <ul class="shares" id="shares">
                                    <li class="shareslabel"><h3>Share This Story</h3></li>
                                    <li><a class="twitter" href="#" data-placement="bottom" data-toggle="tooltip" title="Twitter"></a></li>
                                    <li><a class="facebook" href="#" data-placement="bottom" data-toggle="tooltip" title="Facebook"></a></li>
                                    <li><a class="gplus" href="#" data-placement="bottom" data-toggle="tooltip" title="Google Plus"></a></li>
                                    <li><a class="pinterest" href="#" data-placement="bottom" data-toggle="tooltip" title="Pinterest"></a></li>
                                    <li><a class="yahoo" href="#" data-placement="bottom" data-toggle="tooltip" title="Yahoo"></a></li>
                                    <li><a class="linkedin" href="#" data-placement="bottom" data-toggle="tooltip" title="LinkedIn"></a></li>
                                </ul>
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
                                  		<li class="user-detail">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性別:&nbsp;${review.member.gender}</li>
                                  		<li class="user-detail">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;膚質:&nbsp;${review.member.skinType}性肌膚</li>
                                  		<li class="user-detail">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年齡:&nbsp;${review.member.age}歲</li>
                                  		<p></p><!--不可以刪,為了版型好看-->
                                  	</ul>
                                </div>
                                <!--心得發布者資訊end -->
                            </div>
                        </div>

                        <!--News Comments-->
                        <div class="news_comments">
                            <div class="dividerHeading">
                                <h4 id="Comments"><span>Comments (6)</span></h4>
                            </div>
                            <div id="comment">
                                <ul id="comment-list">
                                    <li class="comment">
                                        <div class="avatar"><img alt="" src="/images/review/avatar_1.png" class="avatar"></div>
                                        <div class="comment-container">
                                            <h4 class="comment-author"><a href="#">John Smith</a></span></h4>
                                            <div class="comment-meta"><a href="#" class="comment-date link-style1">February 22, 2015</a><a class="comment-reply-link link-style3" href="#respond">Reply &raquo;</a></div>
                                            <div class="comment-body">
                                                <p>Ne omnis saperet docendi nec, eos ea alii molestiae aliquand. Latine fuisset mele, mandamus atrioque eu mea, wi forensib argumentum vim an. Te viderer conceptam sed, mea et delenit fabellas probat.</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="comment">
                                        <div class="avatar"><img alt="" src="/images/review/avatar_2.png" class="avatar"></div>
                                        <div class="comment-container">
                                            <h4 class="comment-author"><a href="#">Eva Smith</a></span></h4>
                                            <div class="comment-meta"><a href="#" class="comment-date link-style1">February 13, 2015</a><a class="comment-reply-link link-style3" href="#respond">Reply &raquo;</a></div>
                                            <div class="comment-body">
                                                <p>Vidit nulla errem ea mea. Dolore apeirian insolens mea ut, indoctum consequuntur hasi. No aeque dictas dissenti as tusu, sumo quodsi fuisset mea in. Ea nobis populo interesset cum, ne sit quis elit officiis, min im tempor iracundia sit anet. Facer falli aliquam nec te. In eirmod utamur offendit vis, posidonium instructior sed te.</p>
                                            </div>
                                        </div>
                                        <ul class="children">
                                            <li class="comment">
                                                <div class="avatar"><img alt="" src="/images/review/avatar_3.png" class="avatar"></div>
                                                <div class="comment-container">
                                                    <h4 class="comment-author"><a href="#">Thomas Smith</a></span></h4>
                                                    <div class="comment-meta"><a href="#" class="comment-date link-style1">February 14, 2015</a><a class="comment-reply-link link-style3" href="#respond">Reply &raquo;</a></div>
                                                    <div class="comment-body">
                                                        <p>Labores pertinax theophrastus vim an. Error ditas in sea, per no omnis iisque nonumes. Est an dicam option, ad quis iriure saperet nec, ignota causae inciderint ex vix. Iisque qualisque imp duo eu, pro reque consequ untur. No vero laudem legere pri, error denique vis ne, duo iusto bonorum.</p>
                                                    </div>
                                                </div>
                                                <ul class="children">
                                                    <li class="comment">
                                                        <div class="avatar"><img alt="" src="/images/review/avatar_2.png" class="avatar"></div>
                                                        <div class="comment-container">
                                                            <h4 class="comment-author"><a href="#">Eva Smith</a></span></h4>
                                                            <div class="comment-meta"><a href="#" class="comment-date link-style1">February 14, 2015</a><a class="comment-reply-link link-style3" href="#respond">Reply &raquo;</a></div>
                                                            <div class="comment-body">
                                                                <p>Dico animal vis cu, sed no aliquam appellantur, et exerci eleifend eos. Vixese eros tiloi novum adtam, mazim inimicus maiestatis ad vim. Ex his unum fuisset reformidans, has iriure ornatus atomorum ut, ad tation feugiat impedit per.</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="comment">
                                        <div class="avatar"><img alt="" src="/images/review/avatar_1.png" class="avatar"></div>
                                        <div class="comment-container">
                                            <h4 class="comment-author"><a href="#">John Smith</a></span></h4>
                                            <div class="comment-meta"><a href="#" class="comment-date link-style1">February 07, 2015</a><a class="comment-reply-link link-style3" href="#respond">Reply &raquo;</a></div>
                                            <div class="comment-body">
                                                <p>Eu mea harum soleat albucius. At duo nihil saperet inimicus. Ne quo dicit offendit eloquenam. Ut intellegam inn theophras tus mea. Vide ceteros mediocritatem est in, utamur gubergren contentiones.</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="comment">
                                        <div class="avatar"><img alt="" src="/images/review/avatar_3.png" class="avatar"></div>
                                        <div class="comment-container">
                                            <h4 class="comment-author"><a href="#">Thomas Smith</a></span></h4>
                                            <div class="comment-meta"><a href="#" class="comment-date link-style1">February 02, 2015</a><a class="comment-reply-link link-style3" href="#respond">Reply &raquo;</a></div>
                                            <div class="comment-body">
                                                <p>Quodsi eirmod salutandi usu ei, ei mazim facete mel. Deleniti interesset at sed, sea ei malis expetenda. Ei efficiat integebat mel, vis alii insoles te. Vis ex bonorum contentiones. An cum possit reformidans. Est at eripuit theophrastus. Scripta imper diet ad nec, everti contentiones id eam, an eum causae officiis.</p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- /#comments -->
                            <div class="dividerHeading">
                                <h4><span>Leave a comment</span></h4>
                                </div>

                            <div class="comment_form">
                               <div class="row">
                                   <div class="col-sm-4">
                                       <input class="col-lg-4 col-md-4 form-control" name="name" type="text" id="name" size="30"  onfocus="if(this.value == 'Name') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Name'; }" value="Name" placeholder="Name" >
                                   </div>
                                   <div class="col-sm-4">
                                       <input class="col-lg-4 col-md-4 form-control" name="email" type="text" id="email" size="30" onfocus="if(this.value == 'E-mail') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'E-mail'; }" value="E-mail" placeholder="E-mail">
                                   </div>
                                   <div class="col-sm-4">
                                       <input class="col-lg-4 col-md-4 form-control" name="url" type="text" id="url" size="30" onfocus="if(this.value == 'Url') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Url'; }" value="Url" placeholder="Url">
                                   </div>
                               </div>
                            </div>
                            <div class="comment-box row">
                                <div class="col-sm-12">
                                    <p>
                                        <textarea name="comments" class="form-control" rows="6" cols="40" id="comments" onfocus="if(this.value == 'Message') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Message'; }" placeholder="Message">Message</textarea>
                                    </p>
                                </div>
                            </div>

                            <a class="btn btn-lg btn-default" href="#">Post Comment</a>
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
                                    <li class="last-tab"><a href="#Comment" data-toggle="tab"><i class="fa fa-tint"></i>&nbsp;成份</a></li> 
                                </ul>

                                <div class="tab-content clearfix">
                                    <div class="tab-pane fade active in" id="Popular">
                                        <ul class="recent_tab_list">
                                            <li>
                                                <span><a href="#"><img class="product-image" src="/products/show?prodImg=${review.product.prodImg}" alt="product-image" /></a></span>
<!--                                                 <a href="#">Publishing packag esanse web page editos</a> -->
                                                <p><span>Brand :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${review.product.brand.brandName}</p>
                                                <p><span>Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${review.product.prodName}</p>
                                                <p><span>Category :</span>${review.product.category.categoryName}</p>
                                                <p><span class="product-score">Score :</span></p>
                                             
<!--                                                 <i>October 09, 2015</i> -->
                                            </li>
                                        </ul>
                                    </div>
                                    
                                    <div class="tab-pane fade" id="Recent">
                                        <ul class="recent_tab_list">
                                            <li>
                                                <span><a href="#"><img src="/images/review/recent_4.png" alt="" /></a></span>
                                                <a href="#">Various versions has evolved over the years</a>
                                                <i>October 18, 2015</i>
                                            </li>
											<li><span>Ingredient :</span> <a href="#">${product.mainIgdt}</a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade">
                                        <ul class="comments">
                                            <li class="comments_list clearfix">
                                                <a class="post-thumbnail" href="#"><img width="60" height="60" src="/images/review/recent_3.png" alt="#"></a>
                                                <p><strong><a href="#">Prambose</a> <i>says: </i> </strong> Morbi augue velit, tempus mattis dignissim nec, porta sed risus. Donec eget magna eu lorem tristique pellentesque eget eu dui. Fusce lacinia tempor malesuada.</p>
                                            </li>
                                            <li class="comments_list clearfix">
                                                <a class="post-thumbnail" href="#"><img width="60" height="60" src="/images/review/recent_1.png" alt="#"></a>
                                                <p><strong><a href="#">Makaroni</a> <i>says: </i> </strong> Tempus mattis dignissim nec, porta sed risus. Donec eget magna eu lorem tristique pellentesque eget eu dui. Fusce lacinia tempor malesuada.</p>
                                            </li>
                                            <li class="comments_list clearfix">
                                                <a class="post-thumbnail" href="#"><img width="60" height="60" src="/images/review/recent_2.png" alt="#"></a>
                                                <p><strong><a href="#">Prambanan</a> <i>says: </i> </strong> Donec convallis, metus nec tempus aliquet, nunc metus adipiscing leo, a lobortis nisi dui ut odio. Nullam ultrices, eros accumsan vulputate faucibus, turpis tortor.</p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
							
                            <div class="widget widget_tags">
                                <div class="widget_title">
                                    <h4><span>Tags Widget</span></h4>
                                </div>
                                <ul class="tags">
                                    <li><a href="#"><b>business</b></a></li>
                                    <li><a href="#">corporate</a></li>
                                    <li><a href="#">css3</a></li>
                                    <li><a href="#"><b>html5</b></a></li>
                                    <li><a href="#">javascript</a></li>
                                    <li><a href="#"><b>jquery</b></a></li>
                                    <li><a href="#">multipurpose</a></li>
                                    <li><a href="#"><b>mysql</b></a></li>
                                    <li><a href="#">portfolio</a></li>
                                    <li><a href="#">premium</a></li>
                                    <li><a href="#">responsive</a></li>
                                    <li><a href="#"><b>theme</b></a></li>
                                    <li><a href="#"><b>jQuery Rain</b></a></li>
                                </ul>
                            </div>
                            

                        </div>
                    </div>
                </div><!--/.row-->
        </section>

    <!--start footer-->

    <!--end footer-->
<!-- </section> -->
<!--end wrapper-->
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
<script type="text/javascript">
console.log("")
console.log("123")
$(function () {  //=$(document.)ready
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
});


</script>

</body>
</html>