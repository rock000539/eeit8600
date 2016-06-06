<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="item" items="${date}" >
<tr align='center'><th>日期id</th><th>會員id</th><th>產品id</th><th>批號</th><th>製造日期</th><th>到期日期</th></tr>
	<tr>
		<td>${item.dateId}</td>
		<td>${item.memberId}</td>
		<td>${item.proId}</td>
		<td>${item.batchCode}</td>
		<td>${item.mfd}</td>
		<td>${item.exp}</td>

		<td><a href="/dates/edit?id=${item.dateId}"> edit </a></td>
		<td><a href="/dates/delete?id=${item.dateId}"> delete </a></td>
	</tr>
</c:forEach>
</body>
</html>