<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${nickname}'s Expiration List</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
	<!-- customize -->
    <link rel="stylesheet" href="/css/member/member-customize.css">
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
	background-color: #DDD5C9;  /*beige default*/  /* #98DaD6 blue  #4FBAAA*/
	border-bottom: 1px solid #C6BFB4;
	color: #ffffff;
	text-align: center;
	padding: 10px;
}
.pink{
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
.portfolio-btn {
	margin-top: 20px;
}
p.bell{
	font-size: 16px;
	line-height: 36px;
	color: #000;
}
.bell span{
	font-size: 20px;
}
div.expinfo{
	text-align: left;
	padding-left: 10px;
	font-size: 14px;
	line-height: 16px;
}
.expinfo tr{
	text-align: left;
	height: 25px;
	font-size: 14px;
	line-height: 16px;
}
td.info{
	font-size: 14px;
	line-height: 16px;
	padding-right: 10px;
}
td.data{
	font-family: "Irvin Display",Georgia,"Times New Roman",Times,serif;
	font-style: normal;
	font-size: 15px;
	color: #000;
	vertical-align: middle;
}
.modal-content{
	text-align: center;
	padding: 10px;
}
.modal-content h2{
	font-weight: 400;
}
.btn-delete{
	background:#8A817C;
}
</style>
</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
<div class="row detail-div">
	<div class="col-lg-10 col-sm-6 wow fadeInLeft delay-05s memberDiv">
		<c:import url="/WEB-INF/jsp/member/memberPages-header.jsp" />
		
		
<!-- Page Content -->
<div class="col-lg-12">
<!-- ExpDate Row -->
<div id="exprow" class="row">
	<c:forEach items="${beans}" var="item">
    <div class="col-md-4 portfolio-item" dateId="${item.expDate.dateId}">
    	<div class="portfolio-all">
    		<c:set var="expDays" value="${item.lastsDay}"></c:set>
	    	<c:if test="${expDays>60}">
	    	<div class="portfolio-title">
	    		<small>${item.brandName}</small>
		        <h3>${item.product.prodName}</h3>
		    </div>
		    </c:if>
		    
		    <c:if test="${expDays<60}">
		    	<div class="portfolio-title pink">
	    		<small>${item.brandName}</small>
		        <h3>${item.product.prodName}</h3>
		    </div>
		    </c:if>
		    <div class="portfolio-content">
		        <div class="portfolio-img"><a href="#">
		            <img src="/products/show?prodImg=${item.product.prodImg}"/>
		        </a></div>
		        <p class="bell"><i class="fa fa-bell-o"></i> Valid for &nbsp;<span>${item.lastsDay}</span>&nbsp;Days</p>
		        <div class="expinfo">
			        <table>
			        <tr><td class="info">Production&nbsp;&nbsp;</td><td class="data">${item.mfd}</td></tr>
			        <tr><td class="info">Expiration&nbsp;&nbsp;</td><td class="data">${item.exp}</td></tr>
			        <tr><td class="info">BatchCode&nbsp;&nbsp;</td><td class="data">${item.batchCode}</td></tr>
			        </table>
		        </div>
		        <div class="portfolio-btn">
				    <button type="button" name="${item.expDate.dateId}" class="btn btn-default btn-delete" data-toggle="modal" data-target="#myModal">Delete</button>
				</div>
	        </div> <!-- portfolio-content -->
        </div> <!-- portfolio-all -->
    </div><!-- portfolio -->
    </c:forEach>
</div> <!-- /.row -->
</div> <!-- col -->


<div id="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
    	<h2>Do you want to delete ${product.prodName} ?</h2>
    	<br>
    	<button id="del-confirm" class="btn btn-default">Confirm</button>
    </div>
  </div>
</div>


	</div> <!-- col-lg -->
	
	<c:import url="/WEB-INF/jsp/member/memberPages-nav.jsp" />
	
</div> <!-- row -->

</div> <!-- grey_bg -->       
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
<script src="/js/member/member.js"></script>
<script>
$(function(){
    $('.btn-delete').click(function(e){
    	var dateIdStr=e.target.name;
    	var target=e.target;
    	
    	$('#del-confirm').click(function(){
    	
    		$.ajax({
        		url:'/expdate/delete',
          		type : 'GET',
          		data : {"dateIdStr":dateIdStr},
          		success : function(result){
          			$(".portfolio-item[dateId*="+dateIdStr+"]").remove();
          			$('#myModal').modal('toggle');
          			
          		}
        	});
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