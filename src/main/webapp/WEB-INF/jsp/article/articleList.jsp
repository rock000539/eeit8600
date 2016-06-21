<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Article List</title>

<style>
*{margin:5px;}
table{
	width:1000px;
	border-collapse:collapse;
}
th,td{
	border:1px solid black;
	text-align:center;
}
</style>

</head>
<body>
<input type="button" name="add" value="add" onclick="location='/articles/add'"/><br/>
<TABLE>
	<TR>
		<TH>文章ID</TH>
		<TH>會員ID</TH>
		<TH>發文類型</TH>
		<TH>文章標題</TH>
		<TH>內文</TH>
		<TH>發布時間</TH>
		<TH>收藏數</TH>
		<TH>顯示隱藏</TH>
		<TH>檢舉次數</TH>
	</TR>
	
	<c:forEach var ="article" items="${articles}" >
	<TR>
		<TD>${article.articleId}</TD>
		<TD>${article.memberId}</TD>
		<TD>${article.articleType}</TD>
		<TD>${article.articleTitle}</TD>
		<TD>${article.article}</TD>
		<TD>${article.articleTime}</TD>
		<TD>${article.articleCollect}</TD>
		<TD>${article.articleShow}</TD>
		<TD>${article.articleReport}</TD>
		<TD>
			<input type="button" name="edit" value="edit" 
			onclick="location='/articles/edit?articleId=${article.articleId}'" />
			<input type="button" name="delete" value="delete"
			onclick="location='/articles/delete?articleId=${article.articleId}'"/>			
		</TD>
	</TR>
	</c:forEach>
</TABLE>


</body>
</html>