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
		
</head>

<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
				<div class="rs_box  wow bounceInRight" data-wow-offset="500">
                    <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                        <div class="serviceBox_3">
                            <div class="service-icon">
                                <i class="fa fa-bullhorn"></i>
                            </div>
                            <h3>NEWS</h3>
                            <p>情報區</p>
<!--                             <a class="read" href="#">Read more</a> -->
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                        <div class="serviceBox_3">
                            <div class="service-icon">
                                <i class="fa fa-file-text"></i>
                            </div>
                            <h3>SOLICIT</h3>
                            <p>徵文區</p>
<!--                             <a class="read" href="#">Read more</a> -->
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                        <div class="serviceBox_3">
                            <div class="service-icon">
                                <i class="fa fa-question-circle"></i>
                            </div>
                            <h3>QUESTION</h3>
                            <p>問題區</p>
<!--                             <a class="read" href="#">Read more</a> -->
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                        <div class="serviceBox_3">
                            <div class="service-icon">
                                <i class="fa fa-rocket"></i>
                            </div>
                            <h3>CHAT</h3>
                            <p>閒聊區</p>
<!--                             <a class="read" href="#">Read more</a> -->
                        </div>
                    </div>
                </div> <!-- end of rs_box -->
                
                <div class="container" style="margin-top: 250px">
<!--                 <div class="page-header page-heading"> -->
<!-- 				    <h1 class="pull-left">Forums</h1> -->
<!-- 				    <ol class="breadcrumb pull-right where-am-i"> -->
<!-- 				      <li><a href="#">Forums</a></li> -->
<!-- 				      <li class="active">List of topics</li> -->
<!-- 				    </ol> -->
<!-- 				    <div class="clearfix"></div> -->
<!-- 				</div> -->
<!-- 				<p class="lead">This is the right place to discuss any ideas, critics, feature requests and all the ideas regarding our website. Please follow the forum rules and always check FAQ before posting to prevent duplicate posts.</p> -->
				  <button class="btn btn-default btn-lg" type="button" style="width:150px;margin-right:10px;" id="allpost">All Post</button>
				  <a href="/articles/add"><button class="btn btn-default btn-lg" type="button" style="width:150px">
				  	<i class="fa fa-plus"></i>&nbspNew Topic
				  </button></a>
				  <table class="table forum table-striped">
				    <thead>
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
<!-- 				    <tr id="test"> -->
<!-- 				        <td class="text-center"><i class="fa fa-exclamation fa-2x text-danger"></i></td> -->
<!-- 				        <td> -->
<!-- 				          <h4><a href="#">Important changes</a><br><small>Category description</small></h4> -->
<!-- 				        </td> -->
<!-- 				        <td class="text-center hidden-xs hidden-sm"><a href="#">6532</a></td> -->
<!-- 				        <td class="text-center hidden-xs hidden-sm"><a href="#">152123</a></td> -->
<!-- 				        <td class="hidden-xs hidden-sm">by <a href="#">Jane Doe</a><br><small><i class="fa fa-clock-o"></i> 1 years ago</small></td> -->
<!-- 				      </tr> -->
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
						        <td class="text-center"><i class="fa fa-rocket fa-2x text-warning"></i></td>
						    </c:when>
						</c:choose>
				        
				        <td>
				          <h4><a data-articleId="${article.articleId}" class="articleTitle" onclick="info_click($(this))">【${article.articleType}】${article.articleTitle}</a><br>
				          <small>by <a href="#">${article.nickname}</a> 
				          <i class="fa fa-angle-double-right"></i> 
				          ${fn:substring(article.articleTime,0,19)}</small>
				          </h4>
				        </td>
				        <td class="text-center hidden-xs hidden-sm"><a href="#">${article.acmsSize}</a></td>
				        <c:if test="${empty article.articleView}">
				        	<td class="text-center hidden-xs hidden-sm"><a href="#">0</a></td>
				        </c:if>
				        <c:if test="${not empty article.articleView}">
				        	<td class="text-center hidden-xs hidden-sm"><a href="#">${article.articleView}</a></td>
				        </c:if>
				        <td class="hidden-xs hidden-sm">
				        	by <a href="#">${article.nickname}</a><br>
				        	<small><i class="fa fa-clock-o"></i>${fn:substring(article.articleTime,0,19)}</small>
				        </td>
				      </tr>
				    </c:forEach>
<!-- 				      <tr> -->
<!-- 				        <td class="text-center"><i class="fa fa-exclamation fa-2x text-danger"></i></td> -->
<!-- 				        <td> -->
<!-- 				          <h4><a href="#">Important changes</a><br><small>Category description</small></h4> -->
<!-- 				        </td> -->
<!-- 				        <td class="text-center hidden-xs hidden-sm"><a href="#">6532</a></td> -->
<!-- 				        <td class="text-center hidden-xs hidden-sm"><a href="#">152123</a></td> -->
<!-- 				        <td class="hidden-xs hidden-sm">by <a href="#">Jane Doe</a><br><small><i class="fa fa-clock-o"></i> 1 years ago</small></td> -->
<!-- 				      </tr> -->
				    </tbody>
				  </table>
<!-- 				  <table class="table forum table-striped"> -->
<!-- 				    <thead> -->
<!-- 				      <tr> -->
<!-- 				        <th class="cell-stat"></th> -->
<!-- 				        <th> -->
<!-- 				          <h3>Suggestions</h3> -->
<!-- 				        </th> -->
<!-- 				        <th class="cell-stat text-center hidden-xs hidden-sm">Topics</th> -->
<!-- 				        <th class="cell-stat text-center hidden-xs hidden-sm">Posts</th> -->
<!-- 				        <th class="cell-stat-2x hidden-xs hidden-sm">Last Post</th> -->
<!-- 				      </tr> -->
<!-- 				    </thead> -->
<!-- 				    <tbody> -->
<!-- 				      <tr> -->
<!-- 				        <td class="text-center"><i class="fa fa-heart fa-2x text-primary"></i></td> -->
<!-- 				        <td> -->
<!-- 				          <h4><a href="#">More more more</a><br><small>Category description</small></h4> -->
<!-- 				        </td> -->
<!-- 				        <td class="text-center hidden-xs hidden-sm"><a href="#">6532</a></td> -->
<!-- 				        <td class="text-center hidden-xs hidden-sm"><a href="#">152123</a></td> -->
<!-- 				        <td class="hidden-xs hidden-sm">by <a href="#">Jane Doe</a><br><small><i class="fa fa-clock-o"></i> 3 months ago</small></td> -->
<!-- 				      </tr> -->
<!-- 				      <tr> -->
<!-- 				        <td class="text-center"><i class="fa fa-magic fa-2x text-primary"></i></td> -->
<!-- 				        <td> -->
<!-- 				          <h4><a href="#">Haha</a><br><small>Category description</small></h4> -->
<!-- 				        </td> -->
<!-- 				        <td class="text-center hidden-xs hidden-sm"><a href="#">6532</a></td> -->
<!-- 				        <td class="text-center hidden-xs hidden-sm"><a href="#">152123</a></td> -->
<!-- 				        <td class="hidden-xs hidden-sm">by <a href="#">Jane Doe</a><br><small><i class="fa fa-clock-o"></i> 1 years ago</small></td> -->
<!-- 				      </tr> -->
<!-- 				    </tbody> -->
<!-- 				  </table> -->
<!-- 				  <table class="table forum table-striped"> -->
<!-- 				    <thead> -->
<!-- 				      <tr> -->
<!-- 				        <th class="cell-stat"></th> -->
<!-- 				        <th> -->
<!-- 				          <h3>Open discussion</h3> -->
<!-- 				        </th> -->
<!-- 				        <th class="cell-stat text-center hidden-xs hidden-sm">Topics</th> -->
<!-- 				        <th class="cell-stat text-center hidden-xs hidden-sm">Posts</th> -->
<!-- 				        <th class="cell-stat-2x hidden-xs hidden-sm">Last Post</th> -->
<!-- 				      </tr> -->
<!-- 				    </thead> -->
<!-- 				    <tbody> -->
<!-- 				      <tr> -->
<!-- 				        <td></td> -->
<!-- 				        <td colspan="4" class="center">No topics have been added yet.</td> -->
<!-- 				      </tr> -->
<!-- 				    </tbody> -->
<!-- 				  </table> -->
				</div>   <!-- end of ArticleList -->
				
				<div id="page_btn" class="col-sm-12 text-center"></div>
				</div>   <!-- end of grey_bg  -->
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
	
	<!-- Pagination Plugin -->
	<script src="/js/product/inventory/jquery.bootpag.min.js"></script>
	
	<!-- jQuery Redirect Plugin -->
	<script src="/js/jquery.redirect.js"></script>
		
	<!-- template -->
	<script id="article_list" type="text/template">
			<tr  data-type="_articleType">

				<td class="text-center"><i class="fa _type fa-2x _color"></i></td>
				
				<td>
				    <h4><a data-articleId="_articleId" class="articleTitle" onclick="info_click($(this))">【_articleType】_articleTitle</a><br>
				    	<small>by 
							<a href="#">_memberNickname</a> 
				    		<i class="fa fa-angle-double-right"></i> 
				    		_articleTime
						</small>
				    </h4>
				</td>
				<td class="text-center hidden-xs hidden-sm"><a href="#">_acmsSize</a></td>
				<td class="text-center hidden-xs hidden-sm"><a href="#">_articleView</a></td>
				<td class="hidden-xs hidden-sm">
				     by <a href="#">_memberNickname</a><br>
					<small><i class="fa fa-clock-o"></i>_articleTime</small>
				</td>
				
			</tr>
	</script>
	
	<script>
	$(function(){
		$('#allpost').on('click',function(){
			$('tbody>tr').show();
		});
		
		$(".serviceBox_3").on('click',function(){
			var aType = $(this).find('h3').text();
			$('tbody>tr[data-type!='+aType+']').hide();
			$('tbody>tr[data-type='+aType+']').show();
		});

// 		$(".serviceBox_3").on('click',function(){
// 			console.log('hi');
// 			console.log($(this).find('h3').text());
// 			$.ajax({
// 				url:'/articles/selectbyarticletype',
// 				type:'POST',
// 				contextType:'application/json; charset=utf-8;',
// 				data:{'articleType':$(this).find('h3').text()},
// 				dataType:'json',
// 				success:function(result){
// 					console.log(result);
					
// 				}
				
// 			});
// 		});
		
		$('#page_btn').bootpag({
		    total:"${totalPage}",
 		    page:1,
		    maxVisible: 5,
		    href: '#pro-page-{{number}}',
			leaps: false,
		}).on('page', function(event, num){
// 		   console.log(event);
// 		   console.log(num);
		   $.ajax({
			   url:'/articles/list_data',
			   type:'POST',
			   contextType: 'application/json; charset=utf-8;',
			   data:{'page':num,'rows':10},
			   dataType: 'json',
			   success:function(result){
// 				   console.log(result);
				   $('tbody').empty();
				   
				   for(var i = 0; i < result.length; i++) {
					   
					   var str = $('#article_list').html();
// 					   console.log(str);
					   
					   var str1 = '';
					   if(result[i].articleType == 'news') {
						   	str1 = str.replace('_type','fa-bullhorn').replace('_color', 'text-primary');
					   } else if(result[i].articleType == 'solicit') {
						   	str1 = str.replace('_type','fa-file-text').replace('_color', 'text-success');
					   } else if(result[i].articleType == 'question') {
							str1 = str.replace('_type','fa-question-circle').replace('_color', 'text-danger');
					   } else if(result[i].articleType == 'chat') {
						   	str1 = str.replace('_type','fa-rocket').replace('_color', 'text-warning');
					   }
					   
					   var str2 = '';
					   if(result[i].articleView==null) {
						   str2 = str1.replace("_articleView", 0);
					   } else {
						   str2 = str1.replace("_articleView", result[i].articleView);
					   }
					   $(str2.replace("_articleType", result[i].articleType.toUpperCase())
						    .replace("_articleId", result[i].articleId)
				   			.replace("_articleType", result[i].articleType.toUpperCase())
				   			.replace("_articleTitle", result[i].articleTitle)
				   			.replace("_memberNickname", result[i].nickname)
				   			.replace("_articleTime", result[i].articleTime)
				   			.replace("_acmsSize", result[i].acms.length)
				   			.replace("_memberNickname", result[i].nickname)
				   			.replace("_articleTime", result[i].articleTime)
							).appendTo($('tbody'));
				   }
			   }
		   });
		});
		
		
// 		$('.articleTitle').click(function(){
// 			console.log($(this).text());		
// 		});
	});
	

	function info_click(a) {
// 		console.log($(a).attr('data-articleId'));
		$.redirect('/articles/view', { 'articleId': $(a).attr('data-articleId') });
	}
	</script>
</body>
</html>