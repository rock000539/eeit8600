<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
	<title>Bms</title>
	<script src="/js/jquery.min.js"></script>
	<!--  BASE CSS STYLE  -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/bms/style.min.css" rel="stylesheet">
	<link href="/css/bms/default.css" rel="stylesheet" id="theme">
	<link href="/css/bms/bms-customize.css" rel="stylesheet">
	<!--  BASE JS  -->
	<script src="/js/bms/pace.min.js"></script>

</head>
<body>
	<!-- Loading animate -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>

	<!-- page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
	
	<c:import url="/WEB-INF/jsp/bms/bms_header.jsp" />
	<c:import url="/WEB-INF/jsp/bms/bms_navbar-side.jsp" />	
	
		<!-- page content -->
		<div id="content" class="content">
			<!-- breadcrumb 目前位置 -->
			<ol class="breadcrumb pull-right">
				<li class="active"><a href="javascript:;">Home</a></li>
			</ol>
			
			<!-- page-header 每頁標題/副標 -->
			<h1 class="page-header"> 管理員信箱 <small>顧客服務、通知</small></h1>
			
			<!-- 內文 -->
			<div class="row">
			    <div class="col-md-12 ui-sortable">
	            <!-- **每頁不同的內容從這裡開始** -->
	                   
	                   <div class="panel panel-inverse">
	                       <div class="panel-heading">
	                           <div class="panel-heading-btn">
	                               <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
	                               <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload" id="reloadMail"><i class="fa fa-repeat"></i></a>
	                               <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
	                               <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
	                           </div>
	                           <h4 class="panel-title"> Mail Box</h4>
	                       </div>
 	<div class="panel-body">
	 <!-- //////////////////////////////////////////////////////////// -->
<div id="tempNickName" value="" style="display:none;"></div>
	<table class="table" id="mailTable">
	<tr>
	<th>發信人</th><th>標題</th><th>內容</th><th>狀態</th><th>信件類型</th><th>發信日期</th><th></th>
	</tr>
	<c:forEach var="items" items="${result}">	
	<tr>
	<td class="details"  name="${items.webMail.webMailId}" value="${items.webMail.webMailSender}">
	<a href="#">${items.nickName}</a>
	</td>
	<td class="details" name="${items.webMail.webMailId}">
	<a href="#">${items.webMail.mailTitle}</a></td>
	<td class="details" name="${items.webMail.webMailId}">
	<a href="#">${items.webMail.mailContent}</a></td>
	<td class="details mailReadType" name="${items.webMail.webMailId}">
	<c:if test="${items.webMail.mailReadType ==true}">
	<a href="#">已讀</a>
	</c:if>
	<c:if test="${items.webMail.mailReadType ==false}">
	<a href="#">未讀</a>
	</c:if>
	</td>
	<td class="details" name="${items.webMail.webMailId}">
	<a href="#">${items.webMail.mailContentType}</a></td>
	<td class="details" name="${items.webMail.webMailId}">
	<a href="#">${items.webMail.mailSendDate}</a></td>
	<td>
	<input type="button" class="btn deleteBtn" webMailId="${items.webMail.webMailId}" value="Delete"></td>
	<td><input type="button" class="btn replyMail" webMailId="${items.webMail.webMailId}"  value="reply"></td>
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
            <h4 class="modal-title" id="myModalLabel"></h4>
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
              <div><input type="text" name="replyTitle" id="replyTitle" placeholder="Subject"></div><br>
            </h4>
         </div>
         <div class="modal-body" id="modal-body2">
<!-- 添加一些文本22222			 -->
		
		
		<div><textarea rows="4" cols="50" name="replyMessages" id="replyMessages" placeholder="Message"></textarea></div>
			
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">重新修改
            </button>
           
           <button type="button" class="btn btn-primary" id="replyMailCommit">
               	確認
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
<!-- 結束model2 ----------------------------------------------------------------->

	        <!-- //////////////////////////////////////////////////////////// -->    
	                       </div>
	                   </div> <!-- /end .panel -->
	                   
	            <!-- **每頁不同的內容 end** -->     
			    </div><!-- /end .col-md-12 -->
			</div> <!-- /end .row -->
		</div>
		<!-- /end #content -->
		<!-- scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- /end page container -->
	
	<!--  BASE JS  -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bms/jquery.slimscroll.min.js"></script>
	<script src="/js/bms/bms.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/css/bootstrap-modal.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modal.min.js"></script>
	
<script>
$(function(){
	$("#insertNewIngredient").hide();
	//功能1 跳出modal-----
	$(".details").click(function (e){
		var btnP=$(this);
		var webMailId=btnP.attr("name");
		var webMail=$(".details[name*="+webMailId+"]");
		
		var webMailSender=webMail[0].children[0].innerHTML;
		var mailTitle=webMail[1].children[0].innerHTML;
		var mailContent=webMail[2].children[0].innerHTML;
		var mailContentType=webMail[3].children[0].innerHTML;
		var mailType=webMail[4].children[0].innerHTML;
		var mailSendDate=webMail[5].children[0].innerHTML;
		if(mailType=="Report"){
			$("#insertNewIngredient").show();
		}else{$("#insertNewIngredient").hide();}
		$("#myModalLabel").empty();
		$("#myModalLabel").append("標題 :"+mailTitle);
		$("#mailDetailsTable").empty();
		$("#mailDetailsTable").append(
				"<tr><td>寄信者</td><td>"+webMailSender+"</td><td id='webMailId' value="+
				webMailId+"></td><td>日期</td><td>"+mailSendDate+"</td></tr>"
				+"<tr><td>內容</td><td colspan='4'><div>"+mailContent+"</div></td></tr>"
				);
		//功能1-2 修改信件為已讀---
			$.ajax({
			"url":"/webmail/changemailreadtype",type:"POST",
			data:{"webMailId":webMailId},
			success:function(result){
					$(".mailReadType[name*="+webMailId+"]").empty();
					$(".mailReadType[name*="+webMailId+"]").append("<a href='#'>已讀</a>");
				}
				});
		
		$("#myModal").modal("toggle");
		
				
	})//end $(".details").click
	
	
	//功能2 確認並送出檢舉----
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
	
	
	
	//功能3-刪除mail
	$(".deleteBtn").click(function(e){
		var webMailId=e.target.getAttribute("webMailId");
		var targetBtn=$(this);
		$.ajax({
			"url":"/webmail/deleteMail",type:"POST",
			data:{"webMailId":webMailId},
			success:function(result){
				alert(result);
				targetBtn.parent().parent().remove();
			}
		});
	})	
	//功能4-reload 清單
	$("#reloadMail").click(function(){
		
		$.ajax({
			"url":"/webmail/reloadMail",type:"POST",
			data:{},
			success:function(result){				
				$("#mailTable td").parent().remove();
				for(var i=0;i<result.length;i++){
					var nickName=result[i].nickName;
					var webMailSender=result[i].WebMails.webMailSender;
					var webMailId=result[i].WebMails.webMailId;					
					var mailReadType="";
					if(result[i].WebMails.mailReadType){
						mailReadType="已讀";
					}else{
						mailReadType="未讀"
					}
	$("#mailTable").append("<tr><td class='details'name='"+webMailId
	+"' value='"+webMailSender+"'><a href='#'>"+nickName+"</a></td>"
	+"<td class='details' name='"+webMailId+"'><a href='#'>"+result[i].WebMails.mailTitle+"</a></td>"
	+"<td class='details' name='"+webMailId+"'><a href='#'>"+result[i].WebMails.mailContent+"</a></td>"
	+"<td class='details mailReadType' name='"+webMailId+"'><a href='#'>"+mailReadType+"</a></td>"
	+"<td class='details' name='"+webMailId+"'><a href='#'>"+result[i].WebMails.mailContentType+"</a></td>"
	+"<td class='details' name='"+webMailId+"'><a href='#'>"+result[i].WebMails.mailSendDate+"</a></td>"
	+"<td><input type='button' class='btn deleteBtn' webMailId='"+webMailId+"' value='Delete'></td>"
	+"<td><input type='button' class='btn replyMail' webMailId='"+webMailId+"'  value='reply'></td></tr>"
	);//end of append
			}//end of for loop
			
			//重新綁上事件-------------------------------------
		$(".deleteBtn").click(function(e){
		var webMailId=e.target.getAttribute("webMailId");
		var targetBtn=$(this);
		$.ajax({
			"url":"/webmail/deleteMail",type:"POST",
			data:{"webMailId":webMailId},
			success:function(result){
				alert(result);
				targetBtn.parent().parent().remove();
			}
			});
			})	
			
			$(".details").click(function (e){
			var btnP=$(this);
			var webMailId=btnP.attr("name");
			var webMail=$(".details[name*="+webMailId+"]")
		
			var webMailSender=webMail[0].children[0].innerHTML;
			var mailTitle=webMail[1].children[0].innerHTML;
			var mailContent=webMail[2].children[0].innerHTML;
			var mailContentType=webMail[3].children[0].innerHTML;
			var mailSendDate=webMail[5].children[0].innerHTML;
					
			$("#mailDetailsTable").empty();
			$("#mailDetailsTable").append(
				"<tr><td>寄信者</td><td>"+webMailSender+"</td><td id='webMailId' value="+
				webMailId+"></td></tr><tr><td>標題</td><td>"
				+mailTitle+"</td><td>日期</td><td>"+mailSendDate+"</td></tr>"
				+"<tr><td>內文</td><td><div>"+mailContent+"</div></td></tr>"
				);
			//功能1-2 修改信件為已讀---
				$.ajax({
				"url":"/webmail/changemailreadtype",type:"POST",
				data:{"webMailId":webMailId},
				success:function(result){
					$(".mailReadType[name*="+webMailId+"]").empty();
					$(".mailReadType[name*="+webMailId+"]").append("<a href='#'>已讀</a>");
				}
				});
		
		
			$("#myModal").modal("toggle");
		
				
			})//end $(".details").click
			//重新綁事件------------------------
			$(".replyMail").click(function(){
				$("#replyTitle").val("");
				$("#replyMessages").val("");
				$("#myModal2").modal("toggle");
				var btnP=$(this);
				var webMailId=btnP.attr("webMailId");		
				$("#replyMailCommit").attr("value",webMailId);
				})
			//---------------------------------
			//------------------------------------------
			}//end of success function
		});
		
	})
	//---回信--------------------------------------
	$(".replyMail").click(function(){
		$("#replyTitle").val("");
		$("#replyMessages").val("");
		$("#myModal2").modal("toggle");
		var btnP=$(this);
		var webMailId=btnP.attr("webMailId");		
		$("#replyMailCommit").attr("value",webMailId);
		})
	$("#replyMailCommit").click(function(){
		var replyTitle=$("#replyTitle").val();
		var replyMessages=$("#replyMessages").val();
		var webMailId=$("#replyMailCommit").attr("value");
		$.ajax({
			"url":"/webmail/replyMail",type:"POST",
			data:{"webMailId":webMailId,
				"replyTitle":replyTitle,
				"replyMessages":replyMessages},
			success:function(result){
				alert(result);
				$("#myModal2").modal("toggle");
			}
			})
		})
		
		
})
</script>
</body>
</html>