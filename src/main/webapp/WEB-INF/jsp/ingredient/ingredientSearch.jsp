<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find by Ingredient</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    <link href="/css/jquery-ui.min.css" rel="stylesheet" >
	<!-- Scripts -->

	<script src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	
	
	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/jflickrfeed.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>   
<!-- 	<script type="text/javascript" src="/js/ingredient/ingredientSearch.js"></script>  -->
<script>
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
	 				if(data.length==0){$('#productTable').append(
	 	"<tr name='productRow'><td colspan='5'><div class='alert alert-danger alert-dismissable'><strong>抱歉! </strong> 查無產品資料</div></td></tr>"					
	 				);
	 					}
	 				for(var i=0;i<data.length;i++){
	 					$('#productTable').append(
	 		 			"<tr name='productRow'><td><a href='/products/view/"+data[i].prodId+"'><img src='/products/show?prodImg="+data[i].prodimg+"'/>"
	 					+"</a></td><td><a href='/products/view/"+data[i].prodId+"'>"+data[i].prodname
	 					+"</td></a><td>"+data[i].brandcname
	 					+"</td><td>"+data[i].mainigdt+"</td><td>"+data[i].concentration+"</td></tr>"
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
<style type="text/css">
body {
	font-family: Microsoft JhengHei, "Open Sans",Helvetica,Arial,sans-serif;	
}

.modal {
height: 900px;
margin-top:100px; }
.modal-header{
font-size: 50px;}
#searchbox { 
    padding: 20px;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    width: 800px;
    margin: auto auto;
}
#productTable{
margin: auto auto;
font-size: 14px;}
#productTable img{
width: 100px;
height: 100px;
}
#inputForm{
width:450px;
margin: auto auto;
font-size: 14px;
}
#searchBtn{
margin-left:20px; }
#IngredientName.width-remove{
    width : auto;
}
.grey_bg{
min-height: 650px;
/* background-image: url("/images/IngredientBackground.jpg"); */
-moz-background-size:cover;
-webkit-background-size:cover;
-o-background-size:cover;
background-size:cover;
}

</style>

</head>
<body>
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			<!-- **每頁不同的內容從這裡開始** -->
<div class="grey_bg row">
<div id="searchbox">
	<h2>單一成份查詢</h2>
	<form action="/ingredients/SearchIngredient" method="post">
	<table id="inputForm">
	<tr><td colspan="2"><h3>輸入成份之中英文 / 完整 / 部份名稱皆可</h3></td></tr><tr><td colspan="2"><br></td></tr>
	<tr>
		<td><input type="text" name="ingredName" id="IngredientName" class="form-control" style="border-radius:20px;"></td> 
		<td><input type="submit" class="btn btn-default btn-lg button"id="searchBtn" value="查成份"></td>
	</tr>
	</table>
	</form>

<div class="ingredientArea">
<br><br><br>
	<table class="table table-hover">

		<c:if test="${empty result}">
		<tr><td>使用說明:</td></tr>
		<tr><td>步驟一: 輸入部分成份關鍵字，選擇成份</td></tr>
		<tr><td>步驟二: 在產品右方按鈕即可查看有使用此成份的產品資訊</td></tr>
		</c:if>

	<c:if test="${not empty result}">
	<tr><th>成份名稱</th><th>中文名稱</th><th>概略特性</th><th>粉刺</th><th>刺激</th><th>安心度</th></tr>

	<c:forEach var="items" items="${result}">
	<tr>
		<td>${items.ingredName}</td>
		<td>${items.ingredChName}</td>
		<td>${items.ingredChar}</td>
		<td>${items.ingredIrritant}</td>
		<td>${items.ingredAcne}</td>
		<td>${items.ingredSafety}</td>
		<td ><button class="btn-info btn-sm btn-block searchProducts" value="查看使用產品資訊" ingredId="${items.ingredId}" name="${items.ingredName}">查看使用產品資訊</button></td>
	</tr>
	</c:forEach>

	</c:if>

	<c:set var="items" value="${resultStr}" scope="request"></c:set>
	<c:if test="${items}" >
	<tr><td><div class="alert alert-danger alert-dismissable">請輸入文字進行搜尋</div></td></tr>
	</c:if>
	</table>
</div>

</div>
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
				<table id="productTable" class="table">
				<tr><th>產品圖片</th><th>產品名稱</th><th>品牌</th><th>主成分</th><th>主成分濃度</th></tr>
				</table>
         </div>
         </form>
         <div class="modal-footer">
            <button type="button" class="btn btn-default"   id="cancelInsert"   data-dismiss="modal" >
         	   關閉視窗
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->

<!-- 結束model1 ----------------------------------------------------------------->
				</div>        
            <!-- **每頁不同的內容結束** -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			

</body>
</html>