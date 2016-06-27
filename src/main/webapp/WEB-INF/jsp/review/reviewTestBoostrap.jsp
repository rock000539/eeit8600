<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- **taglib沒有的話記得要加入** -->
<!-- **加入2個css，請按照此順序** -->
<link href="/css/bootstrap.min.css" rel="stylesheet" >
<link href="/css/bootstrap-theme.css" rel="stylesheet">
<link href="/css/review-customize.css" rel="stylesheet">



<title>Review List</title>
</head>
<body>


<div class="row">
	<c:forEach var='review' items="${reviews}">

	  <div class="col-sm-6 col-md-3">
	    <div class="thumbnail">
	      	<img src="/reviews/show?reviewId=${review.reviewId}">
	      	<span class="reviewtime">${review.reviewTime}</span>
	      	<div class="caption">
<!-- 		        <h3>Thumbnail label</h3> -->
				<div>
					
					<img src="/img/loading.gif">
					
				</div>
		        <p>${review.review}Some sample text. Some sample textSome sample text. Some sample textSome sample text.
		        Some sample textSome sample text.Some sample textSome sample text. Some sample textSome sample text. 
		        </p>
<!-- 		        <p> -->
<!-- 			        <a href="http://www.google.com" class="btn btn-primary" role="button">Button</a>  -->
<!-- 			        <a href="http://www.yahoo.com.tw" class="btn btn-default" role="button">Button</a> -->
<!-- 		        </p> -->
	        </div>
	        <!-- caption end --> 
	    </div>
	    <!-- thumbnail end --> 
	  </div>
	  <!-- col-sm-6 col-md-3 end --> 
	  </c:forEach>

</div>
<!-- row end --> 



<!-- **加入2個js，請按照此順序** -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>


</body>
</html>