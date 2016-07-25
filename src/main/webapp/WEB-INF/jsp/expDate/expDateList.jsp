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
	<script src="/js/jquery.min.js"></script>

<style>
body {
	font-family: Microsoft JhengHei, "Open Sans",Helvetica,Arial,sans-serif;
}
.portfolio-item {
 	padding: 15px; 
}
.portfolio-item:hover .portfolio-content{
	border-bottom-color:#727CB6; 
}

.portfolio-all {
	background-color: #ffffff;
	margin-bottom: 10px;
}

.portfolio-title{
	height: 60px;
	background-color: #98DaD6;  /*blue */
	border-bottom: 1px solid #4FBAAA;
	color: #ffffff;
	text-align: center;
	padding: 10px;
}
#exprow div:nth-child(3n+2) .portfolio-title{
	background-color: #DDD5C9;	/*beige*/
	border-bottom: 1px solid #C6BFB4;
} 
#exprow div:nth-child(3n+3) .portfolio-title{
	background-color: #FF9985;	/*pink*/
	border-bottom: 1px solid #D97F88;
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
	padding: 5px 10px 30px 10px;
	text-align: center;
}
.portfolio-content h3 {
	font-size: 15px;
 	line-height: 15px; 
}
.portfolio-img {
	margin: 0 auto;
	height: 130px;
	width: 130px;
	overflow:hidden;
}
.portfolio-content img{
	height: 130px;
	width: 130px;
}
.portfolio-content p {
	line-height: 1.1;
	margin: 5px;
	font-size: 15px;
}
.portfolio-btn {
	margin-top: 20px;
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
        <div class="col-lg-12 deviderHeading text-center">
            <h4 class="page-header">產品到期日</h4>
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
		        <div class="portfolio-img"><a href="#">
		            <img src="/products/show?prodImg=${items.product.prodImg}"/>
		        </a></div>
		        <p><i class="fa fa-bell-o"></i>&nbsp; 還有&nbsp;${items.lastsDay}&nbsp;天到期</p>
		        <p>製造日期 ${items.mfd}</p>
		        <p>到期日 ${items.exp}</p>
		        <div class="portfolio-btn">
				    <button class="btn btn-default">修改</button> &nbsp;
				    <button class="btn btn-default deleteDate" name="${items.expDate.dateId}">刪除</button>

				</div>
	        </div> <!-- portfolio-content -->
        </div> <!-- portfolio-all -->
    </div><!-- portfolio -->
    </c:forEach>
</div> <!-- /.row -->
</div> <!-- col -->
</div> <!-- container -->


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
<script src="/js/jquery-ui.min.js"></script>
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
      		data : {"dateIdStr":dateIdStr},
      		success : function(date){
      		
      		$(target).parent().parent().parent().parent().remove();
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