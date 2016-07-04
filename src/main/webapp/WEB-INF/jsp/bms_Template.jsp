<!--這是後台系統的Template，目前首頁 http://localhost:8080/bms
	使用方式：
		基本上每一頁就長這樣，以下是一些重點提示
		1.在<head>加入css ref
		2.在<body>最後方加入js
		  **css及js有寫入順序，先後順序不能亂，不然版型可能會怪**
		3.body內的全部內容用一個<div>包起來，id為wrapper (js不用包進去)
			<div id="wrapper"> </div>
		4.使用c:import加入上方及側邊的Nav-Bar(所以要加入taglib)
		    <c:import url="../bms_header.jsp" />
	        <c:import url="../bms_navbar-side.jsp" />
	    5.每一頁不同的部分寫在PageContent程式碼之中
	    6.要修改的地方基本上都有用**做記號，有些每頁不同的地方，再自己根據內容作修改
	 希望看得懂，就參考此Template做修改吧，這是簡單版本，其他功能再討論
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- **taglib沒有的話記得要加入** -->
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- **加入5個css ref，請按照此順序** -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/metisMenu.min.css" rel="stylesheet">
<link href="/css/sb-admin-2.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bms-customize.css" rel="stylesheet" >

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後台管理系統</title> 

</head>
<body>
<!-- 內文全部用wrapper包起來 -->
<div id="wrapper">

<!-- 加入上方及側邊Nav-Bar -->	
<c:import url="/WEB-INF/jsp/bms_header.jsp" />
<c:import url="/WEB-INF/jsp/bms_navbar-side.jsp" />
<!-- ?? url有沒有更好的寫法 ?? -->


<!-- Page Content --> 
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">DashBoard</h1>   <!-- **內文中的標題，請修改** -->
                <!-- **每頁不同的內容從這裡開始** -->
                
                
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


<!-- **加入4個js，請按照此順序** -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/metisMenu.min.js"></script>
<script src="/js/sb-admin-2.js"></script>

</body>
</html>