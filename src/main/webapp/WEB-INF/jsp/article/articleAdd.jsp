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
    <link rel="stylesheet" href="/css/article/summernote.css">


</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
<div class="row sub_content">
	<div class="col-lg-2 col-md-2 col-sm-2"></div>
	<div class="col-lg-8 col-md-8 col-sm-8">
	<FORM id="addForm">
	<input type="hidden" name="memberId" value="${memberId}"/>
		<TABLE>
			<TR>
				<TD>發文類型:</TD>
				<TD>
				<select name="articleType" class="form-control" style="min-width:100px; max-width:120px;">
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
				<TD><input type="text" name="articleTitle" id="name" class="form-control" value="${param.articleTitle}" placeholder="ArticleTitle"></TD>
				<TD></TD>
			</TR>
			<TR>
				<TD>內文:</TD>
				<TD>
				<textarea class="summernote" name="article"></textarea>
				</TD>
				<TD></TD>
			</TR>
			<TR>
	<!-- 			<TD>發布時間:</TD> -->
	<!-- 			<TD> -->
	<%-- 			<input type="text" name="articleTime" value="${param.articleTime}"/> --%>
	<!-- 			</TD> -->
<!-- 				<TD><input type="hidden" id="articleTime"/></TD> -->
			</TR>
		</TABLE>
	<button class="btn btn-default btn-lg" type="button" name="save" id="save">Save</button>
	<button class="btn btn-default btn-lg" type="button" name="cancel" onclick="location='/articles/listfms'">Cancel</button>
	</FORM>
	</div>
	<div class="col-lg-2 col-md-2 col-sm-2"></div>
</div>
	
	<div id='result'>
	<h2></h2>
	<span id="memberId"></span><br/>
	<span id="articleType"></span><br/>
	<span id="articleTitle"></span><br/>
	<span id="article"></span><br/>
	<span id="articleTime"></span><br/>

	</div>
				</div>        
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	

	<script src="/js/jquery.validate.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>
	
	<script type="text/javascript" src="/js/article/summernote.js"></script>
	
	<script>
	$(function(){
		
		//驗證
// 		$('#addForm').validate({
// 			onfocusout: function (element) {
// 		        $(element).valid();
// 		    },
// 			rules:{
// 				articleTitle:{required:true},
// 				article:{required:true},
// 			},//end of rules
// 			messages:{
// 				articleTitle:'必填',
// 				article:'必填'
// 			},//end of messages			
// 		});
		
		$('.summernote').summernote({height: 200});

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
// 						console.log(data);
// 						console.log(data.articleTime);
						var t = data.articleTime;
						$('#addForm')[0].reset();			
						$('#result>h2').text('Insert Success');
// 						$('#articleId').text('ArticleId:'+data.articleId);
// 						$('#memberId').text('memberId:'+data.memberId);
						$('#articleType').text('articleType:'+data.articleType);
						$('#articleTitle').text('articleTitle:'+data.articleTitle);
						$('#article').text('article:'+data.article);
						$('#articleTime').text('articleTime:'+data.articleTime);
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