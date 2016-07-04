<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<style>
#editArea{
margin: 250px auto;
width: 350px;
border: solid 1px black; 
}
fieldset{display:inline;}
li{
margin:5px;
float: top;
background-color: #DDDDDD;

}
</style>
<script>
$(function(){
	$("#insertIngredient").click(function(){
		var IngredientName=$("#IngredientName").val();
		
		var Ingredients=document.getElementsByClassName("info");

		for(var i=0;i<Ingredients.length;i++){
		 var intName = Ingredients[i].getAttribute("name");
			if(intName==IngredientName){  alert("test");  
			}
			
			}
		
		
	});//end of $("#insertIngredient").click(function(){
})//end of $(function)
</script>
</head>
<body>

<form action="" id="insertArea">
<input type="text" id="IngredientName" >
<input type="button" id="insertIngredient" value="新增">
</form>


<div id="editArea" class="bg-info">
<ol id="IngredientArea">

<c:forEach var="items" items="${ingredients}">
<fieldset>
<li class="list-inline">
<span class="info" ingredId="${items.ingredId}" name="${items.ingredName}">
${items.ingredName}
</span>
<span class="close" aria-label="Close" ingredId="${items.ingredId}" >&times;</span>

</li>
</fieldset>
</c:forEach>

</ol>
</div>

</body>
</html>