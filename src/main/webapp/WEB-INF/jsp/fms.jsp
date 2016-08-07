<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="en" xmlns="http://www.w3.org/1999/html"> <!--<![endif]-->
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Qutie</title>
    <meta name="description" content="">

    <!-- CSS FILES -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    
	<!-- fractionslider -->
    <link rel="stylesheet" href="/css/fms/fractionslider.css"/>
    <link rel="stylesheet" href="/css/fms/style-fraction.css"/>
    
    <link rel="stylesheet" href="/css/fms/fms-customize_index.css">
    
<!--     <link rel="stylesheet" href="/css/member-post.css" type="text/css" media="all"> -->

</head>
<body>
<!--start wrapper-->
<!-- <section class="wrapper container"> -->

<!--Start Header-->
<c:import url="/WEB-INF/jsp/fms_header_nav_index.jsp" />
<!--End Header-->

<div class="slider-wrapper row">
    <div class="slider">
        <div class="fs_loader"></div>

<!-- slide1 -->
<!--         <div class="slide"> -->
<!--             <img src="/images/fms/fraction-slider/base.jpg" width="1170" height="auto" data-in="top" data-out="fade" data-delay=""/> -->
<!--             <img src="/images/fms/fraction-slider/jmnashi.jpg" width="380" height="252" data-position="60,650" data-in="right" data-out="left" data-delay="1500"/> -->

<!--             <p class="slide-1" data-position="100,170" data-in="top" data-out="bottom" data-delay="2500">premium layer slider use</p> -->
<!--             <p class="slide-1 a " data-position="145,170" data-in="right" data-out="left" data-delay="2900">come in 40 colors</p> -->
<!--             <p class="slide-1 " data-position="190,170" data-in="left" data-out="right" data-delay="3300">Easy to use and customize </p> -->
<!--             <p class="slide-1 a" data-position="235,170" data-in="bottom" data-out="top" data-delay="3700">super clean and responsive design </p> -->
<!--         </div> -->

<!-- slide2 -->
        <div class="slide">
            <img src="/images/fms/fraction-slider/pauljoe.jpg" width="1170" height="auto" data-in="top" data-out="fade"/>

            <p class="slide-2 " data-position="50,50" data-in="top" data-out="top" data-delay="1000"><s:message code="slide2title"></s:message></p>

            <img src="/images/fms/fraction-slider/pjcatlip1.png" width="50" height="auto" data-position="150,200" data-in="right" data-out="left" data-delay="1500" />
            <img src="/images/fms/fraction-slider/pjcatlip2.png" width="50" height="auto" data-position="110,240" data-in="right" data-out="left" data-delay="1600" />
            <img src="/images/fms/fraction-slider/pjcatlip3.png" width="50" height="auto" data-position="170,280" data-in="right" data-out="left" data-delay="1700" />
            <img src="/images/fms/fraction-slider/pjcatlip2.png" width="50" height="auto" data-position="170,160" data-in="right" data-out="left" data-delay="1900" />
            <img src="/images/fms/fraction-slider/pjcatlip1.png" width="50" height="auto" data-position="110,120" data-in="right" data-out="left" data-delay="2100" />
            <img src="/images/fms/fraction-slider/pjcatlip2.png" width="50" height="auto" data-position="150,80" data-in="right" data-out="left" data-delay="1800" />
            <img src="/images/fms/fraction-slider/pjcatlip3.png" width="50" height="auto" data-position="170,40" data-in="right" data-out="left" data-delay="2000" />

            <img src="/images/fms/fraction-slider/pjcat1.png" width="65" height="auto" data-position="200,390" data-in="top" data-out="bottom" data-delay="2000" data-ease-in="easeOutBack"/>
            <p class="slide-2icon-a " data-position="270,350" data-in="top" data-out="bottom" data-delay="2000" data-ease-in="easeOutBack">001 Catamaran</p>
            <img src="/images/fms/fraction-slider/pjcat2.png" width="65" height="auto" data-position="100,500" data-in="bottom" data-out="top" data-delay="2600" data-ease-in="easeOutBack"/>
            <p class="slide-2icon-a " data-position="170,440" data-in="bottom" data-out="top" data-delay="2300" data-ease-in="easeOutBack">002 Smooth Sailing</p>
            <img src="/images/fms/fraction-slider/pjcat3.png" width="65" height="auto" data-position="230,570" data-in="top" data-out="bottom" data-delay="2300" data-ease-in="easeOutBack"/>
            <p class="slide-2icon-a " data-position="300,555" data-in="top" data-out="bottom" data-delay="2600" data-ease-in="easeOutBack">003 Ahoy!</p>
        </div>

<!-- slide3 -->
        <div class="slide">
            <img src="/images/fms/fraction-slider/base_3.jpg" data-in="fade" data-0ut="fade" width="1170" height="auto">

            <img src="/images/fms/fraction-slider/jmnashi.jpg" width="541" height="355" data-position="0,550" data-in="right" data-out="left" data-delay="20">
            <img src="/images/fms/fraction-slider/top-note-lemon.jpg" width="160" height="80" data-position="275,70" data-in="left" data-out="right" data-delay="1000">
            <img src="/images/fms/fraction-slider/heart-note-nashi-blossom.jpg" width="160" height="80" data-position="275,230" data-in="top" data-out="bottom" data-delay="1500">
            <img src="/images/fms/fraction-slider/base-note-white-musk.jpg" width="160" height="80" data-position="275,390" data-in="right" data-out="left" data-delay="1600">

            <p class="style heading" data-position="50,180" data-in="top" data-out="top" data-delay="2000" data-ease-in="easeOutBounce"><s:message code="tastingnotes"></s:message></p>

            <p class="list" data-position="120,210" data-in="right" data-out="left" data-delay="2100"><s:message code="topnote"></s:message></p>
            <p class="list" data-position="150,210" data-in="right" data-out="right" data-delay="3000"><s:message code="heartnote"></s:message></p>
            <p class="list" data-position="180,210" data-in="right" data-out="left" data-delay="3900"><s:message code="basenote"></s:message></p>
            

            <p class=" icon" data-position="120,180" data-in="top" data-out="bottom" data-delay="1100" data-ease-in="easeOutBounce"><i class="fa fa-check"></i></p>
            <p class=" icon" data-position="150,180" data-in="top" data-out="bottom" data-delay="1200" data-ease-in="easeOutBounce"><i class="fa fa-check"></i></p>
            <p class=" icon" data-position="180,180" data-in="top" data-out="bottom" data-delay="1300" data-ease-in="easeOutBounce"><i class="fa fa-check"></i></p>
 
            <a class="slider-read" data-position="210,180" data-in="bottom" data-out="bottom" data-ease-in="easeOutBounce" data-delay="2000"><s:message code="checknow"></s:message></a>
        </div>
    </div>
</div>
<!--End Slider-->

        <!-- <section class="info_service"> -->
        <div class="row sub_content">
            <div class="col-md-3 col-sm-6">
                <div class="serviceBox_2 green">
                    <div class="service-icon">
                        <i class="fa fa-rocket"></i>
                    </div>
                    <div class="service-content">
                        <h3>Quick</h3>
                        <p><s:message code="quickly"></s:message></p>
<!--                         <div class="read"> -->
<!--                             <a href="">Read more</a> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="serviceBox_2 purple">
                    <div class="service-icon">
                        <i class="fa fa-globe"></i>
                    </div>
                    <div class="service-content">
                        <h3>Query</h3>
                        <p><s:message code="query"></s:message></p>
<!--                         <div class="read"> -->
<!--                             <a href="">Read more</a> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="serviceBox_2 red">
                    <div class="service-icon">
                        <i class="fa fa-user-md"></i>
                    </div>
                    <div class="service-content">
                        <h3>Quality</h3>
                        <p><s:message code="quality"></s:message></p>
<!--                         <div class="read"> -->
<!--                             <a href="">Read more</a> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="serviceBox_2 blue">
                    <div class="service-icon">
                        <i class="fa fa-question-circle"></i>
                    </div>
                    <div class="service-content">
                        <h3>Question</h3>
                        <p><s:message code="question"></s:message></p>
<!--                         <div class="read"> -->
<!--                             <a href="">Read more</a> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
        </div>
    <!-- </section> -->

    <!-- <div class="grey_bg pdt-70 row"> -->
        <!-- <div class="col-sm-5 feature-block">
            <img class="img-responsive center-block" src="images/laptop.png"/>
        </div>

        <div class="col-sm-7 feature-block ">
            <h4>Clean, Professional <span>and Modern Design</span></h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam earum enim est natus nulla odio perferendis totam. A eaque,  consectetur adipisicing elit. Aliquam earum enim est natus nulla odio  consectetur adipisicing elit. Aliquam earum enim est natus nulla odio nesciunt. Autem cum distinctio eligendi impedit mollitia officia perferendis praesentium tempore veniam voluptas. Assumenda fuga laboriosam modi perspiciatis possimus rem suscipit. Adipisci, eos exercitationem molestiae nesciunt quaerat ullam veniam vitae voluptatum.
            </p>
            <a class="btn btn-default mrgb-20" href="">Read More</a>
        </div> -->
    <!-- </div> -->

    <!-- <div class="grey-transparent-content row">
        <div class="col-md-8 same-height sub_content clearfix">
            <div class="col-sm-6">
                <div class="serviceBox_8">
                    <div class="service-icon">
                        <i class="fa fa-pencil"></i>
                    </div>
                    <div class="service-content">
                        <h3>Clean &amp; Minimal</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a feugiat ligula, in efficitur ligula. Duis interdum velit orci, tempor facilisis magna.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="serviceBox_8">
                    <div class="service-icon">
                        <i class="fa fa-diamond"></i>
                    </div>
                    <div class="service-content">
                        <h3>Branding Theme</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a feugiat ligula, in efficitur ligula. Duis interdum velit orci, tempor facilisis magna. </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="serviceBox_8">
                    <div class="service-icon">
                        <i class="fa fa-anchor"></i>
                    </div>
                    <div class="service-content">
                        <h3>Modern Design</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a feugiat ligula, in efficitur ligula. Duis interdum velit orci, tempor facilisis magna. </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="serviceBox_8">
                    <div class="service-icon">
                        <i class="fa fa-gears"></i>
                    </div>
                    <div class="service-content">
                        <h3>Quick Support</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a feugiat ligula, in efficitur ligula. Duis interdum velit orci, tempor facilisis magna. </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 same-height hidden-sm hidden-xs text-center retro">
            <div class="heading-item">
                <h4>
                    Ullam Corporis Suscipit </h4>
                <p>
                    Nemo enim ipsam voluptatem quia voluptas sit aspernatur<br>
                    aut odit aut fugit, sed quia consequuntur
                </p>
                <a class="btn btn-default btn-lg" href="">Get a free Quote</a>
                <em>or give us call
                    <strong>
                        +23-4321-12323
                    </strong>
                </em>
            </div>
        </div>
    </div> -->


    <!-- <section class="feature-block row super_sub_content">
        <div class="col-lg-6 wow fadeInLeft">
            <div class="text-center">
                <img src="images/mobile-1.png" alt=""/>
            </div>
        </div>

        <div class="col-lg-6 fadeInRight">
            <h4>Responsive Designs</h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae cum dolore fugit impedit nisi, quasi saepe temporibus velit! Debitis, nihil velit? A accusantium adipisci aliquam amet aperiam aut consequuntur dolore ducimus eaque eius est eveniet fugiat maxime molestias natus necessitatibus quae sapiente suscipit tenetur veniam vero, voluptate voluptatum! At, quia!</p>
            <hr>
            <i class="fa fa-apple"></i>
            <i class="fa fa-windows"></i>
            <i class="fa fa-clock-o"></i>
            <i class="fa fa-android"></i>
            <i class="fa fa-paperclip"></i>
            <i class="fa fa-skype"></i>
            <hr>
            <a href="" class="btn btn-default btn-md">Read more</a>&nbsp;
            <a href="" class="btn btn-default btn-md">Purchase Now</a>
        </div>
    </section> -->

    <!-- <div class="grey_bg row sub_content">
        <div class="col-lg-3 col-md-4 col-sm-6 text-center">
            <span class="circular-chart-big" data-percent="94">
                <span class="percent"></span>
            </span>
            <h5 class="circular-title">WebDesign</h5>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 text-center">
            <span class="circular-chart-big" data-percent="87">
                <span class="percent"></span>
            </span>
            <h5 class="circular-title">Graphic Design</h5>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 text-center">
            <span class="circular-chart-big" data-percent="77">
                <span class="percent"></span>
            </span>
            <h5 class="circular-title">Mobile Applications</h5>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 text-center">
            <span class="circular-chart-big" data-percent="82">
                <span class="percent"></span>
            </span>
            <h5 class="circular-title">Search Engine Optimization</h5>
        </div>
    </div> -->

<!--     <div class="progress-bar-acc row super_sub_content">
        <div class="col-lg-6 ">
            <ul class="progress-skill-bar mrg-0">
                <li>
                    <span class="lable">70%</span>
                    <div class="progress_skill">
                        <div data-height="100" role="progressbar" data-value="70" class="bar" style="width: 0px; height: 0px;">
                            HTML
                        </div>
                    </div>
                </li>
                <li>
                    <span class="lable">80%</span>
                    <div class="progress_skill">
                        <div data-height="100" role="progressbar" data-value="80" class="bar" style="width: 0px; height: 0px;">
                            CSS
                        </div>
                    </div>
                </li>
                <li>
                    <span class="lable">90%</span>
                    <div class="progress_skill">
                        <div data-height="100" role="progressbar" data-value="90" class="bar" style="width: 0px; height: 0px;">
                            JavaScript
                        </div>
                    </div>
                </li>
                <li>
                    <span class="lable">80%</span>
                    <div class="progress_skill">
                        <div data-height="100" role="progressbar" data-value="80" class="bar" style="width: 0px; height: 0px;">
                            MySQL
                        </div>
                    </div>
                </li>
                <li>
                    <span class="lable">70%</span>
                    <div class="progress_skill">
                        <div data-height="100" role="progressbar" data-value="70" class="bar" style="width: 0px; height: 0px;">
                            PHP
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="col-lg-6">
            <div class="panel-group accordion" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading button_outer_rounded" role="tab" id="heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="true" aria-controls="collapseOne">
                                Stunning Design & Countless Options
                            </a>
                        </h4>
                    </div>
                    <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading">
                        <div class="panel-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus congue lorem ut augue aliquam, ut rutrum nulla eleifend. Nunc aliquam suscipit leo, in mattis massa ullamcorper sed. Pellentesque dictum erat at eros egestas, vel convallis nibh pharetra. Class aptent taciti sociosqu ad litora torquent.
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading button_outer_rounded" role="tab" id="heading1">
                        <h4 class="panel-title">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false" aria-controls="collapseTwo">
                                Tons of customization options
                            </a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading1">
                        <div class="panel-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus congue lorem ut augue aliquam, ut rutrum nulla eleifend. Nunc aliquam suscipit leo, in mattis massa ullamcorper sed. Pellentesque dictum erat at eros egestas, vel convallis nibh pharetra. Class aptent taciti sociosqu ad litora torquent.
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading button_outer_rounded" role="tab" id="heading2">
                        <h4 class="panel-title">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false" aria-controls="collapseThree">
                                Ease of Content creation and modification
                            </a>
                        </h4>
                    </div>
                    <div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading2">
                        <div class="panel-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus congue lorem ut augue aliquam, ut rutrum nulla eleifend. Nunc aliquam suscipit leo, in mattis massa ullamcorper sed. Pellentesque dictum erat at eros egestas, vel convallis nibh pharetra. Class aptent taciti sociosqu ad litora torquent.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->

<!-- Parallax with Testimonial -->
    <!-- <section class="parallax parallax-1 row"> -->
        <!--<h2 class="center">Testimonials</h2>-->
        <!-- <div class="col-sm-12">
            <div id="parallax-testimonial-carousel" class="parallax-testimonial carousel  wow fadeInDown">
                <div class="carousel-inner">
                    <div class="active item">
                        <div class="parallax-testimonial-item">
                            <blockquote>
                                <p>Donec convallis, metus nec tempus aliquet, nunc metus adipiscing leo, a lobortis nisi dui ut odio. Nullam ultrices, eros accumsan vulputate faucibus, turpis tortor dictum.</p>
                            </blockquote>
                            <p>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </p>
                            <div class="parallax-testimonial-review">
                                <img src="images/testimonials/1.png" alt="testimonial">
                                <span>Jonathan Dower</span>
                                <small>Company Inc.</small>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="parallax-testimonial-item">
                            <blockquote>
                                <p>Metus aliquet tincidunt metus, sit amet mattis lectus sodales ac. Suspendisse rhoncus dictum eros, ut egestas eros luctus eget. Nam nibh sem, mattis et feugiat ut, porttitor nec risus.</p>
                            </blockquote>
                            <p>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </p>
                            <div class="parallax-testimonial-review">
                                <img src="images/testimonials/2.png" alt="testimonial">
                                <span>Jonathan Dower</span>
                                <small>Leopard</small>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="parallax-testimonial-item">
                            <blockquote>
                                <p>Nunc aliquet tincidunt metus, sit amet mattis lectus sodales ac. Suspendisse rhoncus dictum eros, ut egestas eros luctus eget. Nam nibh sem, mattis et feugiat ut, porttitor nec risus.</p>
                            </blockquote>
                            <p>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </p>
                            <div class="parallax-testimonial-review">
                                <img src="images/testimonials/3.png" alt="testimonial">
                                <span>Jonathan Dower</span>
                                <small>Leopard</small>
                            </div>
                        </div>
                    </div>
                </div>
                <ol class="carousel-indicators">
                    <li data-slide-to="0" data-target="#parallax-testimonial-carousel" class=""></li>
                    <li data-slide-to="1" data-target="#parallax-testimonial-carousel" class="active"></li>
                    <li data-slide-to="2" data-target="#parallax-testimonial-carousel" class=""></li>
                </ol>
            </div>
        </div>
    </section> -->
    <!-- end : Parallax with Testimonial -->

    <!-- <section class="super_sub_content row">
        <div class="dividerHeading text-center">
            <h4><span>RECENT POST TIMELINE</span></h4>
        </div>

        <div class="col-md-12">
            <section id="timeline" class="timeline-container">
                <div class="timeline-block">
                    <div class="timeline-img tl-green">
                        <i class="fa fa-picture-o"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>This title in post blogs</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus justo a odio cursus faucibus. Vivamus vehicula massa at arcu porta, sed maximus risus molestie. Morbi nec fringilla magna, sit.
                        </p>
                        <a href="#" class="btn btn-default">Read more</a>
                        <span class="tl-post-date">june 5</span>
                    </div>
                </div>

                <div class="timeline-block">
                    <div class="timeline-img tl-blue">
                        <i class="fa fa-video-camera"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>This title in post blogs</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus justo a odio cursus faucibus. Vivamus vehicula massa at arcu porta, sed maximus risus molestie. Morbi nec fringilla magna, sit.
                        </p>
                        <a href="#" class="btn btn-default">Read more</a>
                        <span class="tl-post-date">june 8</span>
                    </div>
                </div>

                <div class="timeline-block">
                    <div class="timeline-img tl-pink">
                        <i class="fa fa-globe"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>This title in post blogs</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus justo a odio cursus faucibus. Vivamus vehicula massa at arcu porta, sed maximus risus molestie. Morbi nec fringilla magna, sit.
                        </p>
                        <a href="#" class="btn btn-default">Read more</a>
                        <span class="tl-post-date">june 12</span>
                    </div>
                </div>

                <div class="timeline-block">
                    <div class="timeline-img tl-orange">
                        <i class="fa fa-picture-o"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>This title in post blogs</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus justo a odio cursus faucibus. Vivamus vehicula massa at arcu porta, sed maximus risus molestie. Morbi nec fringilla magna, sit.
                        </p>
                        <a href="#" class="btn btn-default">Read more</a>
                        <span class="tl-post-date">june 18</span>
                    </div>
                </div>
            </section>
        </div>
    </section> -->

    <!-- <div class="grey-content row">
        <div class="col-md-6 super_sub_content clearfix same-height">
            <div class="col-sm-6">
                <div class="serviceBox_8">
                    <div class="service-icon">
                        <i class="fa fa-pencil"></i>
                    </div>
                    <div class="service-content">
                        <h3>Clean &amp; Minimal</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec euismod dui. Mauris risus dolor, vulputate at placerat vitae, rutrum vel.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="serviceBox_8">
                    <div class="service-icon">
                        <i class="fa fa-diamond"></i>
                    </div>
                    <div class="service-content">
                        <h3>Branding Theme</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec euismod dui. Mauris risus dolor, vulputate at placerat vitae, rutrum vel.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="serviceBox_8">
                    <div class="service-icon">
                        <i class="fa fa-anchor"></i>
                    </div>
                    <div class="service-content">
                        <h3>Modern Design</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec euismod dui. Mauris risus dolor, vulputate at placerat vitae, rutrum vel.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="serviceBox_8">
                    <div class="service-icon">
                        <i class="fa fa-gears"></i>
                    </div>
                    <div class="service-content">
                        <h3>Quick Support</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec euismod dui. Mauris risus dolor, vulputate at placerat vitae, rutrum vel.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 inner-image same-height hidden-sm hidden-xs " style="background:url('images/awesome.png')no-repeat;"></div>
    </div> -->

    <!-- <div class="row super_sub_content">
        <div class="col-sm-7">
            <img class="img-responsive center-block" src="images/imac.png"/>
        </div>
        <div class="feature-block col-sm-5">
            <h4>Mobile is the future,<span><br/> fully responsive & retina ready</span></h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam earum enim est natus nulla odio perferendis totam. A eaque,  consectetur adipisicing elit. Aliquam earum enim est natus nulla odio  consectetur adipisicing elit. Aliquam earum enim est natus nulla odio nesciunt. Autem cum distinctio eligendi impedit mollitia officia perferendis praesentium tempore veniam voluptas. Assumenda fuga laboriosam modi perspiciatis possimus rem suscipit. Adipisci, eos exercitationem molestiae nesciunt quaerat ullam veniam vitae voluptatum.
            </p>
            <a class="btn btn-default" href="">Read More</a>
        </div>
    </div> -->

    <!-- <div class="grey-line-content row">
        <div class="col-md-6 col-sm-12 sub_content same-height">
            <div class="col-sm-12">
                <div class="serviceBox_8">
                    <div class="service-icon">
                        <i class="fa fa-pencil"></i>
                    </div>
                    <div class="service-content">
                        <h3>Clean &amp; Minimal</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam malesuada in enim vulputate ullamcorper. Nam semper, nibh at porta fermentum, sem felis. </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="serviceBox_8">
                    <div class="service-icon">
                        <i class="fa fa-anchor"></i>
                    </div>
                    <div class="service-content">
                        <h3>Branding Theme</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam malesuada in enim vulputate ullamcorper. Nam semper, nibh at porta fermentum, sem felis.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="serviceBox_8">
                    <div class="service-icon">
                        <i class="fa fa-gears"></i>
                    </div>
                    <div class="service-content">
                        <h3>Modern Design</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam malesuada in enim vulputate ullamcorper. Nam semper, nibh at porta fermentum, sem felis.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 inner-image hidden-sm hidden-xs same-height" style="background:url('images/slide-1.png')no-repeat;"></div>
    </div>
 -->
    <!-- <div class="feature-block row pdt-50">
        <div class="col-md-7 text-center">
            <img class="" src="images/awesome-img.png"/>
        </div>
        <div class="col-md-5">
            <h4>Professional,<span><br/>business solution & consulting</span></h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ut est accumsan, sollicitudin neque eget, sollicitudin ex. Quisque sit amet. </p>
            <a class="btn btn-default mrgb-20" href="">Read More</a>
        </div>
    </div> -->

    <!-- <div class="row">
        <div class="col-md-4">
        <div class="serviceBox_6 same-height">
            <div class="service-content">
                <h3>Clean& powerful code</h3>
                <span class="line"></span>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas luctus condimentum felis, sit amet placerat felis. Mauris porta lorem.</p>
                <a class="btn btn-default" href="">Read more <i class="fa fa-thumbs-up"></i></a>
            </div>
        </div>
    </div>
        <div class="col-md-4">
            <div class="serviceBox_6 same-height purple">
                <div class="service-content">
                    <h3>Incredibly Flexible</h3>
                    <span class="line"></span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas luctus condimentum felis, sit amet placerat felis. Mauris porta lorem.</p>
                    <a class="btn btn-default" href="">Read more <i class="fa fa-thumbs-up"></i></a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="serviceBox_6 same-height black">
                <div class="service-content">
                    <h3>Quick Support</h3>
                    <span class="line"></span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas luctus condimentum felis, sit amet placerat felis. Mauris porta lorem.</p>
                    <a class="btn btn-default" href="">Read more <i class="fa fa-thumbs-up"></i></a>
                </div>
            </div>
        </div>
    </div> -->

    <!-- <div class="super_sub_content grey_bg row">
        <div class="col-md-4 mrgt-70">
            <div class="serviceBox_7 right">
                <div class="service-icon">
                    <i class="fa fa-headphones"></i>
                </div>
                <h3>SEO Ready</h3>
                <p>
                    Drag more traffic to your website with our SEO Friendly theme: simply bank...
                </p>
            </div>

            <div class="serviceBox_7 right">
                <div class="service-icon">
                    <i class="fa fa-tasks"></i>
                </div>
                <h3>Retina Ready</h3>
                <p>
                    All our themes come with extensive HTML Documentation that teaches you how...
                </p>
            </div>
        </div>

        <div class="col-md-4">
            <img src="images/phones.png" class="img-responsive center-block">
        </div>

        <div class="col-md-4 mrgt-70">
            <div class="serviceBox_7">
                <div class="service-icon">
                    <i class="fa fa-pencil"></i>
                </div>
                <h3>easy customizable</h3>
                <p>
                    All our themes include advanced options which makes them super flexible for...
                </p>
            </div>
            <div class="serviceBox_7">
                <div class="service-icon">
                    <i class="fa fa-gears"></i>
                </div>
                <h3>global features</h3>
                <p>
                    We made sure images on your website would look stunning on any device. Our...
                </p>
            </div>
        </div>
    </div> -->

<!-- Product top 10 -->
    <div class="row super_sub_content grey_bg" style="padding-top: 40px;">
        <div class="col-md-12">
            <div class="dividerHeading text-center">
                <h4><span><s:message code="top10"></s:message></span></h4>
            </div>
            <div id="post-slider" class="owl-carousel">
<!--                 <div class="post-slide"> -->
<!--                     <div class="post-img"> -->
<!--                         <img src="/images/fms/fraction-slider/pauljoe.jpg"> -->
<!--                     </div> -->
<!--                     <h5 class="post-title"><a href="blog-post.html">Latest News Post</a></h5> -->
<!--                     <div class="post-date"> -->
<!--                         <i class="fa fa-calendar"></i> April 23, 2015 -->
<!--                     </div> -->
<!--                     <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed eleifend urna eu ...</p> -->
<!--                     <a class="readmore" href="">Read more</a> -->
<!--                 </div> -->  
				<c:forEach var="product" items="${prodTop10}" varStatus="status">      
					<div class="post-slide">
						<a href="/products/view/${product.prodId}">					
                        <div class="serviceBox_5">
                            <div class="service-image">
                                <img src="/products/show?prodImg=${product.prodImg}" style="height:100px; width:auto;"/>
                            </div>
                            <c:choose>
	                            <c:when test="${status.index==0}">
	                            	<div class="service-content bg3">
	                            		<div class="internal">
		                                    <div class="item_content">
		                                        <h4>${product.prodName}</h4>
		                                        <h4>${product.brandName}</h4>
		                                        <h4>
									    			<c:forEach begin="1" end="${product.score}">
														<i class="fa fa-diamond" style="color:#f94877"></i>
													</c:forEach>
													<c:if test="${product.score/1!=0}">
														<i class="fa fa-diamond" style="color:#f94877"></i>
													</c:if>
													<span style="color:#f94877">&nbsp;${product.score}</span>
									    		</h4>
<%-- 		                                        <a class="read"  href="location.href='/products/view/${product.prodId}'">more</a> --%>
		                                    </div>
		                                </div>
		                            </div>
	                        
	                            </c:when>
	                            <c:when test="${status.index==1}">
	                            	<div class="service-content bg2">
	                            		<div class="internal">
		                                    <div class="item_content">
		                                        <h4>${product.prodName}</h4>
		                                        <h4>${product.brandName}</h4>
		                                        <h4>
									    			<c:forEach begin="1" end="${product.score}">
														<i class="fa fa-diamond" style="color:#f94877"></i>
													</c:forEach>
													<c:if test="${product.score/1!=0}">
														<i class="fa fa-diamond" style="color:#f94877"></i>
													</c:if>
													<span style="color:#f94877">&nbsp;${product.score}</span>
									    		</h4>
<%-- 		                                        <a class="read"  href="location.href='/products/view/${product.prodId}'">more</a> --%>
		                                    </div>
		                                </div>
		                            </div>
	                            </c:when>
	                            <c:when test="${status.index==2}">
	                            	<div class="service-content bg1">
	                            		<div class="internal">
		                                    <div class="item_content">
		                                        <h4>${product.prodName}</h4>
		                                        <h4>${product.brandName}</h4>
		                                        <h4>
									    			<c:forEach begin="1" end="${product.score}">
														<i class="fa fa-diamond" style="color:#f94877"></i>
													</c:forEach>
													<c:if test="${product.score/1!=0}">
														<i class="fa fa-diamond" style="color:#f94877"></i>
													</c:if>
													<span style="color:#f94877">&nbsp;${product.score}</span>
									    		</h4>
<%-- 		                                        <a class="read"  href="location.href='/products/view/${product.prodId}'">more</a> --%>
		                                    </div>
		                                </div>
		                            </div>
	                            </c:when>
	                            <c:otherwise>
	                            	<div class="service-content bg4">
	                            		<div class="internal">
		                                    <div class="item_content">
		                                        <h4>${product.prodName}</h4>
		                                        <h4>${product.brandName}</h4>
		                                        <h4>
									    			<c:forEach begin="1" end="${product.score}">
														<i class="fa fa-diamond" style="color:#f94877"></i>
													</c:forEach>
													<c:if test="${product.score/1!=0}">
														<i class="fa fa-diamond" style="color:#f94877"></i>
													</c:if>
													<span style="color:#f94877">&nbsp;${product.score}</span>
									    		</h4>
<%-- 		                                        <a class="read"  href="location.href='/products/view/${product.prodId}'">more</a> --%>
		                                    </div>
		                                </div>
		                            </div>
	                            </c:otherwise>
                            </c:choose>
                                
                        </div>
                        </a>                 
                    </div>
     			</c:forEach>
            </div>
        </div>
    </div>
<!-- end of Product top 10 -->    
    
<!-- Latest Post -->
    <div class="grey_bg row super_sub_content" style="padding-top: 40px; background-image: url('/images/fms/bg1.jpg'); background-repeat:repeat;">
	    <div class="col-md-12">
            <div class="dividerHeading text-center">
                <h4><span><s:message code="latestpost"></s:message></span></h4>
            </div>
		    <div id="timelineDiv">
				<section id="cd-timeline">
					<c:forEach var="item" items="${articles}">
						<div class="cd-timeline-block">
							<div class="cd-timeline-img"></div>
							<div class="cd-timeline-content">
								<h2>${item.articleTitle}</h2>
								<small>${item.articleType}</small>
								<span style="float:right; color:#337ab7; font-weight:bold; ">by <a href="/members/overview/${item.memberId}">${item.nickname}</a></span>
	<%-- 							<p>${item.articleContent}</p> --%>
	<%-- 							<p>${fn:escapeXml(item.articleContent)}</p> --%>
	<%-- 							<html:text property="${item.articleContent}" /> --%>
	<!-- 							<div style="width: 300px; height:60px; border: #ef5c28 2px solid; overflow : hidden;"> -->
									<p id="txt">${fn:substring(item.articleContent, 0, 140)}</p>
									<script>
											var html = document.getElementById("txt").innerHTML;
										 	document.getElementById("txt").innerHTML = html.replace(/<[^>]+>/gm, '');
									</script>
	<!-- 							</div> -->
								<a href="/articles/view/${item.articleId}" class="cd-info text-center" style="clear:both;">Read More</a>
								<span class="cd-date"><fmt:formatDate pattern="yyyy-MMM-dd" value="${item.articleTime}" /></span>
							</div> <!-- cd-timeline-content -->
						</div> <!-- cd-timeline-block -->
					</c:forEach>
				</section>
			</div> <!-- timeline Div -->
		</div>
	</div>
<!-- end of Latest Post -->

    <!-- <section class="promo_box wow bounceInUp row" data-wow-offset="50">
        <div class=" container-fluid">
            <div class="col-sm-9">
                <div class="promo_content">
                    <h3>Fortune is awesome responsive template, with clean design.</h3>
                    <p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean commodo ligula eget dolor. </p>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="pb_action">
                    <a class="btn btn-lg btn-default" href="#fakelink">
                        <i class="fa fa-shopping-cart"></i>
                        Download Now
                    </a>
                </div>
            </div>
        </div>
    </section> -->

<!--start footer-->
<footer class="footer row">
    <div class="col-sm-6 col-md-3 col-lg-3">
        <div class="widget_title">
            <h4><span>About Us</span></h4>
        </div>
        <div class="widget_content">
            <p>Donec earum rerum hic tenetur ans sapiente delectus, ut aut reiciendise voluptat maiores alias consequaturs aut perferendis doloribus asperiores.</p>
            <ul class="contact-details-alt">
                <li><i class="fa fa-map-marker"></i> <p><strong>Address</strong>: Taipei, Taiwan</p></li>
                <li><i class="fa fa-user"></i> <p><strong>Phone</strong>:(+886) 8888-8888</p></li>
                <li><i class="fa fa-envelope"></i> <p><strong>Email</strong>: <a href="#">qutie@gmail.com</a></p></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-6 col-md-3 col-lg-3">
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
    <div class="col-sm-6 col-md-3 col-lg-3">
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
    <div class="col-sm-6 col-md-3 col-lg-3">
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
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
<!--end footer-->

<!-- SCRIPT -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/js/fms/jquery.fractionslider.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/fms/owl.carousel.min.js"></script>

<script type="text/javascript" src="/js/fms/jflickrfeed.js"></script>
<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>


<script type="text/javascript" src="/js/fms/swipe.js"></script>
<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
<script type="text/javascript" src="/js/fms/fms-main.js"></script>
<script type='text/javascript'> 
$(function(){
	var start = Date.now() ;
	var pageUrl = window.location.toString();
	window.onunload=visitTime;

	var forCheckLogin=$("#forCheckLogin").attr("value");
	function visitTime(){
		var end = Date.now() ;
		var timeOnSiteStr=(end-start);
		$.ajax({
			url:"/timeonsite/record",
			type:"POST",
			traditional: true,
			data:{"timeOnSiteStr":timeOnSiteStr,"pageUrl":pageUrl,"memberId":forCheckLogin},
			success:function(){
			}
		})
	}
	
	 /* Fraction Slider */
	if (jQuery.isFunction(jQuery.fn.fractionSlider)) {
		$(window).load(function() {
			$('.slider').fractionSlider({
				'fullWidth' : true,
				'controls' : true,
				'responsive' : true,
				'dimensions' : "1170,355",
				'timeout' : 5000,
				'increase' : true,
				'pauseOnHover' : true,
				'slideEndAnimation' : false,
				'autoChange' : true
			});
		});
	}
	 
	
    /*	Owl Carousel*/
    if(jQuery.isFunction(jQuery.fn.owlCarousel)){

        // Recent Work Slider
        $("#recent-work-slider").owlCarousel({
            navigation : true,
            pagination : false,
            items : 5,
            itemsDesktop:[1199,4],
            itemsTablet : [768, 3],
            itemsDesktopSmall : [992, 3],
            itemsMobile : [480,1],
            navigationText : ["",""]
        });

        // Post News Slider
        $("#post-slider").owlCarousel({
            navigation : true,
            pagination : false,
            items : 4,
            itemsDesktop:[1199,3],
            itemsDesktopSmall:[980,2],
            itemsMobile : [479,1],
            navigationText : ["",""]
        });
    }
	 
	/* Flickr Gallery */
	$('#flickrFeed')
		.jflickrfeed({
			limit : 9,
			qstrings : {
				// id: '124787947@N07' our id //
				id : '124787947@N07'
			},
			itemTemplate : '<li><a class="mfp-gallery" title="{{title}}" href="{{image_b}}"><i class="fa fa-search"></i><div class="hover"></div></a><img src="{{image_s}}" alt="{{title}}" /></li>'
		});
	
	var timelineBlocks = $('.cd-timeline-block'),
	offset = 0.8;

	hideBlocks(timelineBlocks, offset);
	
	//on scolling, show/animate timeline blocks when enter the viewport
	$(window).on('scroll', function(){
		(!window.requestAnimationFrame) 
			? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
			: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
	});
	
	function hideBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.cd-timeline-img, .cd-timeline-content').addClass('is-hidden');
		});
	}
	
	function showBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.cd-timeline-img').hasClass('is-hidden') ) && $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
		});
	}
})
 </script> 
</body>
</html>