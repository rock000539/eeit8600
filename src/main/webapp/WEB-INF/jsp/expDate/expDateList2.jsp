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
	padding-top: 70px;
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


$closed-width: 100px;
$closed-height: 80px;
$opened-width: 400px;
$opened-height: 160px;
@import url(http://fonts.googleapis.com/css?family=Roboto:400,700);
html,
body {
  width: 100%;
  height: 100%;
  margin: 0;
  user-select: none;
}

body {
  display: flex;
  font-family: Roboto, "Helvetica Neue", sans-serif;
  font-size: 18px;
  perspective: 1000px;
  background-color: #f5f5f5;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.description {
  margin-top: 50px;
  text-align: center;
  color: #999;
  transition: opacity 0.3s ease;
}

.description a {
  color: #4A9DF6;
  text-decoration: none;
}

.btnDelete.is-open ~ .description {
  opacity: 0;
}

.btnDelete {
  display: inline-block;
  position: relative;
  width: 120px;
  height: 40px;
  transition: width 0.8s cubic-bezier(0.230, 1.000, 0.320, 1.000), height 0.8s cubic-bezier(0.230, 1.000, 0.320, 1.000), transform 0.8s cubic-bezier(0.175, 0.885, 0.320, 1.275);
  transform-style: preserve-3d;
  transform-origin: 50% 50%;
  text-align: center;
}

.btnDelete-front {
  position: absolute;
  display: block;
  width: 100%;
  height: 100%;
  line-height: 50px;
  background-color: #F44336;
  color: #fff;
  cursor: pointer;
  backface-visibility: hidden;
  -webkit-tap-highlight-color: rgba( 0, 0, 0, 0);
  transition: background 0.15s ease, line-height $0.8s cubic-bezier(0.230, 1.000, 0.320, 1.000);
}

.btnDelete-front:hover {
  background-color: lighten(#F44336, 10%);
}

.btnDelete.is-open .btnDelete-front {
  pointer-events: none;
  line-height: 80px;
}

.btnDelete-back {
  position: absolute;
  width: 100%;
  height: 100%;
  background-color: #eee;
  color: #222;
  transform: translateZ(-2px) rotateX(180deg);
  overflow: hidden;
  transition: box-shadow 0.8s ease;
  font-size: 14px;
}

.btnDelete-back p {
  margin-top: 27px;
  margin-bottom: 25px;
}

.btnDelete-back button {
/*   padding: 12px 20px; */
  width: 30%;
  margin: 0 5px;
/*   background-color: transparent; */
  border: 0;
  border-radius: 2px;
  font-size: 1em;
  cursor: pointer;
  -webkit-appearance: none;
  -webkit-tap-highlight-color: rgba( 0, 0, 0, 0);
  transition: background 0.15s ease;
  
  focus {
    outline: 0;
  }
}
.btnDelete-back button:focus{ outline: 0;}

.Deleteyes{
    background-color: #2196F3;
    color: #fff;
    margin-top: 20%;
   
}
.Deleteyes:hover{
background-color: lighten(#2196F3, 10%);
}

.Deleteno {
color: #2196F3;
background-color: #ddd;
margin: auto auto;
}
.Deleteno:hover{
background-color: #ddd;

}


.btnDelete.is-open .btnDelete-back {
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
}

.btnDelete[data-direction="left"] .btnDelete-back,
.btnDelete[data-direction="right"] .btnDelete-back {
  transform: translateZ(-2px) rotateY(180deg);
}

.btnDelete.is-open {
  width: 120px;
  height: 40px;
}

.btnDelete[data-direction="top"].is-open {
  transform: rotateX(180deg);
}

.btnDelete[data-direction="right"].is-open {
  transform: rotateY(180deg);
}

.btnDelete[data-direction="bottom"].is-open {
  transform: rotateX(-180deg);
}

.btnDelete[data-direction="left"].is-open {
  transform: rotateY(-180deg);
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
		            <img src="/products/show?prodId=${items.product.prodId}"/>
		        </a></div>
		        <p><i class="fa fa-bell-o"></i>&nbsp; 還有&nbsp;${items.lastsDay}&nbsp;天到期</p>
		        <p>製造日期 ${items.mfd}</p>
		        <p>到期日 ${items.exp}</p>
		        
<!-- //////////////////////////////////////// -->

<div class="portfolio-btn">
 <div class="btnDelete">
  <div class="btnDelete-back">
    <button class="Deleteyes "name="${items.expDate.dateId}">Yes</button>
    <button class="Deleteno">No</button>
  </div>
  <div class="btnDelete-front">Edit</div>
</div>

<div class="btnDelete">
  <div class="btnDelete-back">
    <button class="Deleteyes deleteDate"name="${items.expDate.dateId}">Yes</button>
    <button class="Deleteno">No</button>
  </div>
  <div class="btnDelete-front">Delete</div>
</div>
  </div>
 <!-- ////////////////////////////// -->

				
	        </div> <!-- portfolio-content -->
        </div> <!-- portfolio-all -->
    </div><!-- portfolio -->
    </c:forEach>
</div> <!-- /.row -->
</div> <!-- col -->
</div> <!-- container -->



<!-- <div id="dialog-confirm" title="確定刪除這筆資料?" style="display: none"> -->
<!-- <p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;" ></span>資料刪除後將不可回復可在此輸入文字加在跳出視窗說明</p> -->
<!-- </div> -->
<!-- ////////////////////////////////////////////////////////////////////-->




</div>        

            <!-- **每頁不同的內容結束** -->
<!-- 跳出刪除確認視窗 -->

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
        // 刪除功能--------------------------------        
      	$.ajax({
  		url:'/expdate/delete',
  		type : 'GET',
  		data : {"dateIdStr":dateIdStr},
  		success : function(date){
  		
  		$(target).parent().parent().parent().parent().parent().parent().remove();
  		}
  		})
  // 刪除功能-------------------------------- 	
	//----dialog--------------------------
	   $( "#dialog-confirm" ).dialog({
        resizable: false,
        height:190,width:300,
        modal: true,
        buttons: {
          "刪除確認": function() {
	
      		
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
    /*----------------------------------------------------*/
    
})
</script>	
<script>
$(function(){
var btn = document.getElementsByClassName( 'btnDelete' );

for(var i=0;i<btn.length;i++){
	var btnIn=btn[i];
	var btnFront = btn[i].querySelector( '.btnDelete-front' ),
   		 btnYes = btn[i].querySelector( '.btnDelete-back .Deleteyes' ),
         btnNo = btn[i].querySelector( '.btnDelete-back .Deleteno' );
	btnFront.addEventListener("click",function( event ) {
  
	var mx = event.clientX - btnIn.offsetLeft,
      my = event.clientY -btnIn.offsetTop;

  	var w = btnIn.offsetWidth,
      h = btnIn.offsetHeight;
	
 	 var directions = [
    { id: 'top', x: w/2, y: 0 },
    { id: 'right', x: w, y: h/2 },
    { id: 'bottom', x: w/2, y: h },
    { id: 'left', x: 0, y: h/2 }
  	];
  
  	directions.sort( function( a, b ) {
    return distance( mx, my, a.x, a.y ) - distance( mx, my, b.x, b.y );
  	} );
  	
  	for(var i=0;i<btn.length;i++){
  		btn[i].classList.remove( 'is-open' );
  	}
  	event.target.parentNode.setAttribute( 'data-direction', directions.shift().id );
  	event.target.parentNode.classList.add( 'is-open' );


} );

btnYes.addEventListener( 'click', function( event ) {	
	event.target.parentNode.parentNode.classList.remove( 'is-open' );
} );

btnNo.addEventListener( 'click', function( event ) {
	event.target.parentNode.parentNode.classList.remove( 'is-open' );
} );
}

function distance( x1, y1, x2, y2 ) {
  var dx = x1-x2;
  var dy = y1-y2;
  return Math.sqrt( dx*dx + dy*dy );
}
})
</script>	

</body>
</html>