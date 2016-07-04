<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script>
$(function(){
	$('#search').click(function (){
		var prodName=$("#prodName").val();

		$.ajax({
		'url':'/prodIngreList/get',
		'data':{"prodName":prodName},
		'type' : 'GET',
		'success': function (data){
			
			$('#productList').empty();
		for(var i=0;i<data.products.length;i++){
			$("#productList").append(
					
	'<tr><td>'+data.products[i].prodName+'</td><td>'
	+data.categorys[i].categoryName+'</td>'
	+'<td><input type="submit" class="checkIngredient btn btn-primary " data-toggle="modal"  data-target="#myModal"  name="'
	+data.products[i].prodId+'" value=查看成份>'
	+'</td></tr>')
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
</head>
<body>

<form action="">
<tr>
<td><input type="text" name="prodName" id="prodName" class="form-control" ></td> 
<td><input type="button" id="search" value="search" class="btn btn-default" style="margin-bottom: 10px;"></td>
</tr>
</form>

<table id="productList" class="table  table-hover"></table>
<div id="showArea"></div>


</body>
</html>