<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<form>
<textarea class="ckeditor" id="content" name="content" cols="80" rows="12"></textarea>
</form>
<script src="/ckeditor/ckeditor.js"></script>
<script>
CKEDITOR.replace('editor1'
	    ,{filebrowserImageUploadUrl : '/upload'}
);

</script>
</body>
</html>