<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find by Product</title>
  
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

<script src="/js/ingredient/prodNameSearchIngred.js"></script>

<style>
body {
	font-family: Microsoft JhengHei, "Open Sans",Helvetica,Arial,sans-serif;	
}
.modal {
height: 900px;
margin-top:100px; }
.modal-header{
font-size: 50px;}
#inputForm{

}
#inputTable{
 width: 450px;
 margin: auto auto;
font-size: 14px;
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
min-height: 650px;
/* background-image: url("/images/IngredientBackground.jpg"); */
-moz-background-size:cover;
-webkit-background-size:cover;
-o-background-size:cover;
background-size:cover;
}
button{color:white;
}
#myModal{
margin-top: 25px;}
.icon1 {
	 color:white;
	 opacity: 1;
	 font-size: 5em;
	 text-align:center;
	 margin-top: 300px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
	<div class="grey_bg row">	
<!-- top ////////////////////////////////////////////////////-->	

<div id="searchbox">	
<h2>化妝品成份搜尋</h2>
<table id="inputTable">
<tr><td colspan="2"><h3>輸入產品之中英文 / 完整 / 部份名稱皆可</h3></td></tr><tr><td colspan="2"><br></td></tr> 
<tr><td><form  id="inputForm"><input type="text" name="prodName" id="prodName" class="form-control" style="border-radius:20px;" ></form></td>

<td  colspan="2"><button id="searchIngredient" value="查產品" class="btn btn-default btn-lg button" style="margin-bottom: 10px;">查產品</button></td></tr>
</table>

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
<table id="productList" class="table  table-hover">
<tr><td>使用說明:</td></tr>
<tr><td>步驟一: 輸入產品部分關鍵字，選擇產品</td></tr>
<tr><td>步驟二: 在產品右方按鈕即可查看成份資訊</td></tr>
</table>
</div>
<!-- top ////////////////////////////////////////////////////-->	
</div> 
	            <!-- **每頁不同的內容結束** -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
</body>
</html>