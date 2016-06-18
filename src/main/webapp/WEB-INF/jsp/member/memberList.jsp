<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/metisMenu.min.css" rel="stylesheet">
<link href="/css/sb-admin-2.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bms-customize.css" rel="stylesheet" >

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>

</head>
<body>

<div id="wrapper">

<jsp:include page="../bms_header.jsp"></jsp:include>
<jsp:include page="../bms_navbar-side.jsp"></jsp:include>

<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Member List</h1>
              
<a href="/members/add">新增資料</a>
<table border="1" cellspacing="0" cellpadding="2">
<thead align='center'>
	<tr>
		<th>ID</th>
		<th width="150">電子信箱</th>
		<th width="80">暱稱</th>
		<th width="80">姓</th>
		<th width="80">名</th>
		<th width="80">性別</th>
		<th width="80">生日</th>
		<th width="80">肌膚性質</th>
		<th width="80">圖片</th>
		<th width="80">電話</th>
		<th width="80">地址</th>
		<th width="80">停權</th>
		<th width="80">停權到期日</th>
	</tr>
</thead>
<tbody align='center'>
	<c:forEach var="member" items="${members}">
		<tr>
			<td>${member.memberId}</td>
			<td>${member.email}</td>
			<td>${member.nickname}</td>
			<td>${member.lastName}</td>
			<td>${member.firstName}</td>
			<td>${member.gender}</td>
			<td>${member.birthDay}</td>
			<td>${member.skinType}</td>
			<td>${member.memberImg}</td>
			<td>${member.phone}</td>
			<td>${member.addr}</td>
			<td>${member.memberSuspend}</td>
			<td>${member.memberSuspendExp}</td>
			<td><input type="button" name="edit" value="edit" onclick='location="/members/edit?memberId=${member.memberId}"'></td>
			<td><input type="button" name="delete" value="delete" onclick='location="/members/delete?memberId=${member.memberId}"'></td>
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