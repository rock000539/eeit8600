<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>INSERT APP</title>
</head>

<body onload="javascript:document.insertMemberFormA.mId.focus();">
	<center>
		<form name="insertMemberFormA" action="AppAdd.do" method="POST">
			<table border="1">
				<thead>
					<tr bgcolor='tan'>
						<th height="50" colspan="2" align="center">新增App資料</th>
					</tr>
				</thead>
				<tbody>
					<tr bgcolor='tan'>
						<td width="100" height="40" align="center">編號：</td>
						<td width="200" height="40" align="center">
							<input id='num' style="text-align: left" name="aId" type="text" size="20">
						</td>
					</tr>
					<tr bgcolor='tan'>
						<td width="100" height="40" align="center">名稱：</td>
						<td width="200" height="40" align="center">
							<input id='num' style="text-align: left" name="aName" type="text" size="20">
						</td>
					</tr>
					<tr bgcolor='tan'>
						<td width="100" height="40" align="center">評價：</td>
						<td width="200" height="40" align="center">
							<input name="aEvalu" type="text" size="20">
						</td>
					</tr>
					<tr bgcolor='tan'>
						<td width="100" height="40" align="center">下載量：</td>
						<td width="200" height="40" align="center">
							<input name="aDownload" type="text" size="20">
						</td>
					</tr>
					<tr bgcolor='tan'>
						<td width="100" height="40" align="center">連結網址：</td>
						<td width="200" height="40" align="center">
							<input name="aUrl" type="text" size="20">
						</td>
					</tr>
					<tr bgcolor='tan'>
						<td height="40" colspan="2" align="center">
							<input type="submit" value="送出">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</center>
</body>
</html>