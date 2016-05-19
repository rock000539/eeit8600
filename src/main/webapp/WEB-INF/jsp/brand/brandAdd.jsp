<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Brand Add</title>
</head>
<body>
<FORM action="/brands/insert" method="post" enctype="multipart/form-data">
	<TABLE>
		<TR>
			<TD>品牌：</TD>
			<TD><input type="text" name="brandName" value="${param.brandName}" /></TD>
			<TD style="color:red"></TD>
		</TR>
<!-- 		<TR> -->
<!-- 			<TD>LOGO：</TD> -->
<!-- 			<TD><input type="file" name="brandLogo" /></TD> -->
<!-- 			<TD style="color:red"></TD> -->
<!-- 		</TR> -->
		<TR>
			<TD>官網：</TD>
			<TD><input type="text" name="website" value="${param.website}" /></TD>
			<TD style="color:red"></TD>
		</TR>
		<TR>
			<TD>批號公式：</TD>
			<TD><input type="text" name="bcFunc" value="${param.bcFunc}" /></TD>
			<TD style="color:red"></TD>
		</TR>
	</TABLE>
<input type="submit" name="save" value="save">
<input type="button" name="cancel" value="cancel" onclick="location='/brands/list'" />
</FORM>

</body>
</html>