<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!--start wrapper-->
<section class="wrapper container">
<!--Start Header-->
<header id="header">
    <div class="col-sm-12 top-nav">
        <ul>
        <c:set var="nickname" scope="session" value='<%=request.getSession().getAttribute("MemberNickname")%>'/>
        <c:set var="memberId" scope="session" value='<%=request.getSession().getAttribute("memberId") %>' />
         <c:if test="${empty nickname}">
		<!--  登入前 -->
            <li>  
            <c:if test="${empty memberId}">
                <a href="/fmslogin"><i class="fa fa-user" aria-hidden="true"></i>
                <span style="font-family: Open Sans;">&nbsp Login / Sign Up</span>
                </a>
            </c:if>
            </li>
            
        </c:if>
        <!-- 登入後 -->            
        	 <c:if test="${not empty nickname}"> 
            <li>
                <a href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i><span>&nbsp Logout</span></a>
            </li>
            <li>
                <a href="/members/overview/${memberId}"><span>${nickname}</span></a>
            </li>
            <li>
                <a class="" href="#">
                <div class="userdiv img-circle"><img id="userimg" src="/members/show?memberId=<%=request.getSession().getAttribute("memberId")%>"/></div>
                </a>
            </li>
         </c:if>
            <sec:authorize access="hasRole('ADMIN')">
            <li>
                <a href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i><span>&nbsp Logout</span></a>
            </li>
            <li>
                <a href="/bms"><span>Background management</span></a>
            </li>
            </sec:authorize>
       
       
        </ul>
    </div>

    <div class="col-sm-12">
        <div id="logo">
            <h1><a href="/fms"><img src="/images/logo_qutie-02.png"/></a></h1>
        </div>
    </div>

    <!-- Navigation
    ================================================== -->

    <div class="navbar navbar-default navbar-static-top col-sm-12" role="navigation">
        <span class="nav-caption"></span>
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
                <li class="active"><a href="/fms">Home</a></li>

                <li><a href="/expdate/search">Date</a></li>

                <li><a href="/ingredients/main">Ingredient</a>
                    <ul class="dropdown-menu">
                        <li><a href="/prodIngreList/prodNameSearchIngred">Via Product</a></li>
                        <li><a href="/ingredients/search">Via Ingredient</a></li>
                    </ul>
                </li>

                <li><a href="#">Order</a></li>

                <li><a href="/products/search"><span class="data-hover" data-hover="blog">Product</span></a></li>

                <li><a href="/reviews/reviews">Review</a></li>
                <li><a href="/articles/listfms">Forum</a></li>
                <li><a href="/contact">Contact</a></li>
            </ul>
        </div>
    </div>
</header>
<!--End Header-->
