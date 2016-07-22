<!-- 前台頁面Template -->
<!-- 1.依序加入3個主要CSS檔 -->
<!-- 2.import header -->
<!-- 3.每頁不同內容包在<div class="grey_bg row">中，背景顏色為灰色(若要更改可再討論) -->
<!-- 4.import footer -->
<!-- 5.依序加入8個JS檔 -->
<!-- ＊＊判斷會員登入與否右上角頁面變更，請參考import的header＊＊-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>FMS Template</title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
		
</head>
<style>
table{
	border:1px solid black;
}
th,td{
border:1px solid black;
}

</style>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
				
<div class="row sub_content">
	<div class="col-lg-1 col-md-1 col-sm-1"></div>
	<div class="col-lg-10 col-md-10 col-sm-10 article">
	
<!-- 	<table> -->
<!-- 					<tr><th></th><th>content</th></tr> -->
<%-- 					<tr><td>Type</td><td>${article.articleType}</td></tr> --%>
<%-- 					<tr><td>Title</td><td>${article.articleTitle}</td></tr> --%>
<%-- 					<tr><td>Content</td><td>${article.articleContent}</td></tr> --%>
<!-- 					</table> -->
	</div>
	<div class="col-lg-1 col-md-1 col-sm-1"></div>	
</div>
					
				</div>        
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>

</body>
</html>