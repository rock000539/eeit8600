<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ingredient editPage</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.js"></script>
<script src="/src/js/jquery.validate.min.js"></script>
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
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/metisMenu.min.css" rel="stylesheet">
<link href="/css/sb-admin-2.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bms-customize.css" rel="stylesheet" >
<style>
.error {
	color: red;
}
</style>
</head>
<body>
<div id="wrapper">

<c:import url="../bms_header.jsp" />
<c:import url="../bms_navbar-side.jsp" />


<!-- Page Content --> 
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Ingredient Edit</h1> 
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
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

	
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
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/metisMenu.min.js"></script>
<script src="/js/sb-admin-2.js"></script>

</body>
</html>