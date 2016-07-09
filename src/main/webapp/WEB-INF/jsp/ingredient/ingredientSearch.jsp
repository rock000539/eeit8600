<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/jquery-ui.min.css" rel="stylesheet" >

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>

<style type="text/css">
#searchbox {
   
    padding: 20px;
    margin: 100px auto;
    background: #fff;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
}
#productTable{
margin: auto auto;
font-size: 14px;}
#productTable img{
width: 100px;
height: 100px;
}
</style>
<script type="text/javascript">
$(function(){//#1
//功能1 成份查找產品--------------------------------

$(".searchProducts").click(function(e){//#1-2
		var IngredientId=e.target.getAttribute("ingredId");
		var ingredName=e.target.name;
		$.ajax({
			url:"/ingredients/IngredientFindProducts",
			data: {"IngredientId":IngredientId},
			type:"POST",
			success:function(data){
				$("#myModalLabel").text("使用"+ingredName+"相關產品清單");
 				$("#productTable tr[name*='productRow']").remove();
 				for(var i=0;i<data.length;i++){
 					$('#productTable').append(
 		 			"<tr name='productRow'><td><img src='../"+data[i].prodimg+"'/>"
 					+"</td><td>"+data[i].prodname
 					+"</td><td>"+data[i].brandcname
 					+"</td><td>"+data[i].mainigdt+"</td></tr>"
 					);//end of for 
 					}
				
 				$('#myModal').modal("toggle");
				} 
			});//end of $.ajax
		
		}//end of $(".searchProducts").click(function(e)#1-2
		);

	
//功能2 自動完成--------------------------------
	var request=$('#IngredientName').val();
    $( "#IngredientName" ).autocomplete({delay: 500,
        source:  function(request, response) {
			var autocompleteData=[];
        	var IngredientName = $('#IngredientName').val();	
			$.ajax({
				url : '/prodIngreList/autocomplete',
				type : 'get',
				data : {"IngredientName":IngredientName},
				success : function(data){ 
					
					for(var i=0;i<data.length;i++){
						autocompleteData[i]=data[i].ingredName;
					}
					response(autocompleteData);
				}
			});
      } 
      });
  //--------------------------------
	
})//end of onload #1 
</script>
</head>
<body>
<div id="searchbox">

<form action="/ingredients/SearchIngredient" class="form-inline">
<table class="table">
<tr>輸入成分之中英文 / 完整 / 部份名稱皆可</tr>
<tr>
<td><input type="text" name="ingredName" id="IngredientName" class="form-control"></td> 
<td><input type="submit" id="search" value="查成份"></td>
</tr>
</table>
</form>

<table class="table">
<tr><td>成份名稱</td><td>中文名稱</td><td>概略特性</td><td>粉刺</td><td>刺激</td><td>安心度</td></tr>
<c:forEach var="items" items="${result}">
<tr>
<td>${items.ingredName}</td>
<td>${items.ingredChName}</td>
<td>${items.ingredChar}</td>
<td>${items.ingredIrritant}</td>
<td>${items.ingredAcne}</td>
<td>${items.ingredSafety}</td>
<td ><input type="button" class="btn btn-default searchProducts" value="查看使用產品資訊" ingredId="${items.ingredId}" name="${items.ingredName}"></td>
</tr>
</c:forEach>
</table>
</div>

<!-- 使用model1 ----------------------------------------------------------------->
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
          	<!-- title 位置 -->
            </h4>
         </div>
         <form id="NewIngredientForm">
         <div class="modal-body" id="modal-body">
<!--在这里添加一些文本-->				
				<table id="productTable" class="table-hover table-bordered">
				<tr><th>產品圖片</th><th>產品名稱</th><th>品牌</th><th>主成分</th></tr>
				</table>
         </div>
         </form>
         <div class="modal-footer">
            <button type="button" class="btn btn-default"   id="cancelInsert"   data-dismiss="modal" >
         	   關閉視窗
            </button>
<!--             <button type="button" class="btn btn-primary" id="insertNewIngredient" > -->
<!--             	   提交更改 -->
<!--             </button> -->
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->

<!-- 結束model1 ----------------------------------------------------------------->

</body>
</html>