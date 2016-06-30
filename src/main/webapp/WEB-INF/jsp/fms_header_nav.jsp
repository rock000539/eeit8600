<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header id="header">
	<h1>
		<a href="#">Queautiful</a>
	</h1>
	<nav class="links" id="main-nav">
		<ul>
			<li><a href="#" class="icon fa-calendar">日期</a></li>
			<li><a href="#" class="icon fa-flask">成分</a>
				<ul>
					<li><a href="https://www.google.com.tw">依成份查詢產品</a></li>
					<li><a href="#">依成份查詢產品</a></li>
				</ul></li>
			<li><a href="#" class="icon fa-retweet">順序</a></li>
			<li><a href="#" class="icon fa-heart-o">產品</a></li>
			<li><a href="#" class="icon fa-heart">使用心得</a></li>
			<li><a href="#" class="icon fa-pencil">討論區</a></li>
			<li><a href="#" class="icon fa-trophy">排行</a></li>

		</ul>
	</nav>
	<nav class="main">
		<ul>
			<li class="login">
				<!--未登入 --> <!-- 										<a class="fa-user" href="#login">Login</a> -->
				<!--已登入 -->
				<div>
					<a href="https://www.google.com.tw"> <img class="user"
						src="img/testuser.jpg" alt="" /> <span>username</span>
					</a>
				</div>
			</li>
			<li class="search"><a class="fa-search" href="#search">Search</a>
				<form id="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form></li>
			<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
		</ul>
	</nav>
</header>
<!--右側選單 -->
<!-- Menu -->
<section id="menu">

	<!-- Search -->
	<section>
		<form class="search" method="get" action="#">
			<input type="text" name="query" placeholder="Search" />
		</form>
	</section>

	<!-- Links -->
	<section>
		<ul class="links">
			<li><a href="#">
					<h3>日期</h3>
			</a></li>
			<li><a href="#">
					<h3>成分</h3> <span><a href="https://www.google.com.tw">依成份查詢產品</a></span>
					<span><a href="#">依成份查詢產品</a></span>
			</a></li>
			<li><a href="#">
					<h3>順序</h3>
			</a></li>
			<li><a href="#">
					<h3>產品</h3>
			</a></li>
			<li><a href="#">
					<h3>使用心得</h3>
			</a></li>
			<li><a href="#">
					<h3>討論區</h3>
			</a></li>
		</ul>
	</section>

	<!-- Actions -->
	<section>
		<ul class="actions vertical">
			<li>
				<!-- 									<a href="#" class="button big fit">Log In</a> -->
				<div>
					<a href="#"> <img class="user" src="img/testuser.jpg" alt="" />
						<span>user</span>
					</a>
				</div>
			</li>
		</ul>
	</section>

</section>