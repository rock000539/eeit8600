<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後台管理系統</title> 
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/metisMenu.min.css" rel="stylesheet">
<link href="/css/sb-admin-2.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bms-customize.css" rel="stylesheet" >
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/metisMenu.min.js"></script>
<script src="/js/sb-admin-2.js"></script>
<style>
#editArea{
margin: auto auto;
width: 350px;
border: solid 1px black; 
}
fieldset{display:inline;}
li{
margin:5px;
float: top;
background-color: #DDDDDD;
}
#insertArea{
margin: 150px 300px;}
</style>
<script>
$(function(){
	$("#insertIngredient").click(function(){
		var IngredientName=$("#IngredientName").val();
		
		var Ingredients=document.getElementsByClassName("info");

		for(var i=0;i<Ingredients.length;i++){
		 var intName = Ingredients[i].getAttribute("name");
			if(intName==IngredientName){  alert("test");  
			}
			
			}
		
		
	});//end of $("#insertIngredient").click(function(){
})//end of $(function)
</script>
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
                <h1 class="page-header">DashBoard</h1>   
                <!-- **內文中的標題，請修改** -->
                                <!-- **每頁不同的內容從這裡開始** -->
<form action="" id="insertArea">
<input type="text" id="IngredientName" >
<input type="button" id="insertIngredient" value="新增">
</form>


<div id="editArea" class="bg-info">
<ol id="IngredientArea">

<c:forEach var="items" items="${ingredients}">
<fieldset>
<li class="list-inline">
<span class="info" ingredId="${items.ingredId}" name="${items.ingredName}">
${items.ingredName}
</span>
<span class="close" aria-label="Close" ingredId="${items.ingredId}" >&times;</span>

</li>
</fieldset>
</c:forEach>

</ol>
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