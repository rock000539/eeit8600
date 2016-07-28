<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Article List FMS</title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/article/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    
    <!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
			
</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
				<div class="rs_box  wow bounceInRight" data-wow-offset="500">
					<input type="hidden" id="articleType" value=""/>
                    <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                        <a href="/articles/listfms?articleType=NEWS">
                        <div class="serviceBox_3" id="NEWS">
                            <div class="service-icon">
                                <i class="fa fa-bullhorn"></i>
                            </div>
                            <h3>NEWS</h3>
                            <p>情報區</p>
                        </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                    	<a href="/articles/listfms?articleType=SOLICIT">
                        <div class="serviceBox_3" id="SOLICIT">
                            <div class="service-icon">
                                <i class="fa fa-file-text"></i>
                            </div>
                            <h3>SOLICIT</h3>
                            <p>徵文區</p>
                        </div>
                        </a>
                    </div>
                    <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                    	<a href="/articles/listfms?articleType=QUESTION">
                        <div class="serviceBox_3" id="QUESTION">
                            <div class="service-icon">
                                <i class="fa fa-question-circle"></i>
                            </div>
                            <h3>QUESTION</h3>
                            <p>問題區</p>
                        </div>
                        </a>
                    </div>
                    <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                    	<a href="/articles/listfms?articleType=CHAT">
                        <div class="serviceBox_3" id="CHAT">
                            <div class="service-icon">
                                <i class="fa fa-wechat"></i>
                            </div>
                            <h3>CHAT</h3>
                            <p>閒聊區</p>
                        </div>
                        </a>
                    </div>
                </div> <!-- end of rs_box -->
                
                <div class="container" style="margin-top: 250px" id="articleArea">
<!--                 <div class="page-header page-heading"> -->
<!-- 				    <h1 class="pull-left">Forums</h1> -->
<!-- 				    <ol class="breadcrumb pull-right where-am-i"> -->
<!-- 				      <li><a href="#">Forums</a></li> -->
<!-- 				      <li class="active">List of topics</li> -->
<!-- 				    </ol> -->
<!-- 				    <div class="clearfix"></div> -->
<!-- 				</div> -->
<!-- 				<p class="lead">This is the right place to discuss any ideas, critics, feature requests and all the ideas regarding our website. Please follow the forum rules and always check FAQ before posting to prevent duplicate posts.</p> -->
				  <a href="/articles/listfms">
				  	<button class="btn btn-default btn-lg" type="button" style="width:150px;margin-right:10px;" id="allpost">All Post</button>
				  </a>
				  <a href="/articles/add"><button class="btn btn-default btn-lg" type="button" style="width:150px">
				  	<i class="fa fa-plus"></i>&nbsp;New Topic</button>
				  </a>
				  
				  <table class="table forum table-striped">
				    <thead id="thead">
				      <tr>
				        <th class="cell-stat"></th>
				        <th>
				          <h3>Topics</h3>
				        </th>
				        <th class="cell-stat text-center hidden-xs hidden-sm">Replies</th>
				        <th class="cell-stat text-center hidden-xs hidden-sm">Views</th>
				        <th class="cell-stat-2x hidden-xs hidden-sm">Last Post</th>
				      </tr>
				    </thead>
				    <tbody>
				    <c:forEach var="article" items="${articles}">
				      <tr  data-type="${article.articleType}">
				      	<c:choose>
						    <c:when test="${article.articleType=='NEWS'}">
						       <td class="text-center"><i class="fa fa-bullhorn fa-2x text-primary"></i></td>
						    </c:when>
						    <c:when test="${article.articleType=='SOLICIT'}">
						       <td class="text-center"><i class="fa fa-file-text fa-2x text-success"></i></td>
						    </c:when>
						    <c:when test="${article.articleType=='QUESTION'}">
						       <td class="text-center"><i class="fa fa-question-circle fa-2x text-danger"></i></td>
						    </c:when>
						    <c:when test="${article.articleType=='CHAT'}">
						        <td class="text-center"><i class="fa fa-wechat fa-2x text-warning"></i></td>
						    </c:when>
						</c:choose>
				        
				        <td>
				          <h4><a class="articleTitle" onclick="location.href='/articles/view/${article.articleId}'">【${article.articleType}】${article.articleTitle}</a><br>
				          <small>
				          <i class="fa fa-user"></i><a href="#">&nbsp;${article.nickname}</a> &nbsp;&nbsp;
				          <i class="fa fa-clock-o"></i>&nbsp;${fn:substring(article.articleTime,0,19)} &nbsp;&nbsp;
<%-- 				          <i class="fa fa-clock-o"></i>&nbsp;${article.aEditTime} --%>
				          </small>
				          </h4>
				        </td>
				        <td class="text-center hidden-xs hidden-sm"><a href="#">${article.arSize}</a></td>
				        <td class="text-center hidden-xs hidden-sm"><a href="#">${article.articleView}</a></td>
				        <c:if test="${empty article.lastPost}">
					        <td class="hidden-xs hidden-sm">
					        	<i class="fa fa-user"></i><a href="#">&nbsp;${article.nickname}</a><br>
					        	<small><i class="fa fa-clock-o"></i>${fn:substring(article.articleTime,0,19)}</small>
					        </td>
				        </c:if>
				        <c:if test="${not empty article.lastPost}">
					        <td class="hidden-xs hidden-sm">
					        	<i class="fa fa-user"></i><a href="#">&nbsp;${article.lastPost.member.nickname}</a><br>
					        	<small><i class="fa fa-clock-o"></i>${fn:substring(article.lastPost.arTime,0,19)}</small>
					        </td>
				        </c:if>
				        
				      </tr>
<%-- 				      ${article.theLatestReply} --%>
				    </c:forEach>
				    </tbody>
				  </table>
				</div>   <!-- end of ArticleList -->
				
				<div id="page_btn" class="col-sm-12 text-center"></div>
				</div>   <!-- end of grey_bg  -->
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>
	
	<!-- Pagination Plugin -->
	<script src="/js/product/inventory/jquery.bootpag.min.js"></script>
		
	<!-- template -->
	<script id="article_list" type="text/template">
			<tr  data-type="_articleType">

				<td class="text-center"><i class="fa _type fa-2x _color"></i></td>
				
				<td>
				    <h4><a class="articleTitle" onclick="location.href='/articles/view/_articleId'">【_articleType】_articleTitle</a><br>
				    	<small>
							<i class="fa fa-user"></i><a href="#">&nbsp;_memberNickname</a>&nbsp;&nbsp;
				    		<i class="fa fa-clock-o"></i>&nbsp;_articleTime
						</small>
				    </h4>
				</td>
				<td class="text-center hidden-xs hidden-sm"><a href="#">_arSize</a></td>
				<td class="text-center hidden-xs hidden-sm"><a href="#">_articleView</a></td>
				<td class="hidden-xs hidden-sm">
				    <i class="fa fa-user"></i><a href="#">&nbsp;_lpmemberNickname</a><br>
					<small><i class="fa fa-clock-o"></i>_lparticleTime</small>
				</td>
				
			</tr>
	</script>
	
	<script>
	$(function(){
		
		var href = window.location.href;
		var typeIndex = href.lastIndexOf('=');
		var type = href.substring(typeIndex+1);
// 		console.log(href);
// 		console.log(typeIndex);
// 		console.log(type);

		/* 設定點擊serviceBox_3後樣式改變*/
		$(".serviceBox_3").removeClass('active');
		if(typeIndex!=-1){
			$('#'+type).addClass('active');
			$('#articleType').val(type); //設定type="hidden" id="articleType"的value
		}
		
		//分頁功能
		$('#page_btn').bootpag({
		    total:"${totalPage}",
 		    page:1,
		    maxVisible: 5,
// 		    href: '#pro-page-{{number}}',
 			leaps: false,
		}).on('page', function(event, num){
// 		   console.log(event);
// 		   console.log(num);
// 		   console.log($('#articleType').val());
		   $.ajax({
			   url:'/articles/list_data',
			   type:'POST',
			   contextType: 'application/json; charset=utf-8;',
			   data:{'page':num,'rows':10, 'articleType':$('#articleType').val()},
			   dataType: 'json',
			   success:function(result){
				   appendArticle(result);
				   location.href="#articleArea";
			   }
		   });
		});		
	});
	
	function appendArticle(result){
		console.log(result);
		$('tbody').empty();
		   
		   for(var i = 0; i < result.length; i++) {
			   
			   var str = $('#article_list').html();
//				   console.log(str);
			   
			   //設定文章icon
			   var str1 = '';
			   if(result[i].articleType == 'news') {
				   	str1 = str.replace('_type','fa-bullhorn').replace('_color', 'text-primary');
			   } else if(result[i].articleType == 'solicit') {
				   	str1 = str.replace('_type','fa-file-text').replace('_color', 'text-success');
			   } else if(result[i].articleType == 'question') {
					str1 = str.replace('_type','fa-question-circle').replace('_color', 'text-danger');
			   } else if(result[i].articleType == 'chat') {
				   	str1 = str.replace('_type','fa-wechat').replace('_color', 'text-warning');
			   }
			    
			   //設定LastPost
			   var str2 = '';
			   if(result[i].lastPost == null){
				   str2 = str1.replace("_lpmemberNickname", result[i].nickname)
		   						.replace("_lparticleTime", result[i].articleTime);
			   } else {
				   str2 = str1.replace("_lpmemberNickname", result[i].lastPost.nickname)
								.replace("_lparticleTime", result[i].lastPost.arTime);
			   }		   
			   $(str2.replace("_articleType", result[i].articleType.toUpperCase())
				    .replace("_articleId", result[i].articleId)
		   			.replace("_articleType", result[i].articleType.toUpperCase())
		   			.replace("_articleTitle", result[i].articleTitle)
		   			.replace("_memberNickname", result[i].nickname)
		   			.replace("_articleTime", result[i].articleTime)
		   			.replace("_arSize", result[i].arSize)	
		   			.replace("_articleView", result[i].articleView)
					).appendTo($('tbody'));
		   }
	}
	
	</script>
</body>
</html>