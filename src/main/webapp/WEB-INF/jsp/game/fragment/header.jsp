<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<span class="glyphicon glyphicon-user"
				style="margin: 5px 0px 0px auto; font-size: 40px;"></span>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="#">HomePage</a></li>
				<li class="active"><a href="#">GameListPage</a></li>
				<li><a href="#">GameAddPage</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">OtherPage<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">BookListPage</a></li>
						<li><a href="#">MovieListPage</a></li>
						<li><a href="#">DramaListPage</a></li>
						<li><a href="#">CoffeeListPage</a></li>
						<li><a href="#">NoteBookListPage</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
						Login</a></li>
			</ul>
		</div>
	</div>
</nav>