<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--  BASE CSS STYLE  -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/bms/style.min.css" rel="stylesheet">
	<link href="/css/bms/default.css" rel="stylesheet" id="theme">
	<link href="/css/bms/bms-customize.css" rel="stylesheet">
	<!--  BASE JS  -->
	<script src="/js/bms/pace.min.js"></script>
	
	<!-- 一定要放在Header、NavBar css的後面  -->
    <link rel="stylesheet" href="/css/trirand/ui.jqgrid-bootstrap.css" />

<title>Review List</title>
<style>
table{border:3px solid black; 
 	  width:900px;} 

th,td{border:1px solid black; 
 	  text-align:center;} 

</style>
</head>
<body>

	<!-- Loading animate -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	
	<!-- page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
	
	<c:import url="/WEB-INF/jsp/bms/bms_header.jsp" />
	<c:import url="/WEB-INF/jsp/bms/bms_navbar-side.jsp" />	
	
		<!-- page content -->
		<div id="content" class="content">
			<!-- breadcrumb 目前位置 -->
			<ol class="breadcrumb pull-right">
				<li><a href="<% request.getContextPath(); %>/bms">Home</a></li>
				<li><a href="javascript:;">檢舉系統</a></li>
				<li class="active">會員管理</li>
			</ol>
			
			<!-- page-header 每頁標題 副標 -->
			<h1 class="page-header">會員管理列表 <small>會員停權復權管理</small></h1>
			
			<!-- 內文 -->
			<div class="row">
			    <div class="col-md-12 ui-sortable">
	            <!-- **每頁不同的內容從這裡開始** -->

<h2>Review List</h2>
<!-- <input type="button" name="add" value="add" onClick="location='/reviews/add'"> -->
<table>
<thead align='center'>
	<tr>
		<th>心得id</th>
		<th>會員id</th>
		<th>產品id</th>
		<th>心得標題</th>
		<th>內文</th>
		<th>評分</th>
		<th>Img Path</th>	
		<th width="50">圖片</th>		
		<th>發布時間</th>
		<th>收藏數</th>
		<th>flag</th>
	</tr>
</thead>
<tbody align='center'>
	<c:forEach var='review' items="${reviews}">
	<tr>
		<td>${review.reviewId}</td>
		<td>${review.memberId}</td>
		<td>${review.prodId}</td>
		<td>${review.reviewTitle}</td>
		<td>${review.review}</td>
		<td>${review.reviewRating}</td>
		<td>${review.reviewImg}</td>
		<td><img height="30" src="/reviews/show?reviewImg=${review.reviewImg}"></td>
		<td>${review.reviewTime}</td>
		<td>${review.rewCollect}</td>
		<td>${review.reviewShow}</td>
		<td><input type="button" name="edit" value="edit" onClick="location='/reviews/edit?reviewId=${review.reviewId}'"></td>
		<td><input type="button" name="delete" value="delete" onClick="location='/reviews/delete?reviewId=${review.reviewId}'"></td>
	</tr>	
</c:forEach>
</tbody>
</table>


              <!-- **每頁不同的內容 end** -->     
			    </div><!-- /end .col-md-12 -->
			</div> <!-- /end .row -->
		</div>
		<!-- /end #content -->
		<!-- scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- /end page container -->

	<!--  BASE JS  -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bms/jquery.slimscroll.min.js"></script>
	<script src="/js/bms/bms.js"></script>
	<!-- jqGrid js、css -->
    <script src="/js/trirand/i18n/grid.locale-tw.js"></script>
    <script src="/js/trirand/jquery.jqGrid.min.js"></script>
    
<script>
	$.jgrid.defaults.width = 780;
</script>
</body>
</html>