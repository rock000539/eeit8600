<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--start wrapper-->
<section class="wrapper container">
<!--Start Header-->
<header id="header">
    <div class="col-sm-12 top-nav">
        <ul>
        <!-- 登入前 -->
            <!-- <li>
                <a href="#"><i class="fa fa-user" aria-hidden="true"></i>
                <span style="font-family: Open Sans;">&nbsp Login / Sign Up<span>
                </a>
            </li> -->
        <!-- 登入後 -->
            <li>
                <a href="#"><span>username</span></a>
            </li>
            <li>
                <a class="" href="#">
                <div class="userdiv img-circle"><img id="userimg" src="/images/fms/userh.png"/></div>
                </a>
            </li>
        </ul>
    </div>

    <div class="col-sm-12">
        <div id="logo">
            <h1><a href="index.html"><img src="/images/fms/logo_qutie.jpg"/></a></h1>
        </div>
    </div>

    <!-- Navigation
    ================================================== -->

    <div class="navbar navbar-default navbar-static-top col-sm-12" role="navigation">
        <span class="nav-caption">Navigation Menu...</span>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>

                <li><a href="#">Date</a></li>

                <li><a href="#">Ingredient</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Via Product</a></li>
                        <li><a href="#">Via Ingredient</a></li>
                    </ul>
                </li>

                <li><a href="#">Order</a></li>

                <li><a href="#"><span class="data-hover" data-hover="blog">Product</span></a></li>

                <li><a href="#">Review</a></li>
                <li><a href="#">Article</a></li>
                <li><a href="#">Ranking</a></li>
            </ul>
        </div>
    </div>
</header>
<!--End Header-->