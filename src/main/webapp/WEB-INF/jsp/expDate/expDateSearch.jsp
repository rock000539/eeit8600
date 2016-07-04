<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<!-- CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/fms-main.css" />
	<link rel="stylesheet" href="/css/fms-customize.css" />		
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery.dropotron.min.js"></script>
	<script src="/js/skel.min.js"></script>
	<script src="/js/util.js"></script>
	<script src="/js/fms-main.js"></script>   
<style>

/*//////////////////////////////////////////////////////////////////////////// */
#proList {
	padding-left: 100px;
}

</style>
<script>
	$(function() {
		var mfdDate;
		var expDate;
			
		
		$("#searchDate").click(function() {
		
		var brandId = $('#brandId').val();
		var batchCode = $('#batchCode').val();
		$.ajax({
				url : '/expdate/batchCodeController',
				type : 'GET',
				data : {"brandIdstr" : brandId,
						"batchCode" : batchCode},
				success : function(data) {
				
				$('#mfd').empty().prepend(data.mfdDate);
				$('#exp').empty().prepend(data.expDate);
				$('#proList').empty();
				for (var i = 0; i < data.productList.length; i++) {
				var prodName = data.productList[i].prodName;
				var prodImg = data.productList[i].prodImg
				if (prodName != undefined) {
					$('#proList').append(
'<tr><td rowspan="2">' + prodImg+ '</td><td  colspan="2">'+ prodName+ '</td></tr>'
+ '<td><input type="submit" id="checkProduct" class="btn btn-default" value=觀看產品資料/>'
+ '</td><td><input type="button" class="saveDate btn btn-default" name='
+data.productList[i].prodId+' value="加入最愛"/></td>')
												}
											}
				
				$('.saveDate').click(function(e) {
				var prodId = e.target.name;

				$.ajax({url : '/expdate/post',
						type : 'POST',
						data : {"proIdStr" : prodId,
								"mfdStr" : data.mfdDate,
								"expStr" : data.expDate},
				success : function(date) {
				alert(date);
				$('#proList').empty();
				}
				});
				})
//------------------------------------------------      
				}
				} //--end of success function
				);//--end ajax

				});//--end $('#search').click(function() 

	})//---end onload
</script>
<style>
#mainSpace{
 width: 400px;
 margin-top:100px;
  margin-left: auto;
  margin-right: auto;
}
#proList{
  margin-top: 25px;
  margin-left: auto;
  margin-right: auto;
}
</style>
</head>
<body>

<!-- Wrapper -->
<div id="wrapper">
<!--加入header&nav -->
<c:import url="../fms_header_nav.jsp" />
				
<!-- Main -->
<div id="main">
			
<!-- ////////////////////////////////////////////////////////////////////-->
	<div id="mainSpace">

			<table class="table table-hover">
			<tr><td colspan="4"><h1>輸入產品品號查詢</h1></td></tr>
				<form action="/expdate/batchCodeController" id='ExpDateForm'>
					<tr>
					<td><select id="brandId">
							<c:forEach items='${Brands}' var="items">
							<option value='${items.brandId}'>${items.brandName}</option>
							</c:forEach>
							</select></td>
					<td><input type="text" name="batchCode" id="batchCode" /></td>
					<td colspan="2"><input type="button" id="searchDate" value="查詢" /></td>
					
					</tr>
				</form>

				<tr>
					<td colspan="2"><h5>製造日</h5></td>
					<td colspan="2"><p id="mfd"></p></td>
				</tr><tr>
					<td colspan="2"><h5>到期日</h5></td>
					<td colspan="2"><p id="exp"></p></td>
				</tr>
			</table>

			<div >
				<table id="proList" class="table table-hover" ></table>
			</div>

	</div>
	<!-- ////////////////////////////////////////////////////////////////////-->
	            <!-- **每頁不同的內容結束** -->

<!--加入intro&footer -->
<c:import url="../fms_intro_footer.jsp" />
	</div>
	</div>
			

			
</body>
</html>
