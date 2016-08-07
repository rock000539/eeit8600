<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
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
                	<span style="font-family: Open Sans;">&nbsp;<s:message code="login"></s:message>&nbsp;/</span>
                </a>
                <a href="javascript:">
                	<span id="signUpModal" data-toggle="modal"  data-target="#regiModal" href="/members/register"  style="font-family: Open Sans;">&nbsp;<s:message code="signup"></s:message></span>
                </a>              
            </c:if>
            </li>
            
        </c:if>
        <!-- 登入後 -->            
        	 <c:if test="${not empty nickname}"> 
            <li>
                <a href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i><span>&nbsp;<s:message code="logout"></s:message></span></a>
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
                <a href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i><span>&nbsp;<s:message code="logout"></s:message></span></a>
            </li>
            <li>
                <a href="/bms"><span>&nbsp;<s:message code="backgroundmanagement"></s:message></span></a>
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
                <li class="active"><a href="/fms"><s:message code="home"></s:message></a></li>

                <li><a href="/expdate/search"><s:message code="date"></s:message></a></li>

                <li><a href="/ingredients/main"><s:message code="ingredient"></s:message></a>
                    <ul class="dropdown-menu">
                        <li><a href="/prodIngreList/prodNameSearchIngred"><s:message code="via_product"></s:message></a></li>
                        <li><a href="/ingredients/search"><s:message code="via_ingredient"></s:message></a></li>
                    </ul>
                </li>
                <li><a href="/products/search"><span class="data-hover" data-hover="blog"><s:message code="product"></s:message></span></a></li>

                <li><a href="/reviews/reviews"><s:message code="review"></s:message></a></li>
                <li><a href="/articles/listfms"><s:message code="forum"></s:message></a></li>
                <li><a href="/contact"><s:message code="contact"></s:message></a></li>
            </ul>
        </div>
    </div>   
 <!-- //////////////////////////////////////////////////////////////// -->
 <!-- modal -->
<div class="modal fade" id="regiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body"></div>
        </div> <!-- content -->
    </div> <!-- dialog -->
</div> <!-- m -->
<!-- //////////////////////////////////////////////////////////////////////// -->
</header>
<!--End Header-->
