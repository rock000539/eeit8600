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
    <title>Article Add</title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
		
</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
<h1>Article AddPage</h1>
	<FORM id="addForm">
		<TABLE>
	<!-- 		<TR> -->
	<!-- 			<TD>文章ID:</TD> -->
	<%-- 			<TD><input type="text" name="articleId" value="${param.articleId}"/></TD> --%>
	<!-- 			<TD></TD> -->
	<!-- 		</TR> -->
			<TR>
				<TD>會員ID:</TD>
				<TD><input type="text" name="memberId" value="${param.member.memberId}"/></TD>
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
				<TD><input type="text" name="articleTitle" value="${param.articleTitle}"/></TD>
				<TD></TD>
			</TR>
			<TR>
				<TD>內文:</TD>
				<TD>
				<textarea name="article"></textarea>
				</TD>
				<TD></TD>
			</TR>
			<TR>
	<!-- 			<TD>發布時間:</TD> -->
	<!-- 			<TD> -->
	<%-- 			<input type="text" name="articleTime" value="${param.articleTime}"/> --%>
	<!-- 			</TD> -->
				<TD><input type="hidden" id="articleTime"/></TD>
			</TR>
			<TR>
				<TD>收藏數:</TD>
				<TD><input type="text" name="articleCollect" value="${param.articleCollect}"/></TD>
				<TD></TD>
			</TR>
			<TR>
				<TD>顯示隱藏:</TD>
				<TD>
				<input type="radio" name="articleShow" id="true" value="true" checked="checked"/>顯示
				<input type="radio" name="articleShow" id="false" value="false"/>隱藏
				</TD>
				<TD></TD>
			</TR>
			<TR>
				<TD>檢舉次數:</TD>
				<TD><input type="text" name="articleReport" value="${param.articleReport}"/></TD>
				<TD></TD>
			</TR>
		
		</TABLE>
	<input type="button" name="save" id="save" value="save" />
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
		$('#addForm').validate({
			onfocusout: function (element) {
		        $(element).valid();
		    },
			rules:{
				memberId:{required:true},
				articleTitle:{required:true},
				article:{required:true},
			},//end of rules
			messages:{
				memberId:'必填',
				articleTitle:'必填',
				article:'必填'
			},//end of messages
			
		});
		
		
		$('#save').click(function(){
			
			console.log(JSON.stringify($('#addForm').serializeObject()));
			
	 		if($('#addForm').validate().form()){
				$.ajax({
					url:'/articles/insert',
					type:'post',
					contentType:'application/json;charset=UTF-8',
					data:JSON.stringify($('#addForm').serializeObject()),
					dataType:'json',
					success:function(data){
						console.log(data);
						console.log(data.articleTime);
						var t = data.articleTime;
						$('#addForm')[0].reset();			
						$('#result>h2').text('Insert Success');
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
	

</body>
</html>