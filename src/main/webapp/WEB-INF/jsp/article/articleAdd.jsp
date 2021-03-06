<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>FORUM - 發表新文章</title>
    <meta http-equiv="x-frame-options" content="sameorigin">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    <link rel="stylesheet" href="/css/article/summernote.css">
    
    <!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

<style>
.bgcolor{
	background: -webkit-linear-gradient(#EBDBFF , #FFEFD5); /* For Safari 5.1 to 6.0 */
 	background: -o-linear-gradient(#EBDBFF , #FFEFD5); /* For Opera 11.1 to 12.0 */
  	background: -moz-linear-gradient(#EBDBFF , #FFEFD5); /* For Firefox 3.6 to 15 */
  	background: linear-gradient(#EBDBFF , #FFEFD5); /* Standard syntax */
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
		                <h4><span>發表新文章</span></h4>
		            </div>
		        </div>
	</section>
	
	<FORM id="addForm">
		<div class="row">
			<div class="form-group">
				<div class="col-lg-2">
					<input type="hidden" name="memberId" value="${memberId}"/>
					<input type="hidden" name="articleView" value="0"/>
					<input type="hidden" name="articleShow" value="true"/>
					<input type="hidden" name="articleReport" value="0"/>
					<select name="articleType" class="form-control" >
					<option value="" disabled selected hidden>--請選擇分類--</option>
					<option value="news">NEWS</option>
					<option value="solicit">SOLICIT</option>
					<option value="question">QUESTION</option>
					<option value="chat">CHAT</option>			
					</select>
				</div>
				<div class="col-lg-10">
					<input type="text" name="articleTitle" id="articleTitle" class="form-control" value="${param.articleTitle}" placeholder="請輸入文章標題">
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
					<button class="btn btn-default btn-lg" type="button" data-toggle="modal" data-target="#myModal" onclick="toModal()"><i class="fa fa-check fa-fw" aria-hidden="true"></i>&nbsp;送出</button>
					<button class="btn btn-default btn-lg" type="button" name="cancel" onclick="location='/articles/listfms'"><i class="fa fa-close" aria-hidden="true"></i>&nbsp;取消</button>
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
        	<button type="button" name="confirm" id="confirm" class="btn btn-default" data-dismiss="modal">確認送出</button>
        	<button type="button" class="btn btn-default" id="cancel" data-dismiss="modal"></button>
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
		$('#addForm').validate({
			onfocusout: function (element) {
		        $(element).valid();
		    },
			rules:{
				articleType:{required:true},
				articleTitle:{required:true},
// 				articleContent:{required:true},
			},//end of rules
			messages:{
				articleType:'請選擇文章類型',
				articleTitle:'請輸入文章標題',
// 				articleContent:'必填'
			},//end of messages			
		});
		

		$('#confirm').on('click',function(){

// 			var ckeditorvalue = CKEDITOR.instances['content'].getData();
// 			var datas={'memberId':'${memberId}','articleType':$(':selected').val(),'articleTitle':$(':text[name=articleTitle]').val(),'articleContent':ckeditorvalue};
// 			console.log(JSON.stringify(datas));
			$('#articleContent').val(CKEDITOR.instances['articleContent'].getData().replace(/\n/g,""));
			$.ajax({
					url:'/articles/insert',
					type:'post',
					contentType:'application/json;charset=UTF-8',
// 					data:JSON.stringify(datas),
					data:JSON.stringify($('#addForm').serializeObject()),
					dataType:'json',
					success:function(data){
// 						console.log(data);
						location.href="/articles/listfms";
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
	
	function toModal(){
		if($('#addForm').validate().form() && CKEDITOR.instances['articleContent'].getData().replace(/&nbsp;/g,'').replace(/<p>/g, "").replace(/<\/p>/g,"").trim().length != 0){
// 		if($('#addForm').validate().form() && CKEDITOR.instances['articleContent'].getData() != ""){
			$(".modal-title").text('請確認文章內容');
			$(".modal-body").empty()
							.append('<h2>【'+$(':selected').text()+'】'+$(':text[name=articleTitle]').val() +'</h2>')	
							.append(CKEDITOR.instances['articleContent'].getData());
			$('#confirm').show();
			$('#cancel').text('取消');
		}else{
			$(".modal-title").text('請修正錯誤');
			$(".modal-body").empty()
							.append('<p>請依錯誤訊息填入必填欄位</p>');
			$('#confirm').hide();
			$('#cancel').text('關閉');
			
		}
	}
	
// 	function check(){
// // 		console.log(CKEDITOR.instances['articleContent'].getData().replace(/&nbsp;/g,'').replace(/<p>/g, "").replace(/<\/p>/g,"").trim().length);
// 		console.log(CKEDITOR.instances['articleContent'].getData().replace(/[&nbsp;<p><\/p>]/g,'').trim().length);
// 	}


	</script>

</body>
</html>