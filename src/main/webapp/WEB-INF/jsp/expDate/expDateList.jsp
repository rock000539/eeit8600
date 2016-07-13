<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>My Cosmetic Expired List</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
	<link href="/css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
	<!-- Scripts -->
	<script src="/js/jquery-ui.min.js"></script>
	<script src="https://use.typekit.net/riz5mva.js"></script>
	<script>try{Typekit.load({ async: true });}catch(e){}</script>

<style>
body {
	font-family: source-han-sans-traditional, Microsoft JhengHei, sans-serif;
	padding-top: 70px;
}
.portfolio-item {
 	padding: 15px; 
}
.portfolio-all {
	background-color: #ffffff;
}
.portfolio-title{
	height: 70px;
	background-color: #98DaD6;  /*blue*/
	border-bottom: 1px solid #4FBAAA;
	color: white;
	text-align: center;
	padding: 10px;
}
#exprow div:nth-child(3n+1) .portfolio-title{ 
	background-color: #FF9985;  /*pink F28E98*/
	border-bottom: 1px solid #D97F88; 
} 
#exprow div:nth-child(3n+2) .portfolio-title{ 
	background-color: #FFDFC8;  /*beige*/
	border-bottom: 1px solid #E5C8B3; 
} 
.portfolio-title h3 {
	font-size: 15px;
 	line-height: 15px; 
	color: #ffffff;
	margin: 5px;
}
.portfolio-title small {
	font-size: 22px;
	margin: 10px;
}
.portfolio-content {
	border: 1px solid #E7E6E6;
	padding: 30px;
	text-align: center;
}



</style>


</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">

<!-- Page Content -->
<div class="container-fluid">
<div class="col-lg-2"></div>
<div class="col-lg-10">
    <!-- Page Header -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">文章收藏 <small>討論區</small></h1>
        </div>
    </div>
    <!-- /.row -->
<!-- ExpDate Row -->
<div id="exprow" class="row">
	<c:forEach items="${beans}" var="items">
    <div class="col-md-4 portfolio-item">
    	<div class="portfolio-all">
	    	<div class="portfolio-title">
	    		<small>${items.brandName}</small>
		        <h3>${items.product.prodName}</h3>
		    </div>
		    <div class="portfolio-content">
		        <a href="#">
		            <img src="/products/show?prodId=${items.product.prodId}"/>
		        </a>
		        <h3><a href="#">Project Name</a></h3>
		        <p>製造日期 ${items.mfd}</p>
		        <p>到期日 ${items.exp}</p>
		        <p>還有&nbsp;${items.lastsDay}&nbsp;天到期</p>
	        </div>
        </div>
    </div><!-- portfolio -->
    </c:forEach>
</div> <!-- /.row -->
</div> <!-- col -->
</div> <!-- container -->



<!-- ////////////////////////////////////////////////////////////////////-->
<div id="mainSpace">
<table class="table table-hover">
<tr><td>產品圖片</td>
	<td>產品名稱</td>
	<td>製造日</td>
	<td>到期日</td>
	<td colspan="2"></td></tr>
<c:forEach items="${beans}" var="items">
 <tr>
 	<td><img src="/products/show?prodId=${items.product.prodId}"/></td>
 	<td>${items.product.prodName}</td>
	<td>${items.mfd}</td> 
	<td>${items.exp}</td> 	
	
	<td><input type="button" name="edit" value="edit" id="editDate" onclick='location="/expdate/edit?dateId=${items.expDate.dateId}"'></td>
	<td><input type="button" name="${items.expDate.dateId}" value="deleteDate" class="deleteDate" ></td>
	
</tr>
</c:forEach>

</table>
</div>
<!-- 跳出刪除確認視窗 -->
<div id="dialog-confirm" title="確定刪除這筆資料?" style="display: none">
<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;" ></span>資料刪除後將不可回復<!-- 可在此輸入文字加在跳出視窗說明--></p>
</div>
<!-- ////////////////////////////////////////////////////////////////////-->


</div>        
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
<script type="text/javascript" src="/js/fms/fms-main.js"></script>
<script>
$(function(){
 
    $('.deleteDate').click(function(e){
    	var dateIdStr=e.target.name;
    	var target=e.target;
    	console.log(dateIdStr);
    	console.log(target);
	//----dialog--------------------------
	   $( "#dialog-confirm" ).dialog({
        resizable: false,
        height:190,width:300,
        modal: true,
        buttons: {
          "刪除確認": function() {
      // 刪除功能--------------------------------        
          	$.ajax({
      		url:'/expdate/delete',
      		type : 'GET',
      		data : {dateIdStr:dateIdStr},
      		success : function(date){
      		
      		$(target).parent().parent().remove();
      		}
      		})
      // 刪除功能-------------------------------- 		
      		
            $( this ).dialog( "close" );
          },
          "取消": function() {
            $( this ).dialog( "close" );
          }
        }
      });

    });//end $('#delete').click
	
    /*----------------------------------------------------*/
    /*	Same Height Div's
     /*----------------------------------------------------*/
    if(jQuery.isFunction(jQuery.fn.matchHeight)){
        $('.same-height').matchHeight();
    }
})
</script>		
</body>
</html>