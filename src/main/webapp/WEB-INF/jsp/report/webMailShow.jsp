<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/metisMenu.min.css" rel="stylesheet">
<link href="/css/sb-admin-2.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bms-customize.css" rel="stylesheet" >
<link href="/css/jquery-ui.min.css" rel="stylesheet" >

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/metisMenu.min.js"></script>
<script src="/js/sb-admin-2.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/css/bootstrap-modal.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modal.min.js"></script>

<script>
$(function(){
	
	$(".details").click(function (e){
		var btnP=$(this);
		var webMailId=btnP.attr("name");
		var webMail=$(".details[name*="+webMailId+"]")
		
		var webMailSender=webMail[0].firstChild.nodeValue;
		var mailTitle=webMail[1].firstChild.nodeValue;
		var mailContent=webMail[2].firstChild.nodeValue;
		var mailContentType=webMail[3].firstChild.nodeValue;
		var mailSendDate=webMail[4].firstChild.nodeValue;
					
		$("#mailDetailsTable").empty();
		$("#mailDetailsTable").append(
				"<tr><td>寄信者</td><td>"+webMailSender+"</td><td id='webMailId' value="+
				webMailId+"></td></tr><tr><td>標題</td><td>"
				+mailTitle+"</td><td>日期</td><td>"+mailSendDate+"</td></tr>"
				+"<tr><td>內文</td><td><div>"+mailContent+"</div></td></tr>"
				);
		
		$("#myModal").modal("toggle");
		
				
	})//end $(".details").click
	
	
	$("#insertNewIngredient").click(function(){
		var webMailId=$("#webMailId").attr("value");
		
		$.ajax({
			"url":"/webmail/postReport",type:"POST",
			data:{"webMailId":webMailId},
			success:function(result){
				alert(result);
				$("#myModal").modal("toggle");
			}
			
			
		});
		
	})
	
	
})

</script>

</head>
<body>

	<table class="table">
	<tr>
	<th>發信人</th><th>標題</th><th>內容</th><th>狀態</th><th>信件類型</th><th>發信日期</th>
	</tr>
	<c:forEach var="items" items="${result}">	
	<tr>
	<td class="details"  name="${items.webMail.webMailId}" value="${items.webMail.webMailSender}">
	${items.nickName}
	</td>
	<td class="details" name="${items.webMail.webMailId}">${items.webMail.mailTitle}</td>
	<td class="details" name="${items.webMail.webMailId}">${items.webMail.mailContent}</td>
	<td id="mailReadType" class="details" name="${items.webMail.webMailId}">
	<c:if test="${items.webMail.mailReadType ==true}">
	已讀
	</c:if>
	<c:if test="${items.webMail.mailReadType ==false}">
	未讀
	</c:if>
	</td>
	<td class="details" name="${items.webMail.webMailId}">${items.webMail.mailContentType}</td>
	<td class="details" name="${items.webMail.webMailId}">${items.webMail.mailSendDate}</td>
	</tr>

	</c:forEach>
	</table>


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
            
            </h4>
         </div>
         <form id="NewIngredientForm">
         <div class="modal-body" id="modal-body">
<!--在这里添加一些文本-->				
				<table id="mailDetailsTable" class="table">

				</table>
         </div>
         </form>
         <div class="modal-footer">
            <button type="button" class="btn btn-default"   id="cancelInsert"   data-dismiss="modal" >
            取消
            </button>
            <button type="button" class="btn btn-primary" id="insertNewIngredient" >
             確認並送出檢舉
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->

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
</body>
</html>