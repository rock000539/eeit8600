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
	$(search).click(function (){
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
	+data.categorys[i].categoryName+'</td></tr>'
	+'<td><input type="submit" class="checkIngredient btn btn-primary " data-toggle="modal"  data-target="#myModal"  name="'
	+data.products[i].prodId+'" value=查看成份/>'
	+'</td>')
		}//end of for
		//------------------------------------------------------------------------------
		$(".checkIngredient").click(function(e){
			var prodId=e.target.name;
			
			$.ajax({
				url : '/prodIngreList/showIngredient',
				type : 'get',
				data : {"proIdStr":prodId},
				success : function(data){
					$('#myModalLabel').append(data.productName);
					for(var i=0;i<data.ingredients.length;i++){							
 						$('#showArea').append(
 						'<tr><td>'+data.ingredients[i].ingredName
 						+'</td><td>'+data.ingredients[i].ingredChName
 						+'</td><td>'+data.ingredients[i].ingredChar
 						+'</td><td>'+data.ingredients[i].ingredIrritant
 						+'</td><td>'+data.ingredients[i].ingredAcne
 						+'</td><td>'+data.ingredients[i].ingredSafety+'</td></tr>')
 					}//end for 
					
					$('#findIngredient').modal('show');
				$('#productList').empty();
				}//end of success
			});	
			
		});//end of $(".checkIngredient").click
		
		//------------------------------------------------------------------------------
		}

	});	
	
	})//end search click
		
})//end function

</script>
</head>
<body>
<form action="">
<input type="text" name="prodName" id="prodName" > 
<input type="button" id="search" value="search">
</form>

<!-- Button trigger modal -->
<h2>(Create Modal）</h2>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" 
   data-target="#myModal">
  button
</button>

<!-- 模态框（Modal） -->
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


<table id="productList" ></table>

</body>
</html>