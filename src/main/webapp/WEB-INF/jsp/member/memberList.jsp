<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member ListPage</title>
</head>
<body>
<a href="/members/add">新增資料</a>
<table border="1" cellspacing="0" cellpadding="2">
<thead align='center'>
	<tr>

		<th>電子信箱</th>
		<th width="150">暱稱</th>
		<th width="80">姓</th>
		<th width="80">名</th>
		<th width="80">性別</th>
		<th width="80">生日</th>
		<th width="80">肌膚性質</th>
		<th width="80">圖片</th>
		<th width="80">電話</th>
		<th width="80">地址</th>
		<th width="80">會員狀態(停權)</th>
		<th width="80">停權到期日</th>
	</tr>
</thead>
<tbody align='center'>
	<c:forEach var="member" items="${members}">
		<tr>
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
			<td><input type="button" name="edit" value="edit" onclick='location="/ingredients/edit?ingredId=${ingredient.ingredId}"'></td>
			<td><input type="button" name="delete" value="delete" onclick='location="/ingredients/delete?ingredId=${ingredient.ingredId}"'></td>
		</tr>
	</c:forEach>
</tbody>
</table>

</body>
</html>