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
                    <div class="col-sm-3 col-md-3 col-lg-3">
                        <div class="serviceBox_3">
                            <div class="service-icon">
                                <i class="fa fa-bullhorn"></i>
                            </div>
                            <h3>NEWS</h3>
                            <p>情報區</p>
<!--                             <a class="read" href="#">Read more</a> -->
                        </div>
                    </div>

                    <div class="col-sm-3 col-md-3 col-lg-3">
                        <div class="serviceBox_3">
                            <div class="service-icon">
                                <i class="fa fa-file-text"></i>
                            </div>
                            <h3>SOLICIT</h3>
                            <p>徵文區</p>
<!--                             <a class="read" href="#">Read more</a> -->
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3">
                        <div class="serviceBox_3">
                            <div class="service-icon">
                                <i class="fa fa-question-circle"></i>
                            </div>
                            <h3>QUESTION</h3>
                            <p>問題區</p>
<!--                             <a class="read" href="#">Read more</a> -->
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3">
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
				  <button class="btn btn-default btn-lg" type="button" style="width:150px" id="allpost">All Post</button>
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
				          <h4><a href="https://www.google.com.tw/" class="articleTitle">［${article.articleType}］${article.articleTitle}</a><br>
				          <small>by <a href="#">${article.member.nickname}</a> 
				          <i class="fa fa-angle-double-right"></i> 
				          ${fn:substring(article.articleTime,0,19)}</small>
				          </h4>
				        </td>
				        <td class="text-center hidden-xs hidden-sm"><a href="#">${article.acms.size()}</a></td>
				        <td class="text-center hidden-xs hidden-sm"><a href="#">${article.articleView}</a></td>
				        <td class="hidden-xs hidden-sm">
				        	by <a href="#">${article.member.nickname}</a><br>
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

	<!-- Pagination Plugin -->
	<script src="/js/product/jquery.bootpag.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>
	


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
		
		$("#page_btn").bootpag({
		    total:8,
 		    page:1,
		    maxVisible: 5,	    
		}).on("page", function(event, num){
		   console.log(event);
		   console.log(num);		    	 
		});
		
// 		$('.articleTitle').click(function(){
// 			console.log($(this).text());		
// 		});
	});
	</script>
</body>
</html>