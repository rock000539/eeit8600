<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>expDateSearch</title>
<meta name="author" content="Parker">
<meta name="viewport" content="width=device-width; initial-scale=1.0">

<style>
table {
	margin: 10px;
	
}

td {
	border: 2px solid black;
}

#proList {
	padding-left: 100px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.js"></script>
<script>
	$(function() {
		var mfdDate;
		var expDate;

		$('#search').click(function() {
			var brandId = $('#brandId').val();
			var batchCode = $('#batchCode').val();
			$.ajax({
				url : '/expdate/batchCodeController',
				type : 'GET',
				data : {
					"brandIdstr" : brandId,
					"batchCode" : batchCode
				},
				success : function(data) {

					$('#mfd').empty().prepend(data.mfdDate);
					$('#exp').empty().prepend(data.expDate);
					$('#proList').empty();
					for(var i=0;i<data.productList.length;i++){
						var prodName=data.productList[i].prodName;
						var prodImg=data.productList[i].prodImg
						$('#proList').append(
	'<tr><td>'+prodImg+'</td><td>'+prodName+'</td></tr>'+
	'<td><input type="submit" id="checkProduct" value=觀看產品資料/>'+
	'</td><td><input type="button" class="saveDate" name='+data.productList[i].prodId+' value="加入最愛"/></td>')     
	   }

 //-------------------------------------------------登入問題尚未解決
	 	$('.saveDate').click(function (e){
		var prodId=e.target.name;

		$.ajax({
			url : '/expdate/post',
			type : 'post',
			data : {
				"proIdStr":prodId,
				"mfdStr":data.mfdDate,
				"expStr":data.expDate
			},
			success : function(date){alert(date);
			$('#proList').empty();}
		});		
        })
 //------------------------------------------------      
				}} //--end of success function
				);//--end ajax

		});//--end $('#search').click(function() 

	})//---end onload


</script>
</head>

<body>
	<div>
		<header>
			<h1>輸入產品品號查詢</h1>
		</header>
		<nav>
			<p>
				<a href="/">Home</a>
			</p>
			<p>
				<a href="/contact">Contact</a>
			</p>
		</nav>

		<div>
			<table>
				<form action="/expdate/batchCodeController" id='ExpDateForm'>
					<tr>
						<td ><select id="brandId">
								<c:forEach items='${Brands}' var="items">
									<option value='${items.brandId}'>${items.brandName}</option>
								</c:forEach>
						</select></td>
						<td><input type="text" name="batchCode" id="batchCode" /></td>
					</tr>
					<br>
					<tr>
						<td><input type="button" id="search" value="查詢" /></td>
					</tr>
				</form>

				<tr>
					<td><h6>製造日</h6></td>
					<td>
						<p id="mfd"></p>
					</td>
					<td><h6>到期日</h6></td>
					<td>
						<p id="exp"></p>
					</td>
				</tr>
			</table>

			<div >
				<table id="proList">
				
				</table>
			</div>
		</div>

		<footer> </footer>
	</div>
</body>
</html>
