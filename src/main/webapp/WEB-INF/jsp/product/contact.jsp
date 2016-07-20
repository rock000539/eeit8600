<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link href="/css/product/contact.css" rel="stylesheet" />
	
	<!-- GoogleMap -->
	<script type="text/javascript" src="/js/product/contact/jquery.gmap.js"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ContactPage</title>

</head>
<body>

	<!--加入header&nav -->
	<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
	<!-- **每頁不同的內容從這裡開始** -->
	<div class="grey_bg row">
	
		<section class="content contact">
		
	        <div class="row">
	        	<div class="col-sm-1"></div>
	            <div class="col-sm-10">
	                <div class="maps">
	                    <div id="page_maps"></div>
	                </div>
	            </div>
	            <div class="col-sm-1"></div>
	        </div>
	
	        <div class="row sub_content">
	        	<div class="col-lg-1 col-md-1 col-sm-1"></div>
	        	
	            <div class="col-lg-7 col-md-7 col-sm-7">
	                <div class="dividerHeading">
	                    <h4><span>Get in Touch</span></h4>
	                </div>
	                <p>Send us an email, using the form below or at eeit8600@gmail.com</p>
	
	                <div class="alert alert-success hidden alert-dismissable" id="contactSuccess">
	                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                  <strong>Success!</strong> Your message has been sent to us.
	                </div>
	
	                <div class="alert alert-error hidden" id="contactError">
	                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                  <strong>Error!</strong> There was an error sending your message.
	                </div>
	
	                <form id="contactForm" action="" novalidate="novalidate">
	                    <div class="row">
	                        <div class="form-group">
	                            <div class="col-lg-6 ">
	                                <input type="text" id="name" name="name" class="form-control" maxlength="100" data-msg-required="Please enter your name." value="" placeholder="Your Name" >
	                            </div>
	                            <div class="col-lg-6 ">
	                                <input type="email" id="email" name="email" class="form-control" maxlength="100" data-msg-email="Please enter a valid email address." data-msg-required="Please enter your email address." value="" placeholder="Your E-mail" >
	                            </div>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="form-group">
	                            <div class="col-md-12">
	                                <input type="text" id="subject" name="subject" class="form-control" maxlength="100" data-msg-required="Please enter the subject." value="" placeholder="Subject">
	                            </div>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="form-group">
	                            <div class="col-md-12">
	                                <textarea id="message" class="form-control" name="message" rows="5" cols="50" data-msg-required="Please enter your message." maxlength="5000" placeholder="Message" style="resize: none"></textarea>
	
	                            </div>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-md-12">
	                            <input type="submit" data-loading-text="Loading..." class="btn btn-default btn-lg" value="Send Message" style="float:right;">
	                        </div>
	                    </div>
	                </form>
	            </div>
	
	            <div class="col-lg-3 col-md-3 col-sm-3">
	                <div class="sidebar">
	                    <div class="widget_info">
	                        <div class="dividerHeading">
	                            <h4><span>Contact Info</span></h4>
	                            </div>
	                        <p>Welcome to contact us through the following methods.</p>
	                        <ul class="widget_info_contact">
	                            <li><i class="fa fa-map-marker"></i> <p><strong>Address</strong>: &nbsp;台北市復興南路一段390號</p></li>
	                            <li><i class="fa fa-user"></i> <p><strong>Phone</strong>: &nbsp;(02) 2782-3590</p></li>
	                            <li><i class="fa fa-envelope"></i> <p><strong>Email</strong>: &nbsp;eeit86@gmail.com</p></li>
	                            <li><i class="fa fa-globe"></i> <p><strong>Web</strong>: <a href="#" data-placement="bottom" data-toggle="tooltip" title="www.example.com"> &nbsp;www.quite.com</a></p></li>
	                        </ul>
	
	                    </div>
	
	                    <div class="widget_social" style="margin-top:10px;">
	                        <div class="dividerHeading">
	                            <h4><span>Get Social</span></h4>
	                        </div>
	                        <ul class="widget_social">
	                            <li><a class="fb" href="https://goo.gl/SxtMoa" data-placement="bottom" data-toggle="tooltip" title="Facbook"><i class="fa fa-facebook"></i></a></li>
	                            <li><a class="twtr" href="https://goo.gl/KNu041" data-placement="bottom" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
	                            <li><a class="gmail" href="https://goo.gl/R9FgQ" data-placement="bottom" data-toggle="tooltip" title="Google"><i class="fa fa-google-plus"></i></a></li>
	                            <li><a class="instagram" href="https://goo.gl/i1BIfW" data-placement="bottom" data-toggle="tooltip" title="Instagram"><i class="fa fa-instagram"></i></a></li>
	                            <li><a class="youtube" href="https://goo.gl/Smbxk8" data-placement="bottom" data-toggle="tooltip" title="Youtube"><i class="fa fa-youtube"></i></a></li>
	                            <li><a class="flickrs" href="#." data-placement="bottom" data-toggle="tooltip" title="Flickr"><i class="fa fa-flickr"></i></a></li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            
	            <div class="col-lg-1 col-md-1 col-sm-1"></div>
	        </div>
	    </section>

		<!--start footer-->
	    <footer class="footer row" style="width:1170px; margin-left:0.01%;">
	    	
	    
	        <div class="col-lg-3 col-md-3 col-sm-6">
	            <div class="widget_title">
	                <h4><span>About Us</span></h4>
	            </div>
	            <div class="widget_content">
	                <p>Donec earum rerum hic tenetur ans sapiente delectus, ut aut reiciendise voluptat maiores alias consequaturs aut perferendis doloribus asperiores.</p>
	                <ul class="contact-details-alt">
	                    <li><i class="fa fa-map-marker"></i> <p><strong>Address</strong>: #2021 Lorem Ipsum</p></li>
	                    <li><i class="fa fa-user"></i> <p><strong>Phone</strong>:(+91) 9000-12345</p></li>
	                    <li><i class="fa fa-envelope"></i> <p><strong>Email</strong>: <a href="#">mail@example.com</a></p></li>
	                </ul>
	            </div>
	        </div>
	        <div class="col-lg-3 col-md-3 col-sm-6">
	            <div class="widget_title">
	                <h4><span>Recent Posts</span></h4>
	            </div>
	            <div class="widget_content">
	                <ul class="links">
	                    <li> <a href="#">Aenean commodo ligula eget dolor<span>November 07, 2015</span></a></li>
	                    <li> <a href="#">Temporibus autem quibusdam <span>November 05, 2015</span></a></li>
	                    <li> <a href="#">Debitis aut rerum saepe <span>November 03, 2015</span></a></li>
	                    <li> <a href="#">Et voluptates repudiandae <span>November 02, 2015</span></a></li>
	                </ul>
	            </div>
	        </div>
	        <div class="col-lg-3 col-md-3 col-sm-6">
	            <div class="widget_title">
	                <h4><span>Twitter</span></h4>
	
	            </div>
	            <div class="widget_content">
	                <ul class="tweet_list">
	                    <li class="tweet_content item">
	                        <p class="tweet_link"><a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur adipiscing eli</p>
	                        <span class="time">29 September 2015</span>
	                    </li>
	                    <li class="tweet_content item">
	                        <p class="tweet_link"><a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur adipiscing eli</p>
	                        <span class="time">29 September 2015</span>
	                    </li>
	                    <li class="tweet_content item">
	                        <p class="tweet_link"><a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur adipiscing eli</p>
	                        <span class="time">29 September 2015</span>
	                    </li>
	                </ul>
	            </div>
	            <div class="widget_content">
	                <div class="tweet_go"></div>
	            </div>
	        </div>
	        <div class="col-lg-3 col-md-3 col-sm-6">
	            <div class="widget_title">
	                <h4><span>Flickr Gallery</span></h4>
	            </div>
	            <div class="widget_content">
	                <div class="flickr">
	                    <ul id="flickrFeed" class="flickr-feed"></ul>
	                </div>
	            </div>
	        </div>


	    </footer>
	    <!--end footer-->
	    
	</div>        
    <!-- **每頁不同的內容結束** -->

	<!--加入footer -->
	<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
	
	<!-- Header & Footer -->
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>

</body>
</html>