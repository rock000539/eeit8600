<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>收藏產品清單</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<!-- CSS -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="https://use.typekit.net/riz5mva.js"></script>
	<script>try{Typekit.load({ async: true });}catch(e){}</script>
<style>
body{
	font-family: source-han-sans-traditional
}
#mainSpace{
  width: 800px;
  margin-top:100px;
  margin-left: auto;
  margin-right: auto;
  }
 .ui-button{
 height: 50px;
 }
 #mainSpace img{
 width: 100px;
 height: 100px;
 }
 
 /* service Box 6
====================================*/
.serviceBox_6{
    background: #E8A1A7;
    color:#fff;
    padding:65px 85px;
    margin: 0 -15px;
    overflow: hidden;
}
.row div:nth-child(3n+2) .serviceBox_6{
    background: #E6C2AB;
    color:#fff;
    padding:65px 85px;
    margin: 0 -15px;
    overflow: hidden;
}
.row div:nth-child(3n+3) .serviceBox_6{
    background: #6EC686;
    color:#fff;
    padding:65px 85px;
    margin: 0 -15px;
    overflow: hidden;
}
.serviceBox_6 .service-content{
    padding:0;
}
.serviceBox_6 .service-content h3{
    color:#fff;
}
.serviceBox_6 .service-content p{
    font-size:14px;
    line-height:29px;
    margin-bottom:30px;
}
.serviceBox_6 .service-content a{
    background: hsla(0, 0%, 0%, 0);
    border: 2px solid hsl(0, 0%, 97%);
    border-radius:0;
    color:#fff;
    padding:9px 17px;
    font-size:14px;
    text-transform:uppercase;
    transition:all 0.2s ease 0s;
}
.serviceBox_6 .service-content a:hover{
    background-color: hsl(0, 0%, 97%);
    color: hsl(0, 0%, 20%);
}
.serviceBox_6 .service-content .line{
    border: 1px solid;
    display: block;
    width: 20%;
    margin: 20px 0;
}
.serviceBox_6 .service-content a i{
    margin-left:6px;
}


</style>

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

</head>
<body>
<!-- ////////////////////////////////////////////////////////////////////-->

<div class="row">
<c:forEach items="${beans}" var="items">
     <div class="col-sm-4">
         <div class="serviceBox_6 same-height">
             <div class="service-content">
             	 <img src="/products/show?prodId=${items.product.prodId}"/>
                 <h3>${items.product.prodName}</h3>
                 <span class="line"></span>
                 <p>製造日期 ${items.mfd}</p>
                 <p>到期日 ${items.exp}</p>
                 <a class="btn btn-default" href="/expdate/edit?dateId=${items.expDate.dateId}">&nbsp;&nbsp;Edit<i class="fa fa-thumbs-up"></i></a>
                 <a class="btn btn-default" name="${items.expDate.dateId}" class="deleteDate" >Delete<i class="fa fa-thumbs-up"></i></a>
             </div>
         </div>
     </div>
</c:forEach>
</div>


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
			
</body>
</html>