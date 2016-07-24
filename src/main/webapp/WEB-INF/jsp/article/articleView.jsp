<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!--     <link rel="stylesheet" href="/css/article/view.css"> -->
		
</head>
<style>
table{
	border:1px solid black;
}
th,td{
border:1px solid black;
}

.bgcolor{
	background: -webkit-linear-gradient(#EBDBFF , #FFEFD5); /* For Safari 5.1 to 6.0 */
 	background: -o-linear-gradient(#EBDBFF , #FFEFD5); /* For Opera 11.1 to 12.0 */
  	background: -moz-linear-gradient(#EBDBFF , #FFEFD5); /* For Firefox 3.6 to 15 */
  	background: linear-gradient(#EBDBFF , #FFEFD5); /* Standard syntax */
}

/* ==================================================
   authordiv
================================================== */
.authordiv {
	position: relative;
	width: 80px;
	height: 80px;
	overflow: hidden;
}
/*橫*/
.authordiv img {
	position: absolute;
	left: 50%;
	top: 50%;
	height: 100%;
	width: auto;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}
/*直*/
.authordiv img.portrait {
	width: 100%;
	height: auto;
}

.post{
/* 	background-color:white; */
	border:#e8ecf3 solid 1px;
 	background-color:#fff;
 	margin-bottom:10px;
}
.post:hover{
/* 	background-color:white; */
	border:#ccd3ff solid 2px;
	transition: all 0.3s ease-in-out;
}
.postprofile{
/* 	border:#e8ecf3 solid 1px; */
	padding-top:20px;
/* 	border-right:#e8ecf3 solid 1px; */
	
}
.postprofile h3, .postbody h3{
	margin:10px 0 0;
}


.postbody{
	padding:0px 20px 0 30px;
	border-left:#e8ecf3 solid 1px;
}
.postbody ul {
	margin:10px;
}
.postbody  ul > li{
	float: right;
}

.postbody  ul > li >a {
    border-radius: 5px;
    padding: 4px 7px;
    margin-left:5px;
}

.pbhead{
	border-bottom: 4px solid #e5e5e5;
/* 	border-spacing: 10px; */
/* 	padding-bottom:10px; */
}
.pbhead:after{
    bottom: 0;
    display: block;
    width: 80px;
    height: 4px;
    margin-bottom: -4px;
    content: "";
    background-color: #ee836e;
}


</style>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row bgcolor">
				
<div class="row sub_content">
	<div class="col-lg-1 col-md-1 col-sm-1"></div>
	<div class="col-lg-10 col-md-10 col-sm-10 article">
		<!-- start article -->
		<div class="col-lg-12 post">
			<div class="postprofile col-lg-3">
				<dl>
					<dt>
						<div class="authordiv img-circle">
						<img  class="authorimg" src="/members/show?memberId=${article.memberId}">
						</div>
						<h3><a href="#">${article.nickname}</a></h3>
						
					</dt>
					<dd>Post:</dd>
					<dd>Joined:${article.member.memberRegiDate}</dd>
				</dl>
			
			</div>
			<div class="postbody col-lg-9">		
				<div class="pbhead">
				<h2>【${article.articleType}】${article.articleTitle}</h2>
				<ul>
					<li><a href="#" class="btn-danger" title="report"><i class="fa fa-warning"></i></a></li>
					<li><a href="#" class="btn-success" title="comments"><i class="fa fa-comments-o"></i></a></li>
					<li><a href="#" class="btn-warning" title="reply"><i class="fa fa-reply"></i></a></li>
					<li><a href="/articles/edit?articleId=${article.articleId}" class="btn-info" title="edit"><i class="fa fa-pencil"></i></a></li>
				</ul>
				<small style="clear:both;">&nbsp&nbsp<i class="fa fa-clock-o"></i>&nbsp${fn:substring(article.articleTime,0,19)}</small>
				</div>
				<div class="content">
				${article.articleContent}
				</div>
			</div>
		</div>
		<!-- end of article -->
		
		<!-- start articleCM -->
		<c:forEach var="acm" items="${article.acms}">
		<div class="col-lg-12 post">
			<div class="postprofile col-lg-3">
				<dl>
					<dt>
						<div class="authordiv img-circle">
						<img  class="authorimg" src="/members/show?memberId=${acm.memberId}">
						</div>
						<h3><a href="#">${acm.member.nickname}</a></h3>
						
					</dt>
					<dd>Post:</dd>
					<dd>Joined:${acm.member.memberRegiDate}</dd>
				</dl>
			
			</div>
			<div class="postbody col-lg-9">		
				<div class="pbhead">
				<h2>RE:【${article.articleType}】${article.articleTitle}</h2>
				<ul>
					<li><a href="#" class="btn-danger" title="report"><i class="fa fa-warning"></i></a></li>
					<li><a href="#" class="btn-success" title="comments"><i class="fa fa-comments-o"></i></a></li>
					<li><a href="#" class="btn-warning" title="reply"><i class="fa fa-reply"></i></a></li>
					<li><a href="#" class="btn-info" title="edit"><i class="fa fa-pencil"></i></a></li>
				</ul>
				<small style="clear:both;">&nbsp&nbsp<i class="fa fa-clock-o"></i>&nbsp${fn:substring(acm.acmTime,0,19)}</small>
				</div>
				<div class="content">
				${acm.acmMsg}
				</div>
			</div>
		</div>		
		</c:forEach>
		<!-- end of articleCM -->
		
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
	
	<script>
	$(function(){
		/*
		 * ============ USER IMG ===========
		 */
		var w = $('.authorimg',this).width();
		var h = $('.authorimg',this).height();
		console.log(w);
		console.log(h);
		if (h > w) {
			$('.authorimg',this).addClass('portrait');
		} else {
			$('.authorimg',this).removeClass('portrait');
		}
		
// 		$('.post').hover(function(){
// 			$(this).addClass();
// 		})
		
	});
	
	
	</script>
<!-- https://themeforest.net/item/flatboots-phpbb-31-and-30-/8536771 -->
<!-- http://preview.themeforest.net/item/flatboots-phpbb-31-and-30-/full_screen_preview/8536771 -->
<!-- http://preview.themeforest.net/item/eles-responsive-phpbb-31-theme/full_screen_preview/13769708 -->
<!-- http://www.rockettheme.com/phpbb/styles -->
</body>
</html>