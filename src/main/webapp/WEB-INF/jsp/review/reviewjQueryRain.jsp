<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="/css/review/style.css" rel="stylesheet" >
	<link href="/css/review/reviewjQueryRain-customize.css" rel="stylesheet">
	
	<script src="/js/jquery.min.js"></script>
</head> 
<body>
<!--start wrapper-->
<section class="wrapper container">
    <!--Start Header-->

    <!--End Header-->

        <section id="page_head" class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
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

		<div class="page_title">
			<h2>Blog Post</h2>
			<span class="sub_heading">Our Blog Sub Title</span>
		</div>
		<nav id="breadcrumbs">
		<ul>
			<li>You are here:</li>
			<li><a href="index.html">Home</a></li>
			<li>Blog</li>
		</ul>
		</nav>
	</div>
	</section>
        
        <section class="content blog">
                <div class="row">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                        <div class="blog_single">
                            <article class="post">
                                <figure class="post_img">
                                    <img class="reviewImg" src="/reviews/show?reviewId=${review.reviewId}" alt="reviewImg">
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
                                            <span><a href="#"><i class="fa fa-user"></i> By Louis</a> </span> <!--抓會員暱稱 -->                          
                                            <span><i class="fa fa-comments"></i> <a href="#">12 Comments</a></span> <!--做html的boookmark -->
                                            <span><i class="fa fa-tag"></i> <a href="#">Emin</a>, <a href="#">News</a> </span>
                                        <!--心得評分 end-->
											<span class="review-uc-diamond">
												<span class="urcosme-score-display">
													<span class=" fa fa-diamond diamond" id="tb${review.reviewId}diamond1"></span>
													<span class=" fa fa-diamond diamond" id="tb${review.reviewId}diamond2"></span>
													<span class=" fa fa-diamond diamond" id="tb${review.reviewId}diamond3"></span>
													<span class=" fa fa-diamond diamond" id="tb${review.reviewId}diamond4"></span>
													<span class=" fa fa-diamond diamond" id="tb${review.reviewId}diamond5"></span>						
													<script type="text/javascript">
														$(function(){
															for(var i=0;i<"${review.reviewRating}";i++){
																$("#tb${review.reviewId}diamond"+(i+1)).css('color','#FF5151');
															}
														});
													</script>
												</span>&nbsp;<span name="review-rating" class="review-rating">${review.reviewRating}分</span>  
											</span>
											<!--心得評分  end -->
                                        
                                        
                                        </div>
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adip, sed do eiusmod tempor incididunt  ut aut reiciendise voluptat maiores alias consequaturs aut perferendis doloribus asperiores ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                    
                                    <blockquote class="default">
                                        Nulla nunc dui, tristique in semper vel, congue sed ligula. Nam dolor ligula, faucibus id sodales in, auctor fringilla libero. Pellentesque pellentesque eget tempor tellus. Fusce lacinia tempor malesuada. Ut lacus sapien, placerat a ornare nec, elementum sit amet felis. Maecenas pretium lorem hendrerit eros sagittis fermentum.
                                    </blockquote>
                                    
                                    <p>Morbi augue velit, tempus mattis dignissim nec, porta sed risus. Donec eget magna eu lorem tristique pellentesque eget eu dui. Fusce lacinia tempor malesuada. Ut lacus sapien, placerat a ornare nec, elementum sit amet felis. Maecenas pretium hendrerit fermentum. Fusce lacinia tempor malesuada. Ut lacus sapien, placerat a ornare nec, elementum sit amet felis. Maecenas pretium lorem hendrerit eros sagittis fermentum.</p>
                                    
                                    <p>Donec in ut odio libero, at vulputate urna. Nulla tristique mi a massa convallis cursus. Nulla eu mi magna. Etiam suscipit commodo gravida. Cras suscipit, quam vitae adipiscing faucibus, risus nibh laoreet odio, a porttitor metus eros ut enim. Morbi augue velit, tempus mattis dignissim nec, porta sed risus. Donec eget magna eu lorem tristique pellentesque eget eu duiport titor metus eros ut enim. </p>
                                </div>
                                <ul class="shares">
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
                                    <img src="/images/review/author.png" alt="about author">
                                    <ul class="author_social">
                                        <li><a class="fb" href="#." data-placement="top" data-toggle="tooltip" title="Facbook"><i class="fa fa-facebook"></i></a></li>
                                        <li><a class="twtr" href="#." data-placement="top" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                        <li><a class="skype" href="#." data-placement="top" data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
                                    </ul>
                                </div>
                                <div class="author_bio">
                                    <h3 class="author_name"><a href="#">Tom Jobs</a></h3>
                                    <h5>CEO at <a href="#">jQuery Rain</a></h5>
                                    <p class="author_det">
                                        Lorem ipsum dolor sit amet, consectetur adip, sed do eiusmod tempor incididunt  ut aut reiciendise voluptat maiores alias consequaturs aut perferendis doloribus omnis saperet docendi nec, eos ea alii molestiae aliquand.
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--News Comments-->
                        <div class="news_comments">
                            <div class="dividerHeading">
                                <h4><span>Comments (6)</span></h4>
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
                        <div class="sidebar" >

                            
                            <div class="widget widget_categories">
                                <div class="widget_title">
                                    <h4><span>Categories</span></h4>
                                    </div>
                                <ul class="arrows_list list_style">
                                    <li><a href="#"> Grapic Design (10)</a></li>
                                    <li><a href="#"> Web Design & Development (25)</a></li>
                                    <li><a href="#"> Photography (29)</a></li>
                                    <li><a href="#"> Custom Illustrations (19)</a></li>
                                    <li><a href="#"> Wordpress Themes(38)</a></li>
                                    <li><a href="#"> Videography (33)</a></li>
                                </ul>
                            </div>
                            
                            <div class="widget widget_about">
                                <div class="widget_title">
                                    <h4><span>Basic Text Widget</span></h4>
                                    </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adip, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            </div>

                            <div class="velocity-tab sidebar-tab">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#Popular" data-toggle="tab">Popular</a></li>
                                    <li class=""><a href="#Recent" data-toggle="tab">Recent</a></li>
                                    <li class="last-tab"><a href="#Comment" data-toggle="tab"><i class="fa fa-comments-o"></i></a></li>
                                </ul>

                                <div class="tab-content clearfix">
                                    <div class="tab-pane fade active in" id="Popular">
                                        <ul class="recent_tab_list">
                                            <li>
                                                <span><a href="#"><img src="/images/review/recent_1.png" alt="" /></a></span>
                                                <a href="#">Publishing packag esanse web page editos</a>
                                                <i>October 09, 2015</i>
                                            </li>
                                            <li>
                                                <span><a href="#"><img src="/images/review/recent_2.png" alt="" /></a></span>
                                                <a href="#">Sublishing packag esanse web page editos</a>
                                                <i>October 08, 2015</i>
                                            </li>
                                            <li class="last-tab">
                                                <span><a href="#"><img src="/images/review/recent_3.png" alt="" /></a></span>
                                                <a href="#">Mublishing packag esanse web page editos</a>
                                                <i>October 07, 2015</i>
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
                                            <li>
                                                <span><a href="#"><img src="/images/review/recent_5.png" alt="" /></a></span>
                                                <a href="#">Rarious versions has evolve over the years</a>
                                                <i>October 17, 2015</i>
                                            </li>
                                            <li class="last-tab">
                                                <span><a href="#"><img src="/images/review/recent_6.png" alt="" /></a></span>
                                                <a href="#">Marious versions has evolven over the years</a>
                                                <i>October 16, 2015</i>
                                            </li>
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

    <section class="footer_bottom row">
        <div class="col-sm-6">
            <p class="copyright">&copy; Copyright 2015 Fortune | Powered by  <a href="http://www.jqueryrain.com/">jQuery Rain</a></p>
        </div>

        <div class="col-sm-6 ">
            <div class="footer_social">
                <ul class="footbot_social">
                    <li><a class="fb" href="#." data-placement="top" data-toggle="tooltip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                    <li><a class="twtr" href="#." data-placement="top" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                    <li><a class="dribbble" href="#." data-placement="top" data-toggle="tooltip" title="Dribbble"><i class="fa fa-dribbble"></i></a></li>
                    <li><a class="skype" href="#." data-placement="top" data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
                    <li><a class="rss" href="#." data-placement="top" data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a></li>
                </ul>
            </div>
        </div>
    </section>
</section>
<!--end wrapper-->

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

    <script src="/js/review/main.js"></script>




</body>
</html>