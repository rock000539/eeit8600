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

.breadcrumb-line{position:relative;margin:0 0 35px;border-radius:4px;background-color:#e1e5eb;}
.breadcrumb{
/*  	background:rgba(0,0,0,0); */
/* 	border-radius:0; */
	height:40px;
	line-height:40px;
	margin:0;
	overflow:hidden;
	padding:0 20px 0 0;
	text-overflow:ellipsis;
	white-space:nowrap
}
.breadcrumb-buttons{background:#d7dee3;border-radius:0 4px 4px 0;display:inline-block;list-style:none;margin:0;padding-left:15px;position:absolute;right:0;top:0}
.breadcrumb .icon,.breadcrumb-buttons .icon{font-size:18px;vertical-align:text-bottom}
.breadcrumb-buttons li a{line-height:40px;position:relative;margin-right:14px;text-decoration:none}
.breadcrumb li{display:inline}
.breadcrumb li a{-webkit-transition:none 0s ease 0s;transition:none 0s ease 0s;text-align:center;text-decoration:none;}
.breadcrumb li:first-child a{
	background:#c8d2d8;
	padding: 11px 15px;
	display:inline-block;
	border-radius:4px 0 0 4px;
	color: #888;
}
.breadcrumb .icon{font-size:18px}
.breadcrumb>li+li:before{font-family:"FontAwesome";content:"\f054";vertical-align:middle;color: #ccc;}
.breadcrumb li:last-child a{font-weight:700;color:#888}

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
 	border-radius:4px;
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
.postprofile h3{
	margin:5px 0 0;
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
    margin-top:15px;
    content: "";
    background-color: #ee836e;
}

/*reply area*/
/*dividerHeading*/
.dividerHeading,
.widget_title
{
    text-align: center;
    position: relative;
    margin-bottom:25px;
}
.dividerHeading h4,
.widget_title h4
{
    font-size:18px;
    position:relative;
    line-height:0;
    border-bottom: 1px solid #727CB6;
}
.dividerHeading h4 span{
    background:white;
    position:relative;
    line-height: 7px;
    top: 4px;
    display: inline-block;

}
.dividerHeading h4 span:before,
.dividerHeading h4 span:after,
.widget_title h4 span:after,
.widget_title h4 span:before
{
    color:#E74C3C;
    font-size:10px;
    content: "\f10c";
    font-family:fontawesome;
    display: inline-block;

}
.dividerHeading h4 span:before,
.widget_title h4 span:before
{
    margin-right:10px ;
}
.dividerHeading h4 span:after,
.widget_title h4 span:after
{
    margin-left:10px ;
}

/* 修改樣式 */

.dividerHeading h4 span:after, 
.widget_title h4 span:after, 
.widget_title h4 span:before {
    color: #727CB6;
}

.dividerHeading h4 span:before, 
.dividerHeading h4 span:after, 
.widget_title h4 span:after, 
.widget_title h4 span:before {
    color: #727CB6;
}

.dividerHeading h4 span {
    background: #faeadf; /*new post bgcolor*/
}
		
.dividerHeading h4,
.widget_title h4{
    font-size: 21px;
    font-weight: normal;
    margin-bottom: 0px;
    padding: 0px;
    position: relative;
}

.dividerHeading h4::before, .widget_title h4::before { 
	border: 0px;
    content: none;
}

#addForm button{
	margin:0 5px;
}

.hasbutton{
	text-align:center; 
	margin-top:20px;
	margin-bottom:20px;
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
	<div class="breadcrumb-line clearfix">
		<ul class="breadcrumb">
				   <li><a href="/articles/listfms" data-original-title="" title=""><span class="icon fa fa-home"></span></a></li>
		   		   <li><a href="/articles/listfms?articleType=${article.articleType}" data-navbar-reference="index" itemprop="url" data-original-title="" title=""><span itemprop="title">${article.articleType}</span></a></li>
		</ul>
	</div>
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
<!-- 					<li><a href="#" class="btn-warning" title="reply"><i class="fa fa-reply"></i></a></li> -->
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
		
		<!-- REPLY -->
		<section class="team row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12" style="margin-top:30px;">
			            <div class="dividerHeading">
			                <h4><span>Reply</span></h4>
			            </div>
			        </div>
		</section>
		<FORM id="addForm" action="/articles/insert" method="post">
		<div class="row">
			<div class="form-group">
				<div class="col-lg-12">
					<input type="hidden" name="memberId" value="${memberId}"/>
					<input type="text" name="articleTitle" id="articleTitle" class="form-control" value="RE:【${article.articleType}】${article.articleTitle}">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-lg-12">
					<textarea class="ckeditor" id="articleContent" name="articleContent" cols="80" rows="12"></textarea>
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="form-group">
				<div class="col-lg-12 hasbutton">
	<!-- 				<button class="btn btn-default btn-lg" type="button" name="save" id="save"><i class="fa fa-check fa-fw" aria-hidden="true"></i>&nbspSave</button> -->
					<button class="btn btn-default btn-lg" type="button" data-toggle="modal" data-target="#myModal" onclick="toModal()"><i class="fa fa-check fa-fw" aria-hidden="true"></i>&nbspReply</button>
				</div>
			</div>
		</div>		
		</FORM>
	</div>
	<div class="col-lg-1 col-md-1 col-sm-1"></div>	
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
<!--       Modal content -->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
        	<button type="button" name="confirm" id="confirm" class="btn btn-default" data-dismiss="modal">Confirm</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
</div>
<!-- end of Modal -->
					
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
	
	<script src="/ckeditor/ckeditor.js"></script>
	
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
	
	function toModal(){
		if($('#addForm').validate().form() && CKEDITOR.instances['articleContent'].getData()!=""){
			$(".modal-title").text('Please Check Your Post');
			$(".modal-body").empty()
							.append('<p>Post Type：'+$(':selected').val()+'</p>')
							.append('<p>Title：'+ $(':text[name=articleTitle]').val() +'</p>')		
							.append('<p>Content：'+ CKEDITOR.instances['articleContent'].getData() +'</p>');
			$('#confirm').show();
		}else{
			$(".modal-title").text('Please Modify Your Post');
			$(".modal-body").empty()
							.append('<p>Please Enter the Required Fields</p>');
			$('#confirm').hide();
			
		}
	}
	
	</script>
<!-- https://themeforest.net/item/flatboots-phpbb-31-and-30-/8536771 -->
<!-- http://preview.themeforest.net/item/flatboots-phpbb-31-and-30-/full_screen_preview/8536771 -->
<!-- http://preview.themeforest.net/item/eles-responsive-phpbb-31-theme/full_screen_preview/13769708 -->
<!-- http://www.rockettheme.com/phpbb/styles -->
</body>
</html>