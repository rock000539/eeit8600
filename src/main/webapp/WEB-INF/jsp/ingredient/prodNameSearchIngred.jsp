<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用產品找成份</title>
  
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
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>


<script>
$(function(){
	$('#searchIngredient').click(function (){
		var prodName=$("#prodName").val();
	if(prodName!=""){alert("test");
		$.ajax({
		'url':'/prodIngreList/get',
		'data':{"prodName":prodName},
		'type' : 'POST',
		'success': function (data){
			$('#productList').empty();
			if(data.products.length==0){
				$("#productList").append(
"<div class='alert alert-danger alert-dismissable'><strong>抱歉! </strong> 查無產品資料</div>")
			};
			
		for(var i=0;i<data.products.length;i++){
			$("#productList").append(					
	"<tr><td><img src='/products/show?prodId="+data.products[i].prodId+"'/></td><td>"
	+data.products[i].prodName+"</td><td><p><small>"+data.brands[i].brandName+"</small></p></td><td>"
	+data.categorys[i].categoryName+"</td>"
	+"<td><input type='submit' class='checkIngredient btn-info btn-sm btn-block'"+ 
	"data-toggle='modal'  data-target='#myModal' name='"
	+data.products[i].prodId+"' value=查看成份>"
	+"</td></tr>")
		}//end of for
		//------------------------------------------------------------------------------
		$(".checkIngredient").click(function(e){
			var prodId=e.target.name;
			
			$.ajax({
				url : '/prodIngreList/showIngredient',
				type : 'get',
				data : {"proIdStr":prodId},
				success : function(data){
					$('#showArea td').remove();
					$('#showArea h4').remove();
					$('#myModalLabel').empty();
					$('#myModalLabel').append(data.productName);
					if(data.ingredients.length==0){
						$('#showArea').append(
		"<tr><td colspan='6'><div class='alert alert-danger alert-dismissable'><strong>抱歉! </strong> 查無成份資料</div></td></tr>");
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
	}else{
		alert("請輸入部分或全部產品名");
	}
	})//end search click
		
})//end function

</script>
<style>

.modal {
height: 900px;
margin-top:100px; }
.modal-header{
font-size: 50px;}
#inputForm{
 width: 450px;
 margin: auto auto;
font-size: 14px;
}
#inputTable{
 width: 450px;
}
#searchIngredient{
margin-left:20px;
 }
#productArea{
width: 800px;
margin-top: 50px;
  margin-left: auto;
  margin-right: auto;
}
#productList img{
width:100px;
height: 100px;
}
#productList span{
margin: auto auto;
}
#searchbox { 
    padding: 20px;
    margin: auto auto;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
}
.grey_bg{
min-height: 450px;}
button{color:white;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
	<div class="grey_bg row">	
<!-- top ////////////////////////////////////////////////////-->	
<h2>產品找成份</h2>
<div id="searchbox">	
<form action="" id="inputForm">
<table id="inputTable">
<tr><td colspan="2"><h3>輸入產品之中英文 / 完整 / 部份名稱皆可</h3></td></tr><tr><td colspan="2"><br></td></tr> 
<tr><td><input type="text" name="prodName" id="prodName" class="form-control" ></td>
<td  colspan="2"><button id="searchIngredient" value="查產品" class="btn btn-default btn-lg button" style="margin-bottom: 10px;">查產品</button></td></tr>
</table>
</form>
</div>
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
           <table id="showArea" class="table">
           <tr><th>成份</th><th>中文名稱</th><th>概略特性</th><th>粉刺</th><th>刺激</th><th>安心度</th></tr>
           </table>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">  關閉視窗</button>
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
<!-- top ////////////////////////////////////////////////////-->	
</div> 
	            <!-- **每頁不同的內容結束** -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
</body>
</html>