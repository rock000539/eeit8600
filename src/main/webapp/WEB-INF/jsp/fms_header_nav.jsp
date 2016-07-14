<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--start wrapper-->
<section class="wrapper container">
<!--Start Header-->
<header id="header">
    <div class="col-sm-12 top-nav">
        <ul>
        <c:set var="nickname" scope="session" value='<%=request.getSession().getAttribute("MemberNickname")%>'/>
         <c:if test="${empty nickname}">
		<!--  登入前 -->
            <li>
                <a href="/login"><i class="fa fa-user" aria-hidden="true"></i>
                <span style="font-family: Open Sans;">&nbsp Login / Sign Up<span>
                </a>
            </li>
            
        </c:if>
         
        <!-- 登入後 -->            
        	 <c:if test="${not empty nickname}"> 
            <li>
                <a href="#"><span>${nickname}</span></a>
            </li>
            <li>
                <a class="" href="#">
                <div class="userdiv img-circle"><img id="userimg" src="/members/show?memberId=<%=request.getSession().getAttribute("memberId")%>"/></div>
                </a>
            </li>
         </c:if>
       
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

                <li><a href="/expdate/search">Date</a></li>

                <li><a href="/ingredients/main">Ingredient</a>
                    <ul class="dropdown-menu">
                        <li><a href="/prodIngreList/prodNameSearchIngred">Via Product</a></li>
                        <li><a href="/ingredients/SearchIngredient">Via Ingredient</a></li>
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