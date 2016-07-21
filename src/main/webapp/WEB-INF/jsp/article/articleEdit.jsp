<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--  BASE CSS STYLE  -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/bms/style.min.css" rel="stylesheet">
	<link href="/css/bms/default.css" rel="stylesheet" id="theme">
	<link href="/css/bms/bms-customize.css" rel="stylesheet">
	<script src="/js/bms/pace.min.js"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<title>Article Edit</title>
<style>

</style>
</head>
<body>
	<!-- page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
	
	<c:import url="/WEB-INF/jsp/bms/bms_header.jsp" />
	<c:import url="/WEB-INF/jsp/bms/bms_navbar-side.jsp" />	
	
		<!-- page content -->
		<div id="content" class="content">
			<!-- breadcrumb 目前位置 -->
			<ol class="breadcrumb pull-right">
				<li><a href="<% request.getContextPath(); %>/bms">Home</a></li>
				<li><a href="javascript:;">Page Options</a></li>
				<li class="active">Blank Page</li>
			</ol>
			
			<!-- page-header 每頁標題 副標 -->
			<h1 class="page-header">Dashboard <small>overview of background management system</small></h1>
			
			<!-- 內文 -->
			<div class="row">
			    <div class="col-md-12 ui-sortable">
	            <!-- **每頁不同的內容從這裡開始** -->

<h1>Article EditPage</h1>
<FORM id="editForm">
	<TABLE>
		<TR>
			<TD>文章ID:</TD>
			<TD><input type="text" name="articleId" value="${article.articleId}" readonly='readonly'/></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>會員ID:</TD>
			<TD><input type="text" name="memberId" value="${article.member.memberId}" readonly='readonly'/></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>發文類型:</TD>
			<TD>
			<select name="articleType" style="min-width:100px; max-width:120px;">
			<option value="news">情報</option>
			<option value="solicit">徵文</option>
			<option value="question">問題</option>
			<option value="chat">閒聊</option>			
			</select>
			</TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>文章標題:</TD>
			<TD><input type="text" name="articleTitle" value="${article.articleTitle}"/></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>內文:</TD>
			<TD>
			<textarea name="article">${article.articleContent}</textarea>
			</TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>發布時間:</TD>
			<TD>
			<input type="text" name="articleTime" value="${article.articleTime}" readonly="readonly"/>
			</TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>收藏數:</TD>
			<TD><input type="text" name="articleCollect" value="${article.articleCollect}"/></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>顯示隱藏:</TD>
			<TD>
			<input type="radio" name="articleShow" id="true" value="true" checked="checked"/>顯示
			<input type="radio" name="articleShow" id="false" value="false"/>隱藏
			</TD>
			<TD><input type="hidden" id="articleShowStatus" value="${article.articleShow}"/></TD>
		</TR>
		<TR>
			<TD>檢舉次數:</TD>
			<TD><input type="text" name="articleReport" value="${article.articleReport}"/></TD>
			<TD></TD>
		</TR>
	
	</TABLE>
<input type="button" name="save" id="save" value="save"/>
<input type="button" name="cancel" value="cancel" onclick="location='/articles/list'"/>
</FORM>

<div id='result'>
<h2></h2>
<!-- <span id="articleId"></span><br/> -->
<span id="memberId"></span><br/>
<span id="articleType"></span><br/>
<span id="articleTitle"></span><br/>
<span id="article"></span><br/>
<span id="articleTime"></span><br/>
<span id="articleCollect"></span><br/>
<span id="articleShow"></span><br/>
<span id="articleReport"></span><br/>
</div>

	            <!-- **每頁不同的內容 end** -->     
			    </div><!-- /end .col-md-12 -->
			</div> <!-- /end .row -->
		</div>
		<!-- /end #content -->
		<!-- scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- /end page container -->
	
	<!--  BASE JS  -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bms/jquery.slimscroll.min.js"></script>
	<script src="/js/bms/bms.js"></script>

</body>
<script src="/js/jquery.validate.min.js"></script>
<script>
$(function(){
	$('#'+$('#articleShowStatus').val()).prop('checked',true);
	$('#editForm').validate({
		onfocusout: function (element) {
	        $(element).valid();
	    },
		rules:{
			articleTitle:{required:true},
			article:{required:true},
		},//end of rules
		messages:{
			articleTitle:'必填',
			article:'必填'
		},//end of messages
		
	});
		
	$('#save').click(function(){

		console.log(JSON.stringify($('#editForm').serializeObject()));
		
		if($('#editForm').validate().form()){
			$.ajax({
				url:'/articles/update',
				type:'post',
				contentType:'application/json;charset=UTF-8',
				data:JSON.stringify($('#editForm').serializeObject()),
				dataType:'json',
				success:function(data){
					console.log(data);
					console.log(data.articleTime);
					var t = data.articleTime;
								
					$('#result>h2').text('Update Success');
					//$('#articleId').text('ArticleId:'+data.articleId);
					$('#memberId').text('memberId:'+data.memberId);
					$('#articleType').text('articleType:'+data.articleType);
					$('#articleTitle').text('articleTitle:'+data.articleTitle);
					$('#article').text('article:'+data.article);
					$('#articleTime').text(t);
					$('#articleCollect').text('articleCollect:'+data.articleCollect);
					$('#articleShow').text('articleShow:'+data.articleShow);
					$('#articleReport').text('articleReport:'+data.articleReport);
				}
			})
		
		}
	
	});

	$.fn.serializeObject = function()
	{
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	        if (o[this.name] !== undefined) {
	            if (!o[this.name].push) {
	                o[this.name] = [o[this.name]];
	            }
	            o[this.name].push(this.value || '');
	        } else {
	            o[this.name] = this.value || '';
	        }
	    });
	    return o;
	};
});


</script>
</html>