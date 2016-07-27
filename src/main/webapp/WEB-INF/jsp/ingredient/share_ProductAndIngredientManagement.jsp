<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>後台管理系統</title> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">

		<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/jflickrfeed.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>

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
!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
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
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			

</body>
</html>