<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Brand List</title>
</head>
<style>
*{margin:5px;}
table{
width: 1050px;
border-collapse:collapse;
}
th,td{
border:1px solid black;
text-align:center;
}
</style>
<body>
<input type="button" name="add" value="add" onclick="location='/brands/add'"/><br/>
<TABLE>
	<TR>
		<TH>編號</TH>
		<TH>品牌</TH>
		<TH width="50">Logo Path</TH>
		<TH>Logo Img</TH>
		<TH >官網</TH>
		<TH>批號公式</TH>
		<TH>顯示隱藏</TH>
	</TR>
<c:forEach var="brand" items="${brands}">
	<TR>
		<TD>${brand.brandId}</TD>
		<TD>${brand.brandName}<br/>
		${brand.brandCName}</TD>
		<TD>${brand.brandImg}</TD>
		<TD><img height="30" src="/brands/show?brandId=${brand.brandId}"></TD>
		<TD>${brand.website}</TD>
		<TD>${brand.bcFunc}</TD>
		<TD>${brand.brandShow}</TD>
		
		<TD>
		<input type="button" name="edit" value="edit" 
		onclick="location='/brands/edit?brandId=${brand.brandId}'"/>
		<input type="button" name="delete" value="delete" 
		onclick="location='/brands/delete?brandId=${brand.brandId}'"/>
		</TD>
	</TR>
</c:forEach>


</TABLE>

</body>
</html>