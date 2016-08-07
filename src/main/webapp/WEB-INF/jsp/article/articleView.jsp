<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title></title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    <link rel="stylesheet" href="/css/article/article_view.css">
	
	<!-- Sweet Alert 2 -->
	<link rel="stylesheet" href="/css/product/sweetalert2.min.css">
	
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	
</head>

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
		<div class="col-lg-12 post" style="margin-bottom:0px; border-top:#727CB6 solid 3px;">
			<div class="postprofile col-lg-3">
				<dl>
					<dt>
						<div class="authordiv img-circle">
						<img  class="authorimg" src="/members/show?memberId=${article.memberId}">
						</div>
						<h3><a href="/members/overview/${article.memberId}">${article.nickname}</a></h3>
						
					</dt>
					<dd>發文數:${article.articlesWorteByAuthorSize}</dd>
					<dd>註冊日期:${article.memberRegiDate}</dd>
				</dl>			
			</div>
			
			<div class="postbody col-lg-9">		
				<div class="pbhead">
					<h2>【${article.articleType}】${article.articleTitle}</h2>
					<ul>
						<li><a class="btn-danger" title="檢舉" data-toggle="modal" data-target="#reportModal"><i class="fa fa-warning"></i></a></li>
						<li><a href="#collapseArticle" class="btn-success" title="留言" data-toggle="collapse" data-target="#collapseArticle"><i class="fa fa-comments-o"></i></a></li>
						<li><a href="#replyarea" class="btn-warning" title="回覆"><i class="fa fa-reply"></i></a></li>
						<c:if test="${article.memberId==memberId}">
							<li><a href="/articles/edit/${article.articleId}" class="btn-info" title="編輯"><i class="fa fa-pencil"></i></a></li>
						</c:if>
						<li><a class="btn-info btn-like" title="收藏" onclick="like_article(${article.articleId})"><i class="fa fa-heart"></i></a></li>
					</ul>
					<small style="clear:both;">&nbsp;&nbsp;<i class="fa fa-clock-o"></i>&nbsp;${fn:substring(article.articleTime,0,19)}</small>
				</div>
				<div class="content">
					${article.articleContent}
					<ul>
						<li style="color:#4cae4c;" data-toggle="collapse" data-target="#collapseArticle">
							<i class="fa fa-comments-o"></i><span id="acms_num">&nbsp;${article.acms.size()}</span>
						</li>
						<li style="color:#ff9600;"><i class="fa fa-reply"></i><span id="ar_num">&nbsp;${arSize}</span></li>
						<li style="color:#ff007f;"><i class="fa fa-heart"></i><span id="memberSave_num">&nbsp;${article.memberSave.size()}</span></li>
					</ul>
				</div>
			</div>			
		</div>
		
		<!-- start articleComment -->
		<div class="col-lg-12" style="padding:0px;">
			<div class="panel-group">
				<div class="panel panel-default">
			      	<div id="collapseArticle" class="panel-collapse collapse">
			        <ul class="list-group" id="articleCMsArea" >
			        	<c:forEach var="acm" items="${article.acms}">
				        	<li class="list-group-item">
					        	<div class="msgAuthordiv authordiv img-circle" style="float:left;">
									<img  class="authorimg" src="/members/show?memberId=${acm.memberId}">
								</div>
					        	<span style="margin-left:10px; color:#337ab7; font-weight:bold;">
					        		<a href="/members/overview/${acm.memberId}">${acm.nickname}：</a>
					        	</span>
					        	<span>${acm.acmMsg}</span>  
					        	<span style="float:right;">
					        		${fn:substring(acm.acmTime,0,19)}
					        		<c:if test="${memberId!=acm.memberId}">
					        			<a href="#" style="margin-left:10px; color:#fff; background:black; padding:0 5px;"><i class="fa fa-fw fa-warning"></i>&nbsp;檢舉</a>
					        		</c:if>
					        		<c:if test="${memberId==acm.memberId}">
						        		<a style="margin-left:10px; color:#fff; background:black; padding:0 5px; cursor: pointer; " onclick="delete_acm(${acm.acmId},$(this))"><i class="fa fa-fw fa-close"></i>&nbsp;刪除</a>				        		
						        	</c:if>
					        	</span>			        	
				        	</li>
						</c:forEach>
			        </ul>
			        <div class="panel-footer">
			        	<form id="leaveMsg">
							<input type="hidden" name="memberId" value="${memberId}"/>
							<input type="hidden" name="articleId" value="${article.articleId}"/>
							<input type="hidden" name="acmShow" value="true"/>
							<input type="hidden" name="acmReport" value="0"/>
							<textarea name="acmMsg" id="acmMsg" class="form-control" placeholder="留言..." rows="1" style="resize:none;"></textarea>
						</form>
			        </div>
			      </div>
			    </div>
			</div>
		</div>
		<!-- end of articleComment -->
		<!-- end of article -->
		
		
		<!-- start articleReply -->
		<div id="articleReply">
			<c:forEach var="areply" items="${areplies}">
			<div class="col-lg-12 post">
				<div class="postprofile col-lg-3">
					<dl>
						<dt>
							<div class="authordiv img-circle">
							<img  class="authorimg" src="/members/show?memberId=${areply.memberId}">
							</div>
							<h3><a href="/members/overview/${areply.memberId}">${areply.nickname}</a></h3>
							
						</dt>
<!-- 						<dd>Post:</dd> -->
						<dd>註冊日期:${areply.memberRegiDate}</dd>
					</dl>
				
				</div>
				<div class="postbody col-lg-9">		
					<div class="pbhead">
					<h2>${areply.arTitle}</h2>
					<ul>
						<li><a href="#" class="btn-danger" title="檢舉"><i class="fa fa-warning"></i></a></li>
						<li><a href="#collapse${areply.arId}" class="btn-success" title="留言" data-toggle="collapse" data-target="#collapse${areply.arId}"><i class="fa fa-comments-o"></i></a></li>
						<li><a href="#replyarea" class="btn-warning" title="回覆"><i class="fa fa-reply"></i></a></li>
						<c:if test="${areply.memberId==memberId}">
							<li><a href="#" class="btn-info" title="編輯"><i class="fa fa-pencil"></i></a></li>
						</c:if>
					</ul>
					<small style="clear:both;">&nbsp;&nbsp;<i class="fa fa-clock-o"></i>&nbsp;${fn:substring(areply.arTime,0,19)}</small>
					</div>
					<div class="content">
						${areply.arContent}
						<ul>
							<li style="color:#4cae4c;" data-toggle="collapse" data-target="#collapse${areply.arId}">
								<i class="fa fa-comments-o"></i><span id="arcms${areply.arId}_num">&nbsp;${areply.arcms.size()}</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<!-- start articleReply comment-->
			<div class="col-lg-12" style="padding:0px;">
				<div class="panel-group">
					<div class="panel panel-default">
				      	<div id="collapse${areply.arId}" class="panel-collapse collapse">
				        <ul class="list-group">
				        	<c:forEach var="arcm" items="${areply.arcms}">
					        	<li class="list-group-item">
						        	<div class="msgAuthordiv authordiv img-circle" style="float:left;">
										<img  class="authorimg" src="/members/show?memberId=${arcm.memberId}">
									</div>
						        	<span style="margin-left:10px; color:#337ab7; font-weight:bold;">${arcm.nickname}：</span>
						        	<span>${arcm.arcmMsg}</span>  
						        	<span style="float:right;">
						        		${fn:substring(arcm.arcmTime,0,19)}
						        		<c:if test="${memberId!=arcm.memberId}">
							        		<a href="#" style="margin-left:10px; color:#fff; background:black; padding:0 5px;"><i class="fa fa-fw fa-warning"></i>&nbsp;檢舉</a>
						        		</c:if>
						        		<c:if test="${memberId==arcm.memberId}">
							        		<a href="#" style="margin-left:10px; color:#fff; background:black; padding:0 5px;"><i class="fa fa-fw fa-close"></i>&nbsp;刪除</a>				        		
							        	</c:if>
						        	</span>			        	
					        	</li>
							</c:forEach>
				        </ul>
				        <div class="panel-footer">
				        	<form name="leaveRCM">
								<input type="hidden" name="memberId" value="${memberId}"/>
								<input type="hidden" name="arId" value="${areply.arId}"/>
								<input type="hidden" name="arcmShow" value="true"/>
								<input type="hidden" name="arcmReport" value="0"/>
								<textarea name="arcmMsg" class="form-control" placeholder="留言..." rows="1" style="resize:none;" onkeydown="save_arcm(event,$(this))"></textarea>
							</form>
				        </div>
				      </div>
				    </div>
				</div>
			</div>		
			<!-- end of articleReply comment-->		
			
			</c:forEach>
		</div>
		<!-- end of articleReply -->

		<!-- Reply form-->
		<section class="team row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12" style="margin-top:30px;" id="replyarea">
			            <div class="dividerHeading">
			                <h4><span>回覆</span></h4>
			            </div>
			        </div>
		</section>
		<FORM id="replyForm">
		<div class="row">
			<div class="form-group">
				<div class="col-lg-12">
					<input type="hidden" name="memberId" value="${memberId}"/>
					<input type="hidden" name="articleId" value="${article.articleId}"/>
					<input type="hidden" name="arReport" value="0"/>
					<input type="hidden" name="arShow" value="true"/>
					<input type="text" name="arTitle" id="arTitle" class="form-control" value="RE:【${article.articleType}】${article.articleTitle}">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-lg-12">
					<textarea class="ckeditor" id="arContent" name="arContent" cols="80" rows="12"></textarea>
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="form-group">
				<div class="col-lg-12 hasbutton">
					<button class="btn btn-default btn-lg" id="btn_reply" type="button" data-toggle="modal" data-target="#myModal" onclick="toModal()"><i class="fa fa-reply fa-fw" aria-hidden="true"></i>&nbsp;送出</button>
					<a href = "/login"><button class="btn btn-warning btn-lg" id="btn_login" type="button">&nbsp;請先登入</button></a>
				</div>
			</div>
		</div>		
		</FORM>
		<!-- end of Reply form -->
	
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
					
<!-- Report Modal -->
<div class="modal fade" id="reportModal" role="dialog">
    <div class="modal-dialog">    
<!--       Modal content -->
      <div class="modal-content">
	      <div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<h4 class="modal-title">檢舉此文章</h4>
	      </div>
	      <div class="modal-body">
	      	<input type="text" class="form-control" id="reportTitle" name="reportTitle" placeholder="檢舉標題">
	      	<textarea cols="50" rows="5" class="form-control" id="reportDetail" name="reportDetail" placeholder="檢舉事由" style="resize:none"></textarea>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" name="sendReport" id="sendReport" class="btn btn-default" data-dismiss="modal">確認送出</button>
	      	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	      </div>
      </div>
      
    </div>
</div>
<!-- end of Report Modal -->

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
	
	<!-- Sweet Alert 2 -->
	<script type="text/javascript" src="/js/product/sweetalert2.min.js"></script>
	
	<script src="/ckeditor/ckeditor.js"></script>
	
	<!-- template -->
	<script id="article_reply" type="text/template">
	<div class="col-lg-12 post">
		<div class="postprofile col-lg-3">
			<dl>
				<dt>
					<div class="authordiv img-circle">
					<img  class="authorimg" src="/members/show?memberId=_memberId">
					</div>
					<h3><a href="/members/overview/_memberId">_nickname</a></h3>					
				</dt>
				<dd>註冊日期:_memberRegiDate</dd>
			</dl>
		</div>
		<div class="postbody col-lg-9">		
			<div class="pbhead">
			<h2>_arTitle</h2>
			<ul>
				<li><a href="#" class="btn-danger" title="檢舉"><i class="fa fa-warning"></i></a></li>
				<li><a href="#collapse_arId" class="btn-success" title="留言" data-toggle="collapse" data-target="#collapse_arId"><i class="fa fa-comments-o"></i></a></li>
				<li><a href="#replyarea" class="btn-warning" title="回覆"><i class="fa fa-reply"></i></a></li>
				<li><a href="#" class="btn-info" title="編輯"><i class="fa fa-pencil"></i></a></li>
			</ul>
			<small style="clear:both;">&nbsp;&nbsp;<i class="fa fa-clock-o"></i>&nbsp;_arTime</small>
			</div>
			<div class="content">
				_arContent
				<ul>
					<li style="color:#4cae4c;" data-toggle="collapse" data-target="#collapse_arId">
						<i class="fa fa-comments-o"></i><span id="arcms_arId_num">&nbsp;_arcmsSize</span>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="col-lg-12" style="padding:0px;">
		<div class="panel-group">
			<div class="panel panel-default">
		      	<div id="collapse_arId" class="panel-collapse collapse">
		        <ul class="list-group">
		        </ul>
		        <div class="panel-footer">
		        	<form name="leaveRCM">
						<input type="hidden" name="memberId" value="_memberId"/>
						<input type="hidden" name="arId" value="_arId"/>
						<input type="hidden" name="arcmShow" value="true"/>
						<input type="hidden" name="arcmReport" value="0"/>
						<textarea name="arcmMsg" class="form-control" placeholder="Write a comment" rows="1" style="resize:none;" onkeydown="save_arcm(event,$(this))"></textarea>
					</form>
		        </div>
		      </div>
		    </div>
		</div>
	</div>			
	</script>
	
	<script id="article_cm" type="text/template">
	<li class="list-group-item">
       	<div class="msgAuthordiv authordiv img-circle" style="float:left;">
			<img  class="authorimg" src="/members/show?memberId=_memberId">
		</div>
       	<span style="margin-left:10px; color:#337ab7; font-weight:bold;">
			<a href="/members/overview/_memberId">_nickname：</a>
		</span>
       	<span>_acmMsg</span>  
       	<span style="float:right;">_acmTime
			<a style="margin-left:10px; color:#fff; background:black; padding:0 5px; cursor: pointer; " onclick="delete_acm(_acmId,$(this))"><i class="fa fa-fw fa-close"></i>&nbsp;刪除</a>				        		
		</span>	
    </li>
	</script>
	
	<script>
	$(function(){
		
		$('title').text("【${article.articleType}】${article.articleTitle}");
		
		/* ============ USER IMG =========== */
		var list = $('.authorimg');
		for(var i = 0; i < list.length; i++) {
			var temp = $(list[i]);
			if (temp.height() > temp.width()) {
				temp.addClass('portrait');
			} else {
				temp.removeClass('portrait');
			}
		}
// 		console.log(list);

		//未登入不可reply
		if('${memberId}' == ''){
			$('#btn_login').show();
// 			$('#btn_reply').hide();
			$('#btn_reply').attr('disabled',true);
		} else { 
 			$('#btn_login').hide();
// 			$('#btn_reply').show();
			$('#btn_reply').attr('disabled',false);
		}
		
		//replyform驗證
		$('#replyForm').validate({
			onfocusout: function (element) {
		        $(element).valid();
		    },
			rules:{
				arTitle:{required:true},
			},//end of rules
			messages:{
// 				arTitle:'必填'
			},//end of messages			
		});
		
		
		// 文章回覆
		$('#confirm').on('click',function(){
			$('#arContent').val(CKEDITOR.instances['arContent'].getData());
			$.ajax({
					url:'/articlereplies/insert',
					type:'post',
					contentType:'application/json;charset=UTF-8',
					data:JSON.stringify($('#replyForm').serializeObject()),
					dataType:'json',
					success:function(data){
// 						console.log(data);
						$('#arTitle').val('RE:【${article.articleType}】${article.articleTitle}');
						CKEDITOR.instances['arContent'].setData('');
						$($('#article_reply').html()
										.replace(/_memberId/g,data.memberId)
										.replace('_nickname',data.nickname)
										.replace('_memberRegiDate',data.memberRegiDate)
										.replace('_arTitle',data.arTitle)
										.replace(/_arId/g,data.arId)
// 										.replace('_arId',data.arId)
										.replace('_arTime',data.arTime)
										.replace('_arContent',data.arContent)
// 										.replace('_arId',data.arId)
// 										.replace('_arId',data.arId)
										.replace('_arcmsSize',data.arcmsSize)
// 										.replace('_arId',data.arId)
										.replace('_memberId',data.memberId)
// 										.replace('_arId',data.arId)
										
						).appendTo($('#articleReply'));
						$('#ar_num').text(" " + (parseInt($('#ar_num').text()) + 1));
	 				},
	 				error:function(x,y,z){
	 					console.log('x-->'+x);
	 					console.log('y-->'+y);
	 					console.log('z-->'+z);
	 				}
				});		
			
		}); //end of 文章回覆
		
		// 文章留言 (keydown觸發事件 → 驗證  → 呼叫 save_msg())	
		$('textarea[name="acmMsg"]').keydown(function(event){ 
		    var keyCode = (event.keyCode ? event.keyCode : event.which);  
		    if($('textarea[name="acmMsg"]').val().trim()!=""  && keyCode == 13){
			    save_msg($(this));
		    }
		});
		
		// 檢舉文章
		$("#sendReport").click(function(){
			var reportTitle=$("#reportTitle").val();
			var reportDetail=$("#reportDetail").val();
			var memberId='${memberId}';
			var articleId='${article.articleId}';
			var reviewId=0;  //不用參數要設0
			var acmId=0;
			var rcmId=0;
			var reportData = {"memberId":memberId,
							"articleId":articleId,
							"reviewId":reviewId,
							"acmId":acmId,
							"rcmId":rcmId,
							"reportTitle":reportTitle,
							"reportDetail":reportDetail};
			$.ajax({
				url:"/webmail/sendmail",
				type:"POST",
				data:reportData,
				success:function(result){
					$('#reportTitle').val("");
					$('#reportDetail').val("");
					console.log(result);
					swal({
						type: 'success',
						text: '<h1 style="line-height:0px;">檢舉成功!</h1>',
						showConfirmButton: false,
						customClass: 'swal',
						timer: 1500,
					});
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
	
	//文章收藏
	function like_article(aId){
// 		console.log(aId);
		$.ajax({
			url:'/members/like/article/'+ aId,
			type:'POST',
			dataType:'json',
			success:function(result){
				if(result){  //true-->收藏成功
					swal({
						type: 'success',
						text: '<h1 style="line-height:0px;">收藏成功!</h1>',
						showConfirmButton: false,
						customClass: 'swal',
						timer: 1500,
					});
					$('#memberSave_num').text(" " + (parseInt($('#memberSave_num').text()) + 1));
				} else {  //false-->收藏失敗
					swal({
						type: 'info',
						text: '<h1 style="line-height:0px;">已經收藏過囉!</h1>',
						showConfirmButton: false,
						customClass: 'swal',
						timer: 1500,
					});
				}			
			}			
		});
	}// end of 文章收藏
	
	// 文章留言
	function save_msg(a){
// 		console.log(a);
// 		console.log(JSON.stringify($('#leaveMsg').serializeObject()));
		$.ajax({
			url:'/articleCMs/insert',
			type:'post',
			contentType:'application/json;charset=UTF-8',
			data:JSON.stringify($('#leaveMsg').serializeObject()),
			dataType:'json',
			success:function(result){
// 				console.log(result);
				$($('#article_cm').html()
								.replace(/_memberId/g,result.memberId)
								.replace('_nickname',result.nickname)
								.replace('_acmMsg',result.acmMsg)
								.replace('_acmTime',result.acmTime)
								.replace('_acmId',result.acmId)
								).appendTo($('#articleCMsArea'));
				$('#acms_num').text(" "+(parseInt($('#acms_num').text())+1));
				$('textarea[name="acmMsg"]').val("");
			}
		});
	}// end of 文章留言
	
	// 回覆留言
	function save_arcm(event,a){
	    var keyCode = (event.keyCode ? event.keyCode : event.which);  
	    if(a.val().trim()!=""  && keyCode == 13){
// 			console.log(JSON.stringify(a.parent().serializeObject()));
// 			console.log(a.parent().parent().prev());
			$.ajax({
	 			url:'/articleRCMs/insert',
	 			type:'post',
	 			contentType:'application/json;charset=UTF-8',
	 			data:JSON.stringify(a.parent().serializeObject()),
	 			dataType:'json',
	 			success:function(result){
// 					console.log(result);
					var arId = result.arId;
	 				$($('#article_cm').html()
	 								.replace(/_memberId/g,result.memberId)
	 								.replace('_nickname',result.nickname)
	 								.replace('_acmMsg',result.arcmMsg)
	 								.replace('_acmTime',result.arcmTime)
	 								).appendTo(a.parent().parent().prev());
	 				$('#arcms'+arId+'_num').text(" "+(parseInt($('#arcms'+arId+'_num').text())+1));
	 				a.val("");
	 			}
	 		});
	    }
	}// end of 回覆留言
	
	//文章留言刪除
	function delete_acm(acmId,a){
// 		console.log(a.parent().parent());
		$.ajax({
			url:'/articleCMs/update',
			data:{'acmId':acmId},
			type:'post',
			dataType:'json',
 			success:function(result){
//  				console.log(result);
 				if(result){  //true-->刪除成功
					swal({
						type: 'success',
						text: '<h1 style="line-height:0px;">刪除成功!</h1>',
						showConfirmButton: false,
						customClass: 'swal',
						timer: 1500,
					});
					$('#acms_num').text(" "+(parseInt($('#acms_num').text()) - 1));
					a.parent().parent().remove();
				}
 			}
		});
	}
	function toModal(){
		if($('#replyForm').validate().form() && CKEDITOR.instances['arContent'].getData().replace(/&nbsp;/g,'').replace(/<p>/g, "").replace(/<\/p>/g,"").trim().length != 0){
			$("#myModal .modal-title").text('請確認回覆內容');
			$("#myModal .modal-body").empty()
							.append('<h2>'+ $(':text[name=arTitle]').val() +'</h2>')		
							.append(CKEDITOR.instances['arContent'].getData());
			$('#confirm').show();
			$('#cancel').text('取消');
		}else{
			$("#myModal .modal-title").text('請修正錯誤');
			$("#myModal .modal-body").empty()
							.append('<p>請依錯誤訊息填入必填欄位</p>');
			$('#confirm').hide();
			$('#cancel').text('關閉');
			
		}
	}
	
	
	</script>
<!-- https://themeforest.net/item/flatboots-phpbb-31-and-30-/8536771 -->
<!-- http://preview.themeforest.net/item/flatboots-phpbb-31-and-30-/full_screen_preview/8536771 -->
<!-- http://preview.themeforest.net/item/eles-responsive-phpbb-31-theme/full_screen_preview/13769708 -->
<!-- http://www.rockettheme.com/phpbb/styles -->
<%-- ${article.member.articlesWorteByAuthor.size()} --%>
</body>
</html>