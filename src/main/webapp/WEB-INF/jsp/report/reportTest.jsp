<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/bootstrap.min.css"/>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>
$(function(){
	$("#reportBtn").click(function (){
		$('#myModal').modal("toggle");
				
	});
	
	
	
	
	
	
	
	
	
	
})//end of onload
</script>
</head>
<body>
<div></div>
<input type="button" id="reportBtn" value="report">


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
          	<!-- title 位置 -->
            </h4>
         </div>
         <form id="reportForm">
         <div class="modal-body" id="modal-body">
<!--在这里添加一些文本-->				
			<input type="text" name="reportTitle">
			<br>
			<textarea cols="50" rows="5" name="reportDetile"></textarea>
			<br>
			<input type="button" name="cancel" value="cancel" >
			<input type="submit" name="submit" >
         </div>
         </form>
         <div class="modal-footer">
            <button type="button" class="btn btn-default"   id="cancelInsert"   data-dismiss="modal" >
         	   關閉視窗
            </button>
<!--             <button type="button" class="btn btn-primary" id="insertNewIngredient" > -->
<!--             	   提交更改 -->
<!--             </button> -->
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->

<!-- 結束model1 ----------------------------------------------------------------->
</body>
</html>