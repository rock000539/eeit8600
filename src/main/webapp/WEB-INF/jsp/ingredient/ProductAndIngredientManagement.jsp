<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/metisMenu.min.css" rel="stylesheet">
<link href="/css/sb-admin-2.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bms-customize.css" rel="stylesheet" >

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後台管理系統</title> 	
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/metisMenu.min.js"></script>
<script src="/js/sb-admin-2.js"></script>

	<script src="/js/jquery.dropotron.min.js"></script>


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
					"<tr><td><img src='/products/show?prodId="+data.products[i].prodId+"'/></td><td>"
					+data.products[i].prodName+"</td><td>"
					+data.categorys[i].categoryName+"</td>"
					+"<td><input type='submit' class='checkIngredient btn btn-primary'"+ 
					"data-toggle='modal'  data-target='#myModal' name='"
					+data.products[i].prodId+"' value=查看成份>"
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
<!-- 內文全部用wrapper包起來 -->
<div id="wrapper">

<!-- 加入上方及側邊Nav-Bar -->	
<c:import url="../bms_header.jsp" />
<c:import url="../bms_navbar-side.jsp" />
<!-- ?? url有沒有更好的寫法 ?? -->


<!-- Page Content --> 
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">產品成分清單管理</h1>   <!-- **內文中的標題，請修改** -->
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