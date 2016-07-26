<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="col-lg-2">
<div id="navigationDiv">
	<ul id="navigationMenu">
	    <li>
		    <a class="overview" href="<%=request.getContextPath()%>/members/overview/${memberId}">
	            <span class="nav-span">Overview</span>
	        </a>
	    </li>
	    <li>
	    	<a class="profile" href="<%=request.getContextPath()%>/members/profile">
	            <span class="nav-span">Profile</span>
	        </a>
	    </li>
	    <li>
	    	<a class="expdate" href="<%=request.getContextPath()%>/members/product-exp">
	            <span class="nav-span">ExpDate</span>
	        </a>
	    </li>
	    <li>
	    	<a class="liked-product" href="<%=request.getContextPath()%>/members/wishlist">
	            <span class="nav-span">WishList</span>
	        </a>
	    </li>
	    <li>
		     <a class="liked" href="<%=request.getContextPath()%>/members/like">
	            <span class="nav-span">Liked</span>
	         </a>
	    </li>
	    <li>
	    	<a class="posted" href="<%=request.getContextPath()%>/members/post/${memberId}">
	            <span class="nav-span">Posted</span>
	        </a>
	    </li>
	</ul>
</div>	<!-- /end #navigationDiv -->
</div>	<!-- /end .col-2 -->