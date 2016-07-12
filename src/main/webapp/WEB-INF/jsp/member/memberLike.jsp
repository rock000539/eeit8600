<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Qutie MemberZone</title>
	<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css" media="all">
	<script type="text/javascript" src="/js/jquery.min.js"></script> 
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	<script src="https://use.typekit.net/riz5mva.js"></script>
	<script>try{Typekit.load({ async: true });}catch(e){}</script>
<style>
	body{
		font-family: source-han-sans-traditional, Microsoft JhengHei, sans-serif;
		padding-top: 70px;
	}
	.portfolio-item{
		margin-bottom: 10px;
		padding: 0;
		overflow: hidden;
		padding: 5px;
	}
	
	.view1 {
	   width: 100%;
	   height: 100%;
	   background-color: #F8F8F8;
	   border: 1px solid #E5E5E5;
	   overflow: hidden;
	   position: relative;
	}
	.title1{
		height: 80px;
		border-bottom: 1px solid #EEEEEE;
		text-align: center;
 		vertical-align: middle; 
	}
	.content1{
		height: 180px;
	    padding: 20px;
	    padding-top: 10px;
	    padding-bottom: 20px;
	}
	.content1 h5{
		text-align: center;
	}
	.content1 p{
		padding-top:0px;
		overflow: hidden; 
 		display: -webkit-box;
	    -webkit-line-clamp: 5;
	    -webkit-box-orient: vertical;
	    text-align: justify;
	}

	.mask{
	   width: 100%;
	   height: 100%;
	   position: absolute;
	   overflow: hidden;
	   top: 0;
	   left: 0;
	   padding: 30px;
	   text-align: center;
	}
	.mask h2 {
	   color: #ffffff;
	   text-align: center;
	   position: relative;
	   font-size: 20px;
	   font-weight:bold;
	   margin-top: 20%;
	   line-height: 1.6;
	}
	.mask .btndiv{
		margin-top: 30px;
	}

/* animate */
.view1 div {
   transition: all 0.3s linear;
}
.view1 .mask {
   opacity: 0;
   background-color: rgba(0, 0, 0, 0.7);
   transition: all 0.4s ease-in-out;
}
.mask h2 {
   transform: translateY(-100px); 
   opacity: 0;
   transition: all 0.4s ease-in-out;
}
.mask a.info {
   opacity: 0;
   transition: all 0.4s ease-in-out;
}
.view1:hover div.title1, 
.view1:hover div.content1 {
/*    transform: scale(3, 3);  */
   opacity: 0;
}


.view1:hover .mask {
   opacity: 1;
   border: 1px solid #fff;
}
.view1:hover h2,
.view1:hover a.info {
   margin-bottom: 5px;
   opacity: 1;
   transform: translateY(0px);
}
.view1:hover a.info {
   transition-delay: 0.2s;
}


.view1 a.info {
   display: inline-block;
   text-decoration: none;
   padding: 5px 10px;
   border: 1px solid #ffffff;
   color: #fff;
}
.view1 a.info:hover {
   transition-delay: 0s;
   display: inline-block;
   text-decoration: none;
   padding: 5px 14px;
   border: 1px solid #fff;
   background-color: #fff;
   color: #000;
   cursor: pointer;
}

.hvr-trim {
/*   display: inline-block; */
  vertical-align: middle;
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  -moz-osx-font-smoothing: grayscale;
  position: absolute;
}
.hvr-trim:before {
  content: '';
  position: absolute;
  border: 1px solid rgba(255, 255, 255, 0.8);;
  top: 30px;
  left: 25px;
  right: 25px;
  bottom: 30px;
  opacity: 0.5;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: opacity;
  transition-property: opacity;
}
.hvr-trim:hover:before, .hvr-trim:focus:before, .hvr-trim:active:before {
  opacity: 1;
}
</style>
</head>
<body>

<!-- Page Content -->
<div class="container-fluid">
<div class="col-lg-2"></div>
<div class="col-lg-10">
    <!-- Page Header -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">文章收藏 <small>討論區</small></h1>
        </div>
    </div>
    <!-- /.row -->
    <!-- Article Row -->
    <div class="row">
    	<c:forEach var="item" items="${articles}">
        <div class="col-md-4 portfolio-item">
            <div class="view1">
	            <div class="title1">
	            	<h3>${item.articleTitle}</h3>
	            	<small>${item.articleType}</small>
	            </div>
	            <div class="content1">
		            <h5>${item.articleTime}</h5>
		            <p>${item.article}</p>
	            </div>
	            
	            <div class="mask hvr-trim">
	            	<h2>${item.articleTitle}</h2>
	            	<div class="btndiv">
		           	<a href="/articles/article-page?articleId=${item.articleId}" class="info">觀看文章</a><br>
	            	<a class="btnDislike info">取消收藏</a>
	            	<input type="hidden" value="${item.articleId}" >
	            	</div>
            	</div>
            </div>
        </div>
        </c:forEach>
    </div>
    <!-- /.row -->
    
    <!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Pagination /.row -->
</div>	<!-- /.col-md --> 
</div> <!-- /.container -->
<script>
$(function(){
	$('.btnDislike').click(function(event){
		var articleId = $(this).next().val();
		$.ajax({
			url:"/members/like/delete",
			data:{"articleId": articleId},
			type:'get',
			success:function(result){
				console.log(result);
				location.reload();
			}
		});
	});
});
</script>

</body>
</html>