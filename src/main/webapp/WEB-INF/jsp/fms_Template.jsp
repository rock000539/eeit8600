<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	
<head>
	<title>FMS Template</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<!-- CSS -->
	<link rel="stylesheet" href="/css/fms-main.css" />
	<link rel="stylesheet" href="/css/fms-customize.css" />		
</head>

<body>

	<!-- Wrapper -->
		<div id="wrapper">
<!--加入header&nav -->
<c:import url="../fms_header_nav.jsp" />
				
			<!-- Main -->
			<div id="main">
			
			<!-- **每頁不同的內容從這裡開始** -->
				
				<!-- 內容若要有方框效果，請用下面的article包起來 -->
                <article class="post">
                
                
                </article>
                
            <!-- **每頁不同的內容結束** -->

<!--加入intro&footer -->
<c:import url="../fms_intro_footer.jsp" />
			 </div>
		</div>
			
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery.dropotron.min.js"></script>
	<script src="/js/skel.min.js"></script>
	<script src="/js/util.js"></script>
	<script src="/js/fms-main.js"></script>
			
	</body>
</html>