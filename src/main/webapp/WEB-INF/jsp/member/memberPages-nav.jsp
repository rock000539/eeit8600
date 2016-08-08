<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-lg-2">
<div id="navigationDiv">
	<ul id="navigationMenu">
	    <li>
		    <a class="overview" href="<%=request.getContextPath()%>/members/overview/${member.memberId}">
	            <span class="nav-span">關於 ${member.nickname} </span>
	        </a>
	    </li>
	    <c:if test="${memberId == member.memberId}">
	    <li>
	    	<a class="profile" href="<%=request.getContextPath()%>/members/profile">
	            <span class="nav-span">個人資料</span>
	        </a>
	    </li>
	    <li>
	    	<a class="expdate" href="<%=request.getContextPath()%>/members/product-exp">
	            <span class="nav-span">產品期限</span>
	        </a>
	    </li>
	    <li>
	    	<a class="liked-product" href="<%=request.getContextPath()%>/members/wishlist">
	            <span class="nav-span">慾望清單</span>
	        </a>
	    </li>
	    <li>
		     <a class="liked" href="<%=request.getContextPath()%>/members/like">
	            <span class="nav-span">收藏清單</span>
	         </a>
	    </li>
	    </c:if>
	    <li>
	    	<a class="posted" href="<%=request.getContextPath()%>/members/post/${member.memberId}">
	            <span class="nav-span">發表清單</span>
	        </a>
	    </li>
	</ul>
</div>	<!-- /end #navigationDiv -->
</div>	<!-- /end .col-2 -->