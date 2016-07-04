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
		//------------------------------------------------------------------------------
		$(".checkIngredient").click(function(e){
			var prodId=e.target.name;
			
			$.ajax({
				url : '/prodIngreList/showIngredient',
				type : 'get',
				data : {"proIdStr":prodId},
				success : function(data){
					$('#showArea').empty();
					$('#myModalLabel').empty();
					$('#myModalLabel').append(data.productName);
					if(data.ingredients.length==0){
						$('#showArea').append("<h4>抱歉目前沒有此產品成份資料<h4>");
					}else{
					for(var i=0;i<data.ingredients.length;i++){							
 						$('#showArea').append(
 						'<tr><td>'+data.ingredients[i].ingredName
 						+'</td><td>'+data.ingredients[i].ingredChName
 						+'</td><td>'+data.ingredients[i].ingredChar
 						+'</td><td>'+data.ingredients[i].ingredIrritant
 						+'</td><td>'+data.ingredients[i].ingredAcne
 						+'</td><td>'+data.ingredients[i].ingredSafety+'</td></tr>')
 					}//end for 
					}//end if else
					$('#findIngredient').modal('show');
				
				}//end of success
			});	
			
		});//end of $(".checkIngredient").click
		
		//------------------------------------------------------------------------------
		}

	});	
	
	})//end search click
		
})//end function

</script>
<style>
h3{   text-align: center;
}
.form-inline{
 width: 320px;
 margin-top:100px;
  margin-left: auto;
  margin-right: auto;
}
#productArea{
width: 500px;
margin-top: 50px;
  margin-left: auto;
  margin-right: auto;

}
</style>
</head>
<body>
<form action="" class="form-inline">
<table>
<tr><td colspan="2"><h3>請輸入產品名稱或部分名稱</h2></td></tr>
<tr><td><input type="text" name="prodName" id="prodName" class="form-control" ></td> 
<td><input type="button" id="search" value="search" class="btn btn-default" style="margin-bottom: 10px;"></td></tr>
</table>
</form>

<!-- Button trigger modal -->



<!-- <button class="btn btn-primary btn-lg" data-toggle="modal" 
   data-target="#myModal">
  button
</button>  這示button的範例-->

<!-- （Modal部分） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">

            </h4>
         </div>
         <div class="modal-body" >
           <table id="showArea" class="table table-hover">
           <tr><td>成份</td><td>中文名稱</td><td>概略特性</td><td>粉刺</td><td>刺激</td><td>安心度</td></tr>
           </table>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
<!--             <button type="button" class="btn btn-primary"> -->
<!--            Submit </button> -->
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
<!-- **每頁不同的內容 end** -->

<div id="productArea">
<table id="productList" class="table  table-hover"></table>
</div>
</body>
</html>