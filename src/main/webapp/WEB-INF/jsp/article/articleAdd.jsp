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

<style>
.bgcolor{
/* 	background-color:#EBDBFF; */
	background: -webkit-linear-gradient(#EBDBFF , #FFEFD5); /* For Safari 5.1 to 6.0 */
 	background: -o-linear-gradient(#EBDBFF , #FFEFD5); /* For Opera 11.1 to 12.0 */
  	background: -moz-linear-gradient(#EBDBFF , #FFEFD5); /* For Firefox 3.6 to 15 */
  	background: linear-gradient(#EBDBFF , #FFEFD5); /* Standard syntax */
/* 	padding:40px; */
/* 	border-radius:10px; */
}

.article > section{
	padding-top: 0;
	padding-bottom:10px;
}

#addForm > table{
width:72vw;
}

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
    background: #EBDBFF; /*new post bgcolor*/
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

select { 
	text-align-last:center; 
}

.hasbutton{
	text-align:center; 
	margin-top:20px;
	margin-bottom:20px;
}

/* .col-lg-12:has(button){ */
/* text-align:center; margin-top:20px; */
/* } */


</style>

</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row bgcolor">
<div class="row sub_content">

	<div class="col-lg-1 col-md-1 col-sm-1"></div>
	<div class="col-lg-10 col-md-10 col-sm-10 article">
		<section class="team row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12" style="margin-top:30px;">
			            <div class="dividerHeading">
			                <h4><span>Post A New Topic</span></h4>
			            </div>
			        </div>
		</section>
	<FORM id="addForm" action="/articles/insert" method="post">
	<div class="row">
		<div class="form-group">
			<div class="col-lg-3">
				<input type="hidden" name="memberId" value="${memberId}"/>
				<select name="articleType" class="form-control" >
				<option value="" disabled selected hidden>--Select your Type--</option>
				<option value="news">情報</option>
				<option value="solicit">徵文</option>
				<option value="question">問題</option>
				<option value="chat">閒聊</option>			
				</select>
			</div>
			<div class="col-lg-9">
				<input type="text" name="articleTitle" id="articleTitle" class="form-control" value="${param.articleTitle}" placeholder="Please Enter Your Title">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group">
			<div class="col-lg-12">
				<textarea class="ckeditor" id="content" name="articleContent" cols="80" rows="12"></textarea>
			</div>
		</div>
	</div>	
	<div class="row">
		<div class="form-group">
			<div class="col-lg-12 hasbutton">
				<button class="btn btn-default btn-lg" type="button" name="save" id="save"><i class="fa fa-check fa-fw" aria-hidden="true"></i>&nbspSave</button>
				<button class="btn btn-default btn-lg" type="button" name="cancel" onclick="location='/articles/listfms'"><i class="fa fa-close" aria-hidden="true"></i>&nbspCancel</button>
			</div>
		</div>
	</div>	
<!-- 	<TABLE> -->
<!-- 			<TR> -->
<!-- 				<TD><h3>Category:</h3></TD> -->
<!-- 				<TD> -->
<!-- 				<select name="articleType" class="form-control" style="min-width:100px; max-width:120px;"> -->
<!-- 				<option value="news">情報</option> -->
<!-- 				<option value="solicit">徵文</option> -->
<!-- 				<option value="question">問題</option> -->
<!-- 				<option value="chat">閒聊</option>			 -->
<!-- 				</select> -->
<!-- 				</TD> -->
<!-- 			</TR> -->
<!-- 			<TR> -->
<!-- 				<TD><h3>Title:</h3></TD> -->
<%-- 				<TD><input type="text" name="articleTitle" id="articleTitle" class="form-control" value="${param.articleTitle}" placeholder="Title"></TD> --%>
<!-- 			</TR> -->
<!-- 			<TR> -->
<!-- 				<TD colspan="2"><textarea class="ckeditor" id="content" name="articleContent" cols="80" rows="12"></textarea></TD> -->
<!-- 			</TR> -->
<!-- 			<TR> -->
<!-- 				<TD colspan="2" style="padding-top:20px;text-align: center"> -->
<!-- 				<button class="btn btn-default btn-lg" type="button" name="save" id="save"><i class="fa fa-check fa-fw" aria-hidden="true"></i>&nbspSave</button> -->
<!-- 				<button class="btn btn-default btn-lg" type="button" name="cancel" onclick="location='/articles/listfms'"><i class="fa fa-close" aria-hidden="true"></i>&nbspCancel</button> -->
<!-- 				</TD> -->
<!-- 			</TR> -->
<!-- 	</TABLE> -->
	
	</FORM>
	</div>
	<div class="col-lg-1 col-md-1 col-sm-1"></div>
	
</div>
	
<!-- 	<div id='result'> -->
<!-- 	<h2></h2> -->
<!-- 	<span id="memberId"></span><br/> -->
<!-- 	<span id="articleType"></span><br/> -->
<!-- 	<span id="articleTitle"></span><br/> -->
<!-- 	<span id="articleContent"></span><br/> -->
<!-- 	<span id="articleTime"></span><br/> -->
<!-- 	</div> -->
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
	
	<script src="/ckeditor/ckeditor.js"></script>
	
	<script>
	$(function(){
		
		//驗證
// 		$('#addForm').validate({
// 			onfocusout: function (element) {
// 		        $(element).valid();
// 		    },
// 			rules:{
// 				articleType:{required:true},
// 				articleTitle:{required:true},
// 				articleContent:{required:true},
// 			},//end of rules
// 			messages:{
// 				articleType:'必填',
// 				articleTitle:'必填',
// 				articleContent:'必填'
// 			},//end of messages			
// 		});
		
// 		$('.summernote').summernote({height: 200});
		
		$('#check').click(function(){		
			var value = CKEDITOR.instances['content'].getData();
			console.log(value);
		});
		
		$('#save').on('click',function(){
// 			var ckeditorvalue = CKEDITOR.instances['content'].getData();
// 			var datas={'memberId':'${memberId}','articleType':$(':selected').val(),'articleTitle':$(':text[name=articleTitle]').val(),'articleContent':ckeditorvalue};
// 			console.log(JSON.stringify(datas));
			$('#content').val(CKEDITOR.instances['content'].getData());
			console.log(JSON.stringify($('#addForm').serializeObject()));
			$.ajax({
					url:'/articles/insert',
					type:'post',
					contentType:'application/json;charset=UTF-8',
// 					data:JSON.stringify(datas),
					data:JSON.stringify($('#addForm').serializeObject()),
					dataType:'json',
					success:function(data){
// // 						console.log(data);
// // 						console.log(data.articleTime);
// 						var t = data.articleTime;
// 						$('#addForm')[0].reset();			
// 						$('#result>h2').text('Insert Success');
// // 						$('#articleId').text('ArticleId:'+data.articleId);
// // 						$('#memberId').text('memberId:'+data.memberId);
// 						$('#articleType').text('articleType:'+data.articleType);
// 						$('#articleTitle').text('articleTitle:'+data.articleTitle);
// 						$('#articleContent').text('articleContent:'+data.articleContent);
// 						$('#articleTime').text('articleTime:'+data.articleTime);
	 				}
				});		
			
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