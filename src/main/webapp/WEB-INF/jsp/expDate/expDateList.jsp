<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
            table {
                margin: 10px;
                border: 2px solid red;
            }
            td {
                border: 2px solid black;
            }
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.js"></script>
<script>
$(function(){
$('.delete').click(function(e){
	var dateIdStr=e.target.name;
	var target=e.target;

	$.ajax({
		url:'/expdate/delete',
		type : 'GET',
		data : {dateIdStr:dateIdStr},
		success : function(date){alert(date);
		$(target).parent().parent().remove();
		}
		})
});//end $('#delete').click
	
})
</script>	
</head>
<body>
this is list
<table>
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

</body>
</html>