<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後台管理系統</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    <link href="/css/jquery-ui.min.css" rel="stylesheet" >
    	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
		<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/jflickrfeed.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>
	
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/js/ingredient/share_editIngredient.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/css/bootstrap-modal.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modal.min.js"></script>


<style>
body {
font-family: Microsoft JhengHei, "Open Sans",Helvetica,Arial,sans-serif;	
}
#insertArea{
font-size: 15px;
}
#editArea{
 margin-left: 40px; 
/* width: 550px;  */
font-size: 20px; 
}
fieldset{
display:inline;
}
#editArea li{
margin:5px;
float: left;
color: black;
}
.error{
color:red;
}
#proTitle{
font-size: 24px;
color: black;
}


#editIngredient{
color:white;
}
#insertIngredient{
color:white;
}
.mainSpace{
min-height: 500px;
background-image: url("/images/IngredientBackground.jpg");
-moz-background-size:cover;
-webkit-background-size:cover;
-o-background-size:cover;
background-size:cover;
}
</style>

</head>
<body>
	<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
<div class="mainSpace row">                              
                                
	<div class="row">
	<br>
	<div class="col-md-4"></div>
	<div class="col-md-6">
	<br>
	<span id="proTitle" proid="${productId}">${productName}</span>
	</div>
	<div class="col-md-2"></div>
	</div>


	<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-6">
	<br><br>
	<form action="" id="insertArea">
	<input class="ui-widget ui-autocomplete-input" autocomplete="on" id="IngredientName" >
	<ul class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content" id="ui-id-1" tabindex="0" style="display: none; top: 29px; left: 44px; width: 159px;">
	<li class="ui-menu-item" id="ui-id-12" tabindex="-1">AppleScript</li></ul>
	<span role="status" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></span>
	&nbsp; 
	<input type="button" class="btn btn-default" id="insertIngredient" value="新增">
	&nbsp; 
	<input type="submit" class="btn btn-default">
	</form>
	</div>
	<div class="col-md-2"></div>
	</div>


	<div class="row">
	<div class="col-md-3"></div>
	<div id="editArea"  class="col-md-6">
	<br><br>
		<ol id="IngredientArea">
		<c:forEach var="items" items="${ingredients}">
			<fieldset >
			<li class="list-inline">
			<span class="IngredientInfo" ingredId="${items.ingredId}" name="${items.ingredName}">
			${items.ingredName}
			</span>
			<span class="close" aria-label="Close" ingredId="${items.ingredId}" >&times;</span>
			</li>
			</fieldset>
		</c:forEach>
		</ol>

	</div>
	<div class="col-md-3"></div>
	</div>
	<br><br>
	
   	<div class="row">
   		<div  class="col-md-5"></div>
		<div id="submitArea"  class="col-md-5">
		<input type="button" class="btn btn-default" id="editIngredient" value="確認修改">
		</div> 
		<div  class="col-md-2"></div>
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
            您輸入了新的成份，請填寫詳細成份資料
            </h4>
         </div>
         <form id="NewIngredientForm">
         <div class="modal-body" id="modal-body">
<!--在这里添加一些文本-->				
				<table>
			
				<tr><td>Ingredient Name</td><td><input type="text" name ="ingredName" id="NewingredName"></td></tr>
				<tr><td>Character</td><td><input type="text" name ="ingredChar" id="NewIngredChar"></td><td><small>Describe the ingredient</small></td></tr>
				<tr><td>Irritating</td><td><input type="text" name ="ingredIrritant" id="NewIngredIrritant"></td></tr>
				<tr><td>Acne</td><td><input type="text" name ="ingredAcne" id="NewIngredAcne"></td></tr>
				<tr><td>Safety</td><td><input type="text" name ="ingredSafety" id="NewIngredSafety"></td></tr>
				</table>
         </div>
         </form>
         <div class="modal-footer">
            <button type="button" class="btn btn-default"   id="cancelInsert"   data-dismiss="modal" >取消新增
            </button>
            <button type="button" class="btn btn-primary" id="insertNewIngredient" >
               提交更改
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
<!-- 結束model1 ----------------------------------------------------------------->
<!-- 使用model2 ----------------------------------------------------------------->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel2" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h2>感謝您的支持，讓我們更好</h2>
            <h4 class="modal-title" id="myModalLabel2">
               ${productName}成份清單 
            </h4>
         </div>
         <div class="modal-body" id="modal-body2">
<!-- 添加一些文本22222			 -->
		<table>
		
		</table>
			
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">重新修改
            </button>
           <a href="/ingredients/main" >
           <button type="button" class="btn btn-primary">
               	確認
            </button></a>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
<!-- 結束model2 ----------------------------------------------------------------->
</div>  
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			


</body>
</html>