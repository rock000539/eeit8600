<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
	<title>BMS</title>
	
	<!--  BASE CSS STYLE  -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/bms/style.min.css" rel="stylesheet">
	<link href="/css/bms/default.css" rel="stylesheet" id="theme">
	<link href="/css/bms/bms-customize.css" rel="stylesheet">
	<!--  BASE JS  -->
	<script src="/js/bms/pace.min.js"></script>
</head>
<body>
	<!-- page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
	
	<c:import url="/WEB-INF/jsp/bms/bms_header.jsp" />
	<c:import url="/WEB-INF/jsp/bms/bms_navbar-side.jsp" />	
	
		<!-- page content -->
		<div id="content" class="content">
			<!-- breadcrumb 目前位置 -->
			<ol class="breadcrumb pull-right">
				<li><a href="<% request.getContextPath(); %>/bms">Home</a></li>
				<li><a href="javascript:;">Page Options</a></li>
				<li class="active">Blank Page</li>
			</ol>
			
			<!-- page-header 每頁標題 副標 -->
			<h1 class="page-header">Dashboard <small>overview of background management system</small></h1>
			
			<!-- 內文 -->
			<div class="row">
			    <div class="col-md-12 ui-sortable">
	            <!-- **每頁不同的內容從這裡開始** -->
	            	<div >修改檢舉停權次數</div>
	            	<div >
	            	<br>
	            	<span>文章檢舉:隱藏文章所需次數</span>
	            	<input type="text" id="articleReportPropertys" value="${articleReportProperty}">
	            	<input type="button" id="articleReportPropertysSubmit" value="確認">
	            	</div>
	            	<div>
	            	<br>
	            	<span>心得檢舉:隱藏心得所需次數</span>
	            	<input type="text" id="reviewReportPropertys" value="${reviewReportProperty}">
	            	<input type="button" id="reviewReportPropertysSubmit" value="確認">
	            	<br>
	            	</div>
	            	<div>
	            	<br>
	            	<span>會員停權設定</span>
	            	<input type="text" id="ReportPropertys" value="${reportProperty}">
	            	<input type="button" id="reportPropertySubmit" value="確認">
	            	<br>
	            	</div>
	            
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
	<script>
	$(function(){
		$("#articleReportPropertysSubmit").click(function (){
			var articleReportPropertys=$("#articleReportPropertys").val();
			
			$.ajax({
				url:"/report/ReportPropertys",
				type:"post",
				data:{"articleReportPropertys":articleReportPropertys},
				success:function(result){
				alert(result);
			}
			})
		});
		
		$("#reviewReportPropertysSubmit").click(function (){
			var reviewReportPropertys=$("#reviewReportPropertys").val();
			
			$.ajax({
				url:"/report/ReportPropertys",
				type:"post",
				data:{"reviewReportPropertys":reviewReportPropertys},
				success:function(result){
				alert(result);
			}
			})
		});
		
		$("#reportPropertySubmit").click(function(){
			var reportPropertys=$("#ReportPropertys").val();
			$.ajax({
				url:"/report/ReportPropertys",
				type:"post",
				data:{"reportPropertys":reportPropertys},
				success:function(result){
				alert(result);
			}
			})
		})
		
	})
	</script>
	
</body>
</html>