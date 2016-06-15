<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
this is list

<c:forEach items="${beans}" var="items">
 <tr>
	<td>${items.expDate.memberId}</td>
	<td>${items.product.prodName}</td>

	<td><input type="button" name="edit" value="edit" ></td>onClick="location='/'"
	<td><input type="button" name="delete" value="delete"></td> onClick="location='/'"
</tr>
	
</c:forEach>


</body>
</html>