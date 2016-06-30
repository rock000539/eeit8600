<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="items" items="${prodIngreList}">
<table>
<tr><td>${items.product.prodName}"</td></tr>
<tr><td>${items.ingredient.ingredName}"</td></tr>
</table>
</c:forEach>
<form action="/ProdIngreList/post">
<input type="text" name="prodIdStr">
<input type="text" name="ingredIdStr"> 
<input type="submit" value="submit">
</form>


</body>
</html>