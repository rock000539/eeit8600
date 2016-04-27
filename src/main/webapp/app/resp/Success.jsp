<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SuccessPage</title>
</head>
<body>
	<h1> 編號: ${ appEntity.id } 的資料新增成功 </h1>
	<br> 名稱: ${ appEntity.name }
	<br> 評價: ${ appEntity.evaluation }
	<br> 下載量: ${ appEntity.download }
	<br> 連結網址: ${ appEntity.url }
</body>
</html>