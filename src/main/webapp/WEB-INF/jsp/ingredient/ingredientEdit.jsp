<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ingredient editPage</title>
	<!--  BASE CSS STYLE  -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/bms/style.min.css" rel="stylesheet">
	<link href="/css/bms/default.css" rel="stylesheet" id="theme">
	<link href="/css/bms/bms-customize.css" rel="stylesheet">
	<!--  BASE JS  -->
	<script src="/js/bms/pace.min.js"></script>
	
<style>
.error {
	color: red;
}
</style>
</head>
<body>
	<!-- page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
	
	<c:import url="/WEB-INF/jsp/bms/bms_header.jsp" />
	<c:import url="/WEB-INF/jsp/bms/bms_navbar-side.jsp" />	
	
		<!-- page content -->
		<div id="content" class="content">
			<!-- breadcrumb 目前位置 -->
			<ol class="breadcrumb pull-right">
				<li><a href="<% request.getContextPath(); %>/bms">Home</a></li>
				<li><a href="javascript:;">Page Options</a></li>
				<li class="active">Blank Page</li>
			</ol>
			
			<!-- page-header 每頁標題 副標 -->
			<h1 class="page-header">Dashboard <small>overview of background management system</small></h1>
			
			<!-- 內文 -->
			<div class="row">
			    <div class="col-md-12 ui-sortable">
	            <!-- **每頁不同的內容從這裡開始** -->
	            
	            	<form id="editForm">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="ingredId"
					value="${ingredient.ingredId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>成份</td>
				<td><input type="text" name="ingredName"
					value="${ingredient.ingredName}"></td>
			</tr>
			<tr>
				<td>中文名稱</td>
				<td><input type="text" name="ingredChName"
					value="${ingredient.ingredChName}"></td>
			</tr>
			<tr>
				<td>特性</td>
				<td><input type="text" name="ingredChar"
					value="${ingredient.ingredChar}"></td>
			</tr>
			<tr>
				<td>刺激度</td>
				<td><input type="text" name="ingredIrritant"
					value="${ingredient.ingredIrritant}"></td>
			</tr>
			<tr>
				<td>致粉刺性</td>
				<td><input type="text" name="ingredAcne"
					value="${ingredient.ingredAcne}"></td>
			</tr>
			<tr>
				<td>安心度</td>
				<td><input type="text" name="ingredSafety"
					value="${ingredient.ingredSafety}"></td>
			</tr>
		</table>
		<div>
			<br> <input id="editBtn" type="button" name="update"
				value="update"> <input type="button" name="cancel"
				value="Cancel" onclick='window.location="/ingredients/list"'><br>
		</div>
	</form>
	<div id="resultMsg"></div>
	<div id="data"></div>
	            <!-- **每頁不同的內容 end** -->     
			    </div><!-- /end .col-md-12 -->
			</div> <!-- /end .row -->
		</div>
		<!-- /end #content -->
		<!-- scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- /end page container -->
	
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bms/jquery.slimscroll.min.js"></script>
	<script src="/js/bms/bms.js"></script>
	<script src="/js/jquery.validate.min.js"></script>
<script>
	$(function() {
		$('#editForm').validate({
			rules : {
				ingredName : {
					required : true
				},
				ingredChar : {
					required : true
				},
				ingredIrritant : {
					digits : true
				},
				ingredAcne : {
					digits : true
				},
				ingredSafety : {
					digits : true
				}
			},
			messages : {
				ingredName : "必填項目",
				ingredChName : "必填項目",
				ingredChar : "必填項目",
				ingredIrritant : "必須為數字",
				ingredAcne : "必須為數字",
				ingredSafety : "必須為數字"
			}
		})

	})
</script>
<script type="text/javascript">
	$(function() {
		

		$('#editBtn').on('click',function() {
			var validate=$('#editForm').validate().form();
			if(validate){
			$.ajax({
										url : "/ingredients/update",
										type : "POST",
										contentType : 'application/json; charset=utf-8',
										dataType : "json",
										data : JSON.stringify($('form')
												.serializeObject()),
										success : function(result) {
											//$(':text:gt(0)').val(" ");//clear the form except id
											$('#resultMsg').empty().append(
													"<h2>update success</h2>");
											var tb = $('#data').append(
													'<table></table>');
											tb.empty();
											tb
													.append('<tr align="center"><td>ID</td><td>成份</td><td>中文名稱</td><td>特性</td><td>刺激度</td><td>致粉刺性</td><td>安心度</td></tr>');
											var row = $(
													'<tr align="center"></tr>')
													.appendTo(tb);
											$('<td></td>')
													.text(result.ingredId)
													.appendTo(row);
											$('<td></td>').text(
													result.ingredName)
													.appendTo(row);
											$('<td></td>').text(
													result.ingredChName)
													.appendTo(row);
											$('<td></td>').text(
													result.ingredChar)
													.appendTo(row);
											$('<td></td>').text(
													result.ingredIrritant)
													.appendTo(row);
											$('<td></td>').text(
													result.ingredAcne)
													.appendTo(row);
											$('<td></td>').text(
													result.ingredSafety)
													.appendTo(row);
											//	$('#data').children().addClass("temp1");
										}
									});
			}else{alert("資料格式不正確");}
						});

		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};

	});
	
</script>
</body>
</html>