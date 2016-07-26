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
#submitArea{
margin: 30px 350px;}
</style>

</head>
<body>
	<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
                                
                                
<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
	<br>
	<span id="proTitle" proid="${productId}">${productName}</span>
	</div>
	<div class="col-md-3"></div>
</div>


<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
	<br><br>
	<form action="" id="insertArea">
	<input class="ui-widget ui-autocomplete-input" autocomplete="on" id="IngredientName" >
	<ul class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content" id="ui-id-1" tabindex="0" style="display: none; top: 29px; left: 44px; width: 159px;">
	<li class="ui-menu-item" id="ui-id-12" tabindex="-1">AppleScript</li></ul>
	<span role="status" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></span>
	<input type="button" class="btn btn-default" id="insertIngredient" value="新增">
	<input type="submit" class="btn btn-default">
	</form>
	</div>
	<div class="col-md-3"></div>
</div>


<div class="row">
	<div class="col-md-2"></div>
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
	<div class="col-md-4"></div>
</div>

   
<div id="submitArea">
<input type="button" class="btn btn-default" id="editIngredient" value="確認修改">
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
			
				<tr><td>成份</td><td><input type="text" name ="ingredName" id="NewingredName"></td></tr>
				<tr><td>中文名稱</td><td><input type="text" name ="ingredChName" id="NewingredChName"></td></tr>
				<tr><td>特性</td><td><input type="text" name ="ingredChar" id="NewIngredChar"></td></tr>
				<tr><td>刺激度</td><td><input type="text" name ="ingredIrritant" id="NewIngredIrritant"></td></tr>
				<tr><td>致粉刺性</td><td><input type="text" name ="ingredAcne" id="NewIngredAcne"></td></tr>
				<tr><td>安心度</td><td><input type="text" name ="ingredSafety" id="NewIngredSafety"></td></tr>
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

<!-- 結束model1 ----------------------------------------------------------------->


	            <!-- **每頁不同的內容 end** -->     
			    </div><!-- /end .col-md-12 -->
			</div> <!-- /end .row -->
		</div>
		<!-- /end #content -->
		<!-- scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- /end page container -->

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
           <a href="/prodIngreList/list" >
           <button type="button" class="btn btn-primary">
               	確認
            </button></a>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
<!-- 結束model2 ----------------------------------------------------------------->
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			
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

</body>
</html>