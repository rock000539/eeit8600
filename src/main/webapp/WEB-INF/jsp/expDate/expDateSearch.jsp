<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<!-- CSS -->

	<!-- Scripts -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/js/fms/swipe.js"></script>
<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/fms/fms-main.js"></script>
  <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">

<style>

/*//////////////////////////////////////////////////////////////////////////// */


</style>
<script>
	$(function() {
		var mfdDate;
		var expDate;
			
		
		$("#searchDate").click(function() {
		
		var brandId = $('#brandId').val();
		var batchCode = $('#batchCode').val();
		var brandName=$(":selected").text();
		$.ajax({
				url : '/expdate/batchCodeController',
				type : 'POST',
				data : {"brandIdstr" : brandId,
						"batchCode" : batchCode},
				success : function(data) {
				
				$('#mfd').empty().prepend(data.mfdDate);
				$('#exp').empty().prepend(data.expDate);
				$('#proList').empty();
				$(".dividerHeading").empty();
				$(".dividerHeading").append("<h4><span>"+brandName+"</span></h4><br>");
				$(".dividerHeading").append("<h5><p>請在下方選擇產品加入最愛<p></h5>");
				for (var i = 0; i < data.productList.length; i++) {
				var prodName = data.productList[i].prodName;
				var prodId = data.productList[i].prodId
	
				if (prodName != undefined) {
										
$('#proList').append(	
'<tr><td ><a href="#"><img src="/products/show?prodId=' + prodId+ '"/></a></td><td><a href="#">'+ prodName+ '</a></td>'
+ '</td><td><input type="button" class="saveDate btn" name='
+data.productList[i].prodId+' value="加入最愛"/></td></tr>'

)
												}
											}
				
				$('.saveDate').click(function(e) {
				var prodId = e.target.name;
				var memberId=$("#loginTokenId").attr("value");
				
				if(memberId!=0&&memberId!=undefined){ //#1
				$.ajax({url : '/expdate/post', //#2
						type : 'POST',
						data : {"proIdStr" : prodId,
								"mfdStr" : data.mfdDate,
								"expStr" : data.expDate},
				success : function(data) {
				alert(data);
				$('#proList').empty();
				}
				});//end #2
				}else{//end #1
					var brandId = $('#brandId').val();
					var reloadBatchCode = $('#batchCode').val();
		 location.href="/expdate/reloadsearch?brandId="+brandId+"&reloadBatchCode="+reloadBatchCode;
				}
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
 width: 600px;
 margin-top:100px;
  margin-left: auto;
  margin-right: auto;
}

#proList{
  margin-top: 25px;
  margin-left: auto;
  margin-right: auto;
  padding-left: 100px;
font-size: 24px;
}
#proList img{
width: 120px;
height: 120px;
}
#dateResult{
width:300px;
margin: auto auto;
}
.dividerHeading h5{
margin-left:180px; }

</style>
</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
<!-- ////////////////////////////////////////////////////////////////////-->
<%@page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%-- <sec:authorize access="hasRole('ROLE_USER')">  --%>
         <c:set var="nickname" scope="session" value='<%=request.getSession().getAttribute("MemberNickname")%>'/>
         <c:if test="${not empty nickname}"> 
<div style="display:none" id="loginTokenName" ><%=SecurityContextHolder.getContext().getAuthentication().getName() %></div>
<div style="display:none" id="loginTokenId" value="<%=request.getSession().getAttribute("memberId")%>"></div>
		</c:if>
<!-- 檢查會員登入與否用的token -->
<%-- </sec:authorize>  --%>
<div class="grey_bg row">
	<div id="mainSpace">

			<table class="table">
			<tr><td colspan="4"><h1>產品品號查詢</h1></td></tr>
				<form  id='ExpDateForm'>
					<tr>
					<td><select id="brandId">
							<c:set var="reloadBrandId" scope="session" value="${reloadBrandId}"/>
							<c:forEach items='${Brands}' var="items">
							<c:if test="${reloadBrandId!=items.brandId}">
							<option value='${items.brandId}'>${items.brandName}</option>
							</c:if>
							<c:if test="${reloadBrandId==items.brandId}">
							<option value='${items.brandId}' selected="selected">${items.brandName}</option>
							</c:if>
							</c:forEach>
							</select></td>
					<td><input type="text" name="batchCode" id="batchCode" value="${reloadBatchCode}"/></td>
					<td colspan="2"><input type="button" id="searchDate" class="btn" value="查詢" />
					</td>
					
					</tr>
				</form>
			</table>
			<table id="dateResult">
				<tr>
					<td colspan="2" class="dateArea"><h5>製造日</h5></td>
					<td colspan="2" class="dateResult"><p id="mfd"></p></td>
				</tr><tr>
					<td colspan="2" class="dateArea"><h5>到期日</h5></td>
					<td colspan="2" class="dateResult"><p id="exp"></p></td>
				</tr>
			</table>
			<!-- 分隔線用 -->
			<br>
			<div class="dividerHeading">
			
			</div>
			<!-- 分隔線用 -->
			<div ><br>
				<table id="proList" class="table" ></table>
			</div>

	</div>
	</div>
	<!-- ////////////////////////////////////////////////////////////////////-->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			
</body>
</html>
