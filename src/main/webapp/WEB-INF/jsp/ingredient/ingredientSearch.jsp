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
<style type="text/css">
#searchbox {
    width: 470px;
    padding: 20px;
    margin: 100px auto;
    background: #fff;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
}
</style>
</head>
<body>
<div id="searchbox">

<form action="/ingredients/SearchIngredient">
<table class="table">
<tr>輸入成分之中英文 / 完整 / 部份名稱皆可</tr>
<tr>
<td><input type="text" name="ingredName" id="ingredName"></td> 
<td><input type="submit" id="search" value="查成份"></td>
</tr>
</table>
</form>

<table class="table">
<tr><td>成份名稱</td><td>中文名稱</td><td>概略特性</td><td>粉刺</td><td>刺激</td><td>安心度</td></tr>
<c:forEach var="items" items="${result}">
<tr>
<td>${items.ingredName}</td>
<td>${items.ingredChName}</td>
<td>${items.ingredChar}</td>
<td>${items.ingredIrritant}</td>
<td>${items.ingredAcne}</td>
<td>${items.ingredSafety}</td>
</tr>
</c:forEach>
</table>
</div>

</body>
</html>