<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="col-lg-2">
<div id="navigationDiv">
	<ul id="navigationMenu">
	    <li>
		    <a class="overview" href="/members/overview/${memberId}">
	            <span class="nav-span">Overview</span>
	        </a>
	    </li>
	    <li>
	    	<a class="profile" href="/members/profile">
	            <span class="nav-span nav-active">Profile</span>
	        </a>
	    </li>
	    <li>
	    	<a class="expdate" href="/members/product-exp">
	            <span class="nav-span">ExpDate</span>
	        </a>
	    </li>
	    <li>
	    	<a class="liked-product" href="#">
	            <span class="nav-span">Product</span>
	        </a>
	    </li>
	    <li>
		     <a class="liked" href="/members/like">
	            <span class="nav-span">Liked</span>
	         </a>
	    </li>
	    <li>
	    	<a class="posted" href="/members/post/${memberId}">
	            <span class="nav-span">Posted</span>
	        </a>
	    </li>
	</ul>
</div>	<!-- /end #navigationDiv -->
</div>	<!-- /end .col-2 -->