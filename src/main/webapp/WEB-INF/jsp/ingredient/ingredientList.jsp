<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/metisMenu.min.css" rel="stylesheet">
<link href="/css/sb-admin-2.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bms-customize.css" rel="stylesheet" >

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ingredient ListPage</title>


</head>
<body>
<div id="wrapper">

<c:import url="../bms_header.jsp" />
<c:import url="../bms_navbar-side.jsp" />

<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Member List</h1>
               <!-- **每一頁不同的內容寫在這: start -->


<a href="/ingredients/add">新增資料</a>
<table border="1" cellspacing="0" cellpadding="2">
<thead align='center'>
	<tr>
		<th width="250">成份</th>
		<th width="150">中文名稱</th>
		<th width="80">特性</th>
		<th width="80">刺激度</th>
		<th width="80">致粉刺性</th>
		<th width="80">安心度</th>
	</tr>
</thead>
<tbody align='center'>
	<c:forEach var="ingredient" items="${ingredients}">
		<tr>
			<td>${ingredient.ingredName}</td>
			<td>${ingredient.ingredChName}</td>
			<td>${ingredient.ingredChar}</td>
			<td>${ingredient.ingredIrritant}</td>
			<td>${ingredient.ingredAcne}</td>
			<td>${ingredient.ingredSafety}</td>
			<td><input type="button" name="edit" value="edit" onclick='location="/ingredients/edit?ingredId=${ingredient.ingredId}"'></td>
			<td><input type="button" name="delete" value="delete" onclick='location="/ingredients/delete?ingredId=${ingredient.ingredId}"'></td>
		</tr>
	</c:forEach>
</tbody>
</table>
                <!-- **每一頁不同的內容 end -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/metisMenu.min.js"></script>
<script src="/js/sb-admin-2.js"></script>

</body>
</html>