<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>後台管理系統</title> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!--  BASE CSS STYLE  -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/bms/style.min.css" rel="stylesheet">
	<link href="/css/bms/default.css" rel="stylesheet" id="theme">
	<link href="/css/bms/bms-customize.css" rel="stylesheet">
	<!--  BASE JS  -->
	<script src="/js/bms/pace.min.js"></script>
	
	<!--  BASE JS  -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bms/jquery.slimscroll.min.js"></script>
	<script src="/js/bms/bms.js"></script>


<script>
$(function(){
	$('#searchIngerdinet').click(function (){
		var prodName=$("#prodName").val();

		$.ajax({
		'url':'/prodIngreList/get',
		'data':{"prodName":prodName},
		'type' : 'POST',
		'success': function (data){
			
			$('#productList').empty();
		for(var i=0;i<data.products.length;i++){
			$("#productList").append(					
					"<tr><td><img src='/products/show?prodImg="+data.products[i].prodImg+"'/></td><td>"
					+data.products[i].prodName+"</td><td>"
					+data.categorys[i].categoryName+"</td>"
					+"<td><input type='submit' class='checkIngredient btn btn-primary'"+ 
					"data-toggle='modal'  data-target='#myModal' name='"
					+data.products[i].prodId+"' value=編輯產品成份>"
					+"</td></tr>")
		}//end of for
 //----------------------------------------------
 		$(".checkIngredient").click(function(e){
			var proIdStr=e.target.name;
			document.location.href="/prodIngreList/editIngredient?proIdStr="+proIdStr;

			
		});//end of $(".checkIngredient").click
//-----------------------------------------------		
		}//end success function

		});	
		
		})//end search click
			
	})//end function

</script>
<style >
body {
	font-family: Microsoft JhengHei, "Open Sans",Helvetica,Arial,sans-serif;	
}
#productList img{width:100px;
height: 100px;
}
#mainSpace{
width:500px;
margin: auto auto;}
#buttonTd{
width: 80px;}
</style>
</head>
<body>
	<!-- page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
	
	<c:import url="/WEB-INF/jsp/bms/bms_header.jsp" />
	<c:import url="/WEB-INF/jsp/bms/bms_navbar-side.jsp" />	
	
		<!-- page content -->
		<div id="content" class="content">
			<!-- breadcrumb 目前位置 -->
			
			<!-- page-header 每頁標題 副標 -->
			<h1 class="page-header">產品成份對應管理 <small></small></h1>
			
			<!-- 內文 -->
			<div class="row">
			    <div class="col-md-12 ui-sortable">
<!-- ////////////////////////////////////////////////////////////////////-->
<table id="mainSpace" >
<tr><td colspan="2">請輸入產品名/部分產品名，查詢成份</td></tr>
<form action="">

<tr>
<td><input type="text" name="prodName" id="prodName" class="form-control" ></td> 
<td id="buttonTd"><input type="button" id="searchIngerdinet" value="Search" class="btn btn-default" style="margin-bottom: 10px;"></td>
</tr>
</form>
</table>	
<table id="productList" class="table  table-hover"></table>
<div id="showArea"></div>
	<!-- ////////////////////////////////////////////////////////////////////-->
	            <!-- **每頁不同的內容 end** -->     
			    </div><!-- /end .col-md-12 -->
		</div> <!-- /end .row -->
		</div>
		<!-- /end #content -->
		<!-- scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
	</div>



</body>
</html>