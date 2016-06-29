<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member AddPage</title>
<style>
	.error {
		color: red;
	}
	body.modal-open {
	  padding-right: 0 !important;
	}
</style>
	<!-- Header, NavBar -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/sb-admin-2.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/css/bms-customize.css" rel="stylesheet" >
	<link href="/css/metisMenu.min.css" rel="stylesheet">
	
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/sb-admin-2.js"></script>
	
	<!-- BootStrap 基本檔案  -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<!-- 表單驗證  -->
	<script 
		src="/js/jquery.validate.min.js"></script>
	
	<!-- DatePicker -->
	<link rel="stylesheet" 
		href="/css/bootstrap-datetimepicker.min.css" />
    <script
    	src="/js/bootstrap-datetimepicker.min.js"></script>
    <script
    	src="/js/trirand/i18n/bootstrap-datetimepicker.zh-TW.js"></script>
    
  
    <script src="/js/metisMenu.min.js"></script>
    
</head>
<body class="modal-open">
<div id="wrapper">
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0;">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/bms"><font>Queautiful 後台管理系統</font></a>
    </div>
    <!-- /.navbar-header -->
</nav>
<c:import url="../bms_navbar-side.jsp" />
<!-- Page Content --> 
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Member AddPage</h1>
                <!-- **每頁不同的內容從這裡開始** -->

<!-- Button trigger modal -->
<a href="/members/register" type="button" class="btn btn-lg btn-default" data-toggle="modal" data-target="#regiForm">
  SignUp
</a>

<!-- Modal -->
<div class="modal fade" id="regiForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
	    <div class="modal-body">
	    </div>
    </div>
  </div>
</div>
	
<!-- **每頁不同的內容 end** -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->



</body>
</html>