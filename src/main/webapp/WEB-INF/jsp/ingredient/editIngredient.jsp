<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後台管理系統</title> 

	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/bms/style.min.css" rel="stylesheet">
	<link href="/css/bms/default.css" rel="stylesheet" id="theme">
	<link href="/css/bms/bms-customize.css" rel="stylesheet">
	<!--  BASE JS  -->
	<script src="/js/bms/pace.min.js"></script>
	<link href="/css/jquery-ui.min.css" rel="stylesheet" >

	<!--  BASE JS  -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bms/jquery.slimscroll.min.js"></script>
	<script src="/js/bms/bms.js"></script>
<script src="/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/css/bootstrap-modal.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modal.min.js"></script>

<style>
body {
	font-family: Microsoft JhengHei, "Open Sans",Helvetica,Arial,sans-serif;	
}
#mainTable{
width: 500px;
margin: 50px 105px;
font-size: 20px;
}
#mainTable p{
margin-left:250px;}
#insertArea{
margin:20px;
font-size: 15px;
margin-left:255px}

#editArea{
margin: 50px auto;
 width: 550px; 
/*  border: solid 1px black;  */
font-size: 20px; 
}
fieldset{display:inline;}
#editArea li{
margin:5px;
float: top;
background-color: #DDDDDD;
}
.error{
color:red;
}
#submitArea{
margin: 30px 350px;}
</style>
<script>
$(function(){
	//--validate----------------------

	$('#NewIngredientForm').validate({
		rules:
	{
		ingredName:{required:true},
		ingredChar:{required:true},
		ingredIrritant:{digits:true},
		ingredAcne:{digits:true},
		ingredSafety:{digits:true}
		},
	messages:{
	ingredName:"必填項目",
	ingredChName:"必填項目",
	ingredChar:"必填項目",
	ingredIrritant:"必須為數字",
	ingredAcne:"必須為數字",
	ingredSafety:"必須為數字"}
	});
		
	//-------功能1: 在下方列加入欲新增成份-------------------------------
	$("#insertIngredient").click(function(){
		var IngredientName=$("#IngredientName").val();
	
		var Ingredients=document.getElementsByClassName("info");
		
		var Insterpossible=false;
		
		if(Ingredients.length==0){Insterpossible=true;}
		for(var i=0;i<Ingredients.length;i++){
		 var intName = Ingredients[i].getAttribute("name");
			if(intName==IngredientName){  
				alert("已經有這個成份了喔");  
				Insterpossible=false;
				break;
			}else if(IngredientName==""||IngredientName==null){
				Insterpossible=false;
				break;
			}
			else{ 
				Insterpossible=true;
			}//end of else			
				
			}//end of for loop
			
		if(Insterpossible)	{
		//功能1-A	針對資料庫有的資料新增-------------------------------------------
		var data=$("#IngredientName").val();
		
		$.ajax({
			"url":'/prodIngreList/checkIngredientName',
			"type":"POST",
			"data":{"IngredientName":IngredientName},
			success:function(result){// #4
				
				if(result.ingredName !=undefined){
					console.log("result not undefined");
					
					$('#IngredientArea')
					.append("<fieldset><li class='list-inline'><span class='info' ingredId='New"+(Ingredients.length+1)
					+"' name='"+data+"'> "
					+data
					+"</span><span class='close' aria-label='Close' ingredId='New"
					+(Ingredients.length+1)+"' >&times;</span></li></fieldset>" ); 
					
					//-------功能1-2: 按下close 刪除即將加入的成份-------------------------------	
					$(".close").click(function(e){
						var closeBtn=e.target.getAttribute('ingredId');	
						var spans=$(".info");
						
						for(var i=0;i<spans.length;i++){
							var spanIngredId=spans[i].getAttribute('ingredId');
							if(spanIngredId==closeBtn){
								$(spans[i]).parent().parent().remove();			
								break;
							}
						}
						});//end $(".close").click(function(e)		
						$("#IngredientName").val("");			
				}
				
				else if(result.ingredName ==undefined){//end of if 判斷輸入成份是否在資料庫存在 #3
					//跳出Modal------------------
					//功能 1-B 針對資料庫沒有的成份新增-----------------------------------------
					
					var IngredientName=$("#IngredientName").val();			
					
					$('#NewingredName').val(IngredientName);
					$('#myModal').modal({backdrop:false});
					
					$("#cancelInsert").click(function(){
						$('#NewingredName').val("");	
					})		
				}//end #3
			}//end #4
		
		});//end of if(Insterpossible)的Ajax
		}//end of if(Insterpossible)
	
	});//end of $("#insertIngredient").click(function(){
		
	//-------功能1-3 MODAL中送出資料並新增--------------------------
	$("#insertNewIngredient").click(function(){
		var checkValidate=$('#NewIngredientForm').validate().form();
	
		var data = JSON.stringify($('#NewIngredientForm').serializeObject());

		//新增li用------------------------------
		
		var Ingredients=document.getElementsByClassName("info");
		var IngredientName=$("#IngredientName").val();
		
		if(checkValidate){	
		$('#IngredientArea')
		.append("<fieldset><li class='list-inline'><span class='info' ingredId='New"+(Ingredients.length+1)
		+"' name='"+IngredientName+"'> "
		+IngredientName
		+"</span><span class='close' aria-label='Close' ingredId='New"
		+(Ingredients.length+1)+"' >&times;</span></li></fieldset>" ); 
		
		//-------功能1-2: 按下close 刪除即將加入的成份-------------------------------	
		$(".close").click(function(e){
			var closeBtn=e.target.getAttribute('ingredId');	
			var spans=$(".info");
			
			for(var i=0;i<spans.length;i++){
				var spanIngredId=spans[i].getAttribute('ingredId');
				if(spanIngredId==closeBtn){
					$(spans[i]).parent().parent().remove();			
					break;
				}
			}
			});//end $(".close").click(function(e)									
		}//end 	if(checkValidate){
		
		if(checkValidate){		
		$.ajax({
			"url":'/ingredients/insert',
			"type":"POST",
			"contentType": 'application/json; charset=utf-8',
			"dataType":"json",
			"data":data,
			success:function(result){
				$('#myModal').modal("toggle");			
			}
		});					
		}//end of if(validate)
		else{		
			alert("資料輸入錯誤");
		}
	});//==end of $("#insertNewIngredient").click(function()
	
	//-------功能2: 按下close 可刪除已加入成份-------------------------------
	
	$(".close").click(function(e){
	var closeBtn=e.target.getAttribute('ingredId');	
	var spans=$(".info");
	
	for(var i=0;i<spans.length;i++){
		var spanIngredId=spans[i].getAttribute('ingredId');
		
		if(spans.length!=1){
		if(spanIngredId==closeBtn){
			$(spans[i]).parent().parent().remove();			
			break;
		}
		}
	}
	
	});//end $(".close").click(function(e)
	//-------功能3: 送出成份資料並修改----------------------
	$('#editIngredient').click(function(){
		
		var proName=$("#mainTable span").html();
		var proId=$("#mainTable span").attr("proid");
		
		var Ingredients=document.getElementsByClassName('info');
		var IngredientNames=[];
		
		for(var i=0;i<Ingredients.length;i++){
			IngredientNames[i]=Ingredients[i].getAttribute('name');
			alert(IngredientNames[i]);
		}
					
	$.ajax({
		'url':'/prodIngreList/put',
		'data':{"IngredientNames":IngredientNames,"proName":proName,"proId":proId},
		'type' : 'POST',
		traditional: true,
		success : function(data){//data是尚未加入成份的名稱
			var Ingredients=document.getElementsByClassName("info");			
			if(data[0]!=undefined){	
				$("#modal-body2").append("有未存在於資料庫的成份資料");
			}else{
				
				$("#modal-body2").empty();
				for(var i=0;i<Ingredients.length;i++){
				var intName = Ingredients[i].getAttribute("name");
		$("#modal-body2").append("<tr><td>成份名稱 :</td><td>"+intName+"</td></tr><tr><td><br><td></tr>");				
				}	
			$("#modal-body2").append("資料新增完畢");
			$('#myModal2').modal('toggle');
			}
		} //end of success : function(data){
	})	//end of $.ajax({
	
	});//end of 	$('#editIngredient').click(function()
	
	
	//------功能4:自動完成 來查找已經有的成份
			var request=$('#IngredientName').val();
		    $( "#IngredientName" ).autocomplete({delay: 500,
		        source:  function(request, response) {
					var autocompleteData=[];
		        	var IngredientName = $('#IngredientName').val();	
					$.ajax({
						url : '/prodIngreList/autocomplete',
						type : 'get',
						data : {"IngredientName":IngredientName},
						success : function(data){ 
							
							for(var i=0;i<data.length;i++){
								autocompleteData[i]=data[i].ingredName;
							}
							response(autocompleteData);
						}
					});
		      } 
		      });

		//-------------------------------
			$.fn.serializeObject = function() {
		        var o = {};
		        var a = this.serializeArray();
		        $.each(a, function() {
		            if (o[this.name]) {
		                if (!o[this.name].push) {
		                    o[this.name] = [o[this.name]];
		                }
		                o[this.name].push(this.value || '');
		            } else {
		                o[this.name] = this.value || '';
		            }
		        });
		        return o;
		    };	
		
		    $( "#IngredientArea" ).sortable();
	        $( "#IngredientArea" ).disableSelection();
		    
}) //--end of $(function)
</script>
</head>
<body>
	<!-- page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
	
	<c:import url="/WEB-INF/jsp/bms/bms_header.jsp" />
	<c:import url="/WEB-INF/jsp/bms/bms_navbar-side.jsp" />	
	
		<!-- page content -->
		<div id="content" class="content">
			<!-- breadcrumb 目前位置 -->
			<ol class="breadcrumb pull-right">
				<li><a href="<% request.getContextPath(); %>/bms">Home</a></li>
				<li><a href="javascript:;">Page Options</a></li>
				<li class="active">Blank Page</li>
			</ol>
			
			<!-- page-header 每頁標題 副標 -->
			<h1 class="page-header">Dashboard <small>overview of background management system</small></h1>
			
			<!-- 內文 -->
			<div class="row">
			    <div class="col-md-12 ui-sortable">
	            <!-- **每頁不同的內容從這裡開始** -->
                                
                                
<table id="mainTable"><tr><td ><p proid="${productId}">${productName}</p></td></tr>      
<tr><td>                       
<form action="" id="insertArea">
<input class="ui-widget ui-autocomplete-input" autocomplete="on" id="IngredientName" >

<ul class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content" id="ui-id-1" tabindex="0" style="display: none; top: 29px; left: 44px; width: 159px;">
<li class="ui-menu-item" id="ui-id-12" tabindex="-1">AppleScript</li></ul>
<span role="status" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></span>

<input type="button" id="insertIngredient" value="新增">
<input type="submit">
</form>
</td></tr>

<tr><td>    
<div id="editArea" >
<ol id="IngredientArea">

<c:forEach var="items" items="${ingredients}">
<fieldset >
<li class="list-inline">
<span class="info" ingredId="${items.ingredId}" name="${items.ingredName}">
${items.ingredName}
</span>
<span class="close" aria-label="Close" ingredId="${items.ingredId}" >&times;</span>

</li>
</fieldset>
</c:forEach>

</ol>
</div></td></tr>

<tr><td>    
<div id="submitArea">
<input type="button" class="btn btn-default" id="editIngredient" value="確認修改">
</div> 
</td></tr>
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

	            <!-- **每頁不同的內容 end** -->     
			    </div><!-- /end .col-md-12 -->
			</div> <!-- /end .row -->
		</div>
		<!-- /end #content -->
		<!-- scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- /end page container -->

</body>
</html>