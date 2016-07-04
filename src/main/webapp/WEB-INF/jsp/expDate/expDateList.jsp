<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收藏產品清單</title>
<style type="text/css">
#mainSpace{
  width: 500px;
  margin-top:100px;
  margin-left: auto;
  margin-right: auto;
  }
</style>

<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/fms-main.css" />
<link rel="stylesheet" href="/css/fms-customize.css" />		
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">	
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>	
	<script src="/js/jquery.validate.min.js"></script>		
	<script src="/js/jquery.dropotron.min.js"></script>
	<script src="/js/skel.min.js"></script>
	<script src="/js/util.js"></script>
	<script src="/js/fms-main.js"></script>
<script>
$(function(){
$('.delete').click(function(e){
	var dateIdStr=e.target.name;
	var target=e.target;

	$.ajax({
		url:'/expdate/delete',
		type : 'GET',
		data : {dateIdStr:dateIdStr},
		success : function(date){
		alert(date);
		$(target).parent().parent().remove();
		}
		})
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
<tr><td>產品名稱</td><td>製造日</td><td>到期日</td><td></td></tr>
<c:forEach items="${beans}" var="items">
 <tr>
 
 	<td>${items.product.prodName}</td>
	<td>${items.mfd}</td> 
	<td>${items.exp}</td> 	
	<td>${items.product.prodImg}</td>
	<td><input type="button" name="edit" value="edit" id="edit" onclick='location="/expdate/edit?dateId=${items.expDate.dateId}"'></td>
	<td><input type="button" name="${items.expDate.dateId}" value="delete" class="delete" ></td>
	
</tr>
</c:forEach>

</table>
</div>

<!-- ////////////////////////////////////////////////////////////////////-->

<!--加入intro&footer -->
<c:import url="../fms_intro_footer.jsp" />
			 </div>
		</div>
			
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery.dropotron.min.js"></script>
	<script src="/js/skel.min.js"></script>
	<script src="/js/util.js"></script>
	<script src="/js/fms-main.js"></script>
</body>
</html>