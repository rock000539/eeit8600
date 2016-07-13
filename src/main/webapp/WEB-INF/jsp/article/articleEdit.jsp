<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/js/jquery.validate.min.js"></script>
<title>Article Edit</title>
<style>

</style>
</head>
<body>
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
			<textarea name="article">${article.article}</textarea>
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

</body>
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