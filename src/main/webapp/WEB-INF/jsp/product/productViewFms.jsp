<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<script src="/js/jquery.min.js"></script>
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">	
	<script src="/js/bootstrap.min.js"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ProductViewPage</title>
	
	<style>
		.vertical-center {
			min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
		  	min-height: 100vh; /* These two lines are counted as one :-)       */
		 	display: flex;
			align-items: center;
		}
	</style>
	
</head>
<body>
	
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10" style="align:center; margin-top:20px;">
			<div class="jumbotron center-block" style="width:800px; height:300px;">
				<div class="container vertical-center">
					<div class="col-sm-5">
						<h3 style="text-align:center">Queutiful Star</h3>
						<br/>
						<img alt="" src="/products/show?prodId=1">
					</div>
					<div class="col-sm-7"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-1"></div>
	</div>
	
	<script>
		console.log('${product}');
	</script>
	
</body>
</html>