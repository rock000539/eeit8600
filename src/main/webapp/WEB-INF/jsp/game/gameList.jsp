<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>GameListPage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

.table {
	margin-top: 25px;
	text-align: center;
	font-size: 12px;
}

.table th {
	text-align: center;
}

.table-curved {
	border-collapse: separate;
}

.table-curved {
	border: solid #ccc 3px;
	border-radius: 10px;
	border-left: 3px;
}

.table-curved td, .table-curved th {
	border-left: 3px solid #ccc;
	border-top: 3px solid #ccc;
}

.table-curved tr:first-child th:first-child {
	border-radius: 10px 0 0 0;
}

.table-curved tr:first-child th:last-child {
	border-radius: 0 10px 0 0;
}

.table-curved tr:last-child td:first-child {
	border-radius: 0 0 0 10px;
}

.table-curved tr:last-child td:last-child {
	border-radius: 0 0 10px 0;
}

.form-horizontal label {
	display: inline-block;
	vertical-align: middle;
	float: none;
}

.carousel-inner>.item>img {
	margin: 0 auto;
}

.carousel-indicators li {
	margin-bottom: -20px;
	width: 5px;
	height: 5px;
}

.carousel-indicators .active {
	margin-bottom: -20px;
	width: 5px;
	height: 5px;
	background-color: #ffffff;
}

</style>
</head>
<body>
	
	<jsp:include page="fragment/header.jsp"/>
	<!--<c:import url="fragment/header.jsp"/>-->

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="label label-info col-sm-5">欄位選擇</label>
						<div class="col-lg-2">
							<select class="form-control input-sm">
								<option selected>請選擇</option>
								<option value="1">編號</option>
								<option value="2">名稱</option>
								<option value="3">評價</option>
								<option value="4">下載量</option>
								<option value="5">連結</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="label label-info col-sm-5">條件設定</label>
						<div class="col-lg-2">
							<select class="form-control input-sm">
								<option selected>請選擇</option>
								<option value="1">等於</option>
								<option value="2">不等於</option>
								<option value="3">大於</option>
								<option value="4">大於等於</option>
								<option value="5">小於</option>
								<option value="5">小於等於</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="label label-info col-sm-8">輸入關鍵字/數值</label>
						<div class="col-lg-2">
							<input class="form-control input-sm" id="txt1" type="text">
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							進階搜尋
						</button>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
							全部資料
						</button>
					</div>
				</form>
			</div>
			<div class="col-sm-8 text-left">
				<table class="table table-curved table-hover">
					<thead>
						<tr>
							<th colspan="2"><input type="button" name="add" value="Add"
								onClick="location='/games/add'" /></th>
							<th>編號</th>
							<th>名稱</th>
							<th>評價</th>
							<th>下載量</th>
							<th>連結</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${games}" var="game" varStatus="vs">
							<tr>
								<td><input type="button" name="edit" value="Edit" 
									onClick="location='/games/edit?id=${game.id}'" /></td>
								<td><input type="button" name="delete" value="Delete"
									onClick="location='/games/delete?id=${game.id}'" /></td>
								<td>${game.id}</td>
								<td>${game.name}</td>
								<td>${game.evaluation}</td>
								<td>${game.download}</td>
								<td>${game.url}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-sm-2 sidenav">
				<div class="well">
					<p></p>
				</div>
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="<c:url value="/src/images/coc.jpg"/>"
								alt="部落衝突">
							<div class="carousel-caption"></div>
						</div>

						<div class="item">
							<img src="${pageContext.request.contextPath}/src/images/roc.jpg"
								alt="皇室戰爭">
							<div class="carousel-caption"></div>
						</div>

						<div class="item">
							<img src="${pageContext.request.contextPath}/src/images/tos.jpg"
								alt="神魔之塔">
							<div class="carousel-caption"></div>
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="fragment/footer.jsp"/>

</body>
</html>