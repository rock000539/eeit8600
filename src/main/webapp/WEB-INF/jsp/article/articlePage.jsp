<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Article</title>
	<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css" media="all">
	<script type="text/javascript" src="/js/jquery.min.js"></script> 
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<style type="text/css">
body {
  font-family: Microsoft JhengHei,'Lora', 'Times New Roman', serif;
  font-size: 20px;
  color: #333333;
  -webkit-tap-highlight-color: #0085A1;
}
p {
  line-height: 1.5;
  margin: 30px 0;
}
p a {
  text-decoration: underline;
}
h1,h2,h3,h4,h5,h6 {
  font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-weight: 800;
}
a {
  color: #333333;
}
a:hover, a:focus {
  color: #0085A1;
}
a img:hover, a img:focus {
  cursor: zoom-in;
}

.intro-header {
  background-color: #777777;
  background: no-repeat center center;
  background-attachment: scroll;
  background-size: cover;
  margin-bottom: 50px;
}
.intro-header .post-heading{
  padding: 100px 0 50px;
  color: white;
}
@media only screen and (min-width: 768px) {
  .intro-header .post-heading{
    padding: 150px 0;
  }
}
.intro-header .site-heading .subheading,
.intro-header .page-heading .subheading {
  font-size: 24px;
  line-height: 1.1;
  display: block;
  font-family: Microsoft JhengHei,'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-weight: 300;
  margin: 10px 0 0;
}
.intro-header .post-heading h1 {
  font-size: 35px;
}
.intro-header .post-heading .subheading,
.intro-header .post-heading .meta {
  line-height: 1.1;
  display: block;
}
.intro-header .post-heading .subheading {
  font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-size: 24px;
  margin: 10px 0 30px;
  font-weight: 600;
}
.intro-header .post-heading .meta {
  font-family: 'Lora', 'Times New Roman', serif;
  font-style: italic;
  font-weight: 300;
  font-size: 20px;
}
.intro-header .post-heading .meta a {
  color: white;
}
@media only screen and (min-width: 768px) {
  .intro-header .post-heading h1 {
    font-size: 55px;
  }
  .intro-header .post-heading .subheading {
    font-size: 30px;
  }
}
</style>
</head>
<body>
<!-- Page Header -->
<header class="intro-header" style="background-image: url('/img/article/article-default.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="post-heading">
                    <h1>${article.articleTitle}</h1>
                    <h2 class="subheading">${article.articleType}</h2>
                    <span class="meta">Posted by <a href="#">Author_Member</a> on ${article.articleTime}</span>
                </div>
            </div> <!-- col -->
        </div> <!-- row -->
    </div> <!-- container -->
</header>

<!-- Post Content -->
<article>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<p>${article.article}</p>
				<button id="btnLike" value="${article.articleId}" class="btn">收藏</button>
				
			</div> <!-- col -->
		</div> <!-- row -->
	</div> <!-- container -->
</article>

<script >
$(function(){
	$('#btnLike').click(function(event){
		var articleId = $(this).val();
		console.log(articleId);
		$.ajax({
			url:"/members/like/article/insert",
			data:{"articleId": articleId},
			type:'get',
			success:function(result){
				if(result){
					alert("收藏成功");
				}
			}
		});
	});
});
</script>
</body>
</html>