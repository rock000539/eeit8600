<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>收藏產品清單</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<!-- CSS -->
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/fms-main.css" />
	<link rel="stylesheet" href="/css/fms-customize.css" />	
	<link href="/css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery.dropotron.min.js"></script>
	<script src="/js/skel.min.js"></script>
	<script src="/js/util.js"></script>
	<script src="/js/fms-main.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
<style>
#mainSpace{
  width: 800px;
  margin-top:100px;
  margin-left: auto;
  margin-right: auto;
  }
 .ui-button{
 height: 50px;
 }
</style>

<script>
$(function(){
 
    $('.deleteDate').click(function(e){
    	var dateIdStr=e.target.name;
    	var target=e.target;
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
	
})
</script>	

</head>
<body>

	<!-- Wrapper -->
		<div id="wrapper">
<!--加入header&nav -->
<c:import url="../fms_header_nav.jsp" />
				
			<!-- Main -->
			<div id="main">
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
 	<td><img src="${items.product.prodImg}"/></td>
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

<!--加入intro&footer -->
<c:import url="../fms_intro_footer.jsp" />
			 </div>
		</div>
			
</body>
</html>