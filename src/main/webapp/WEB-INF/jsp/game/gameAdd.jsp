<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>GameAddPage</title>
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

.form-horizontal {
	margin: 50px auto;
	text-align: center;
}

.form-horizontal label {
	height: 25px;
	width: 60px;
	margin-top: 2px;
	padding-top: 6.5px;
	padding-right: 1px;
}

.table {
	margin-top: 25px;
	text-align: center;
	font-size: 10px;
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
</style>
</head>
<body>

	<jsp:include page="fragment/header.jsp" />

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-8 text-left">
				<div class="col-sm-2"></div>
				<form id="form_add" class="form-horizontal col-sm-8"
					action="/games/insert" method="post">
					<div id="fg_name" class="form-group">
						<label class="label label-default col-sm-2">名稱：</label>
						<div class="col-sm-10">
							<div class="input-group">
								<input class="form-control input-sm" type="text" id="name"
									name="name" data-type="string" value="${param.name}" placeholder="請輸入名稱">
								<div class="input-group-addon">
									<span id="span_name" class="glyphicon glyphicon-question-sign"></span>
								</div>
							</div>
						</div>
					</div>

					<div id="fg_evalu" class="form-group">
						<label class="label label-default col-sm-2">評價：</label>
						<div class="col-sm-10">
							<div class="input-group">
								<input class="form-control input-sm" type="text" id="evalu"
									name="evalu" data-type="integer" value="${param.evalu}" placeholder="請輸入評價">
								<div class="input-group-addon">
									<span id="span_evalu" class="glyphicon glyphicon-question-sign"></span>
								</div>
							</div>
						</div>
					</div>

					<div id="fg_dl" class="form-group">
						<label class="label label-default col-sm-2">下載量：</label>
						<div class="col-sm-10">
							<div class="input-group">
								<input class="form-control input-sm" type="text" id="dl"
									name="dl" data-type="integer" value="${param.dl}" placeholder="請輸入下載量">
								<div class="input-group-addon">
									<span id="span_dl" class="glyphicon glyphicon-question-sign"></span>
								</div>
							</div>
						</div>
					</div>

					<div id="fg_url" class="form-group">
						<label class="label label-default col-sm-2">連結：</label>
						<div class="col-sm-10">
							<div class="input-group">
								<input class="form-control input-sm" type="text" id="url"
									name="url" data-type="string" value="${param.url}" placeholder="請輸入連結">
								<div class="input-group-addon">
									<span id="span_url" class="glyphicon glyphicon-question-sign"></span>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<button type="button" class="btn btn-primary" id="save"
							name="save" data-toggle="tooltip" data-placement="left"
							title="Save to DB">
							<span class="glyphicon glyphicon-saved" aria-hidden="true"></span>
							Save
						</button>
						&nbsp;
						<button type="button" class="btn btn-primary" name="cancel"
							data-toggle="tooltip" data-placement="right"
							title="Back to gameList" onClick="location='/games/list'">
							<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
							Cancel
						</button>
					</div>
				</form>
				<div class="col-sm-2"></div>
			</div>
			<div class="col-sm-4 sidenav">
				<div class="well" style="display:none">
					<span id="span_result" class="label label-success"></span>
					<table class="table table-curved table-hover">
						<thead>
							<tr>
								<th>編號</th>
								<th>名稱</th>
								<th>評價</th>
								<th>下載量</th>
								<th>連結</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="fragment/footer.jsp" />

	<script>
		window.onload = function() {
			
			// button tooltip
			$(function() {
				$('[data-toggle="tooltip"]').tooltip()
			})
			
			var txt_name = document.getElementById("name");
			var txt_evalu = document.getElementById("evalu");
			var txt_dl = document.getElementById("dl");
			var txt_url = document.getElementById("url");
			var btn_save = document.getElementById("save");

			txt_name.addEventListener("blur", function() { changeClass(this); })
			txt_evalu.addEventListener("blur", function() { changeClass(this); });
			txt_dl.addEventListener("blur", function() { changeClass(this); });
			txt_url.addEventListener("blur", function() { changeClass(this); });
			
			function changeClass(obj){
				if (obj.value == "") {
					document.getElementById("span_"+obj.name).className = "glyphicon glyphicon-question-sign";
					document.getElementById("fg_"+obj.name).className = "form-group";
				} else if (obj.value != "") {
					if(obj.dataset.type == "string" && obj.value.trim() != "") {
						document.getElementById("span_"+obj.name).className = "glyphicon glyphicon-ok";
						document.getElementById("fg_"+obj.name).classList.add("has-success");
					} else if(obj.dataset.type == "integer" && obj.value.trim() != "" && /^[0-9]*$/.test(obj.value)) {
						document.getElementById("span_"+obj.name).className = "glyphicon glyphicon-ok";
						document.getElementById("fg_"+obj.name).classList.add("has-success");
					} else {
						document.getElementById("span_"+obj.name).className = "glyphicon glyphicon-remove";
						document.getElementById("fg_"+obj.name).classList.add("has-error");
					}
				}
			}

			btn_save.addEventListener("click",
					function() {
						var sp_list = document.querySelectorAll(".input-group-addon>span");
						var fg_list = document.querySelectorAll(".form-group");
						
						if (sp_list[0].className == "glyphicon glyphicon-ok" && sp_list[1].className == "glyphicon glyphicon-ok"
							&& sp_list[2].className == "glyphicon glyphicon-ok" && sp_list[3].className == "glyphicon glyphicon-ok") 
						{
							var data = '{ "name":"' + $('#name').val() + 
								'", "evaluation":"' + $('#evalu').val() +
								'", "download":"' + $('#dl').val() + 
								'", "url":"' + $('#url').val() + '"}';
								
							$.ajax({
								url : "/games/insert",
								type : "POST",
								contentType : "application/json; charset=UTF-8",
								dataType : "json",
								data : data,
								success:function(response){
									//alert("Success");
									if (response.redirect) {
								    	window.location.href = response.redirect;
									}
								    else {
								    	document.querySelector(".well").style.display = "block";
								    	document.getElementById("span_result").innerHTML = response.result;
								    	var td_list = document.querySelectorAll("tbody>tr>td");
								    	td_list[0].innerHTML = response.id;
								    	td_list[1].innerHTML = response.name;
								    	td_list[2].innerHTML = response.evalu;
								    	td_list[3].innerHTML = response.dl;
								    	td_list[4].innerHTML = response.url;
								    	
								    	var txt_list = document.querySelectorAll(".input-group>.form-control");
								    	for(var i=0; i<txt_list.length; i++){
								    		txt_list[i].value = "";
								    		sp_list[i].className = "glyphicon glyphicon-question-sign";
								    		fg_list[i].className = "form-group";
								    	}
								    }
								}, 
								error: function(xhr, textStatus, errorThrown) { 
								    alert('Error!  Status = ' + xhr.status); 
								} 
							})
						} else {
							for(var i = 0; i<sp_list.length; i++){
								if(sp_list[i]){
										
								}
								sp_list[i].className = "glyphicon glyphicon-remove";
								fg_list[i].classList.add("has-error");
							}
						}
					})
		}
	</script>
</body>
</html>