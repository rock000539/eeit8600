<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Date Query</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />	
	<!-- CSS --
	<!-- Scripts -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="/css/fms/style.css">
  <link rel="stylesheet" href="/css/fms/fms-customize.css">
<script type="text/javascript" src="/js/fms/swipe.js"></script>
<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/fms/jflickrfeed.js"></script>
<script type="text/javascript" src="/js/fms/fms-main.js"></script>



<script>
	$(function() {
		var mfdDate;
		var expDate;
		$("#dateResult").hide();	
		$("#checkBox").hide();
		$("#searchDate").click(function() {
			$('#proList').hide();
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
// 				var brandName=$(":selected").text();	
				var prodNameCheck = data.productList[0].prodName;
				
				if (prodNameCheck != undefined) {
				$("#dateResult").show();	
				$('#proList').show();
				$("#checkBox").show();
				$(".dividerHeading").append("<h4><span>"+brandName+"</span></h4><h3> Product Choice </h3><br>");
				for (var i = 0; i < data.productList.length; i++) {
				var prodName = data.productList[i].prodName;
				var prodId = data.productList[i].prodId;
				var prodImg=data.productList[i].prodImg;
				var categoryId=data.productList[i].categoryId;
				$("#proList").append(	//---------------------------------
				"<div class='col-md-4 portfolio-item' name="+categoryId+"><div class='portfolio-all'>"
				+"<div class='portfolio-title'>"
				+"<a href='/products/view?prodId="+prodId+"'><h3>"+prodName+"</h3></a></div>"
				+"<div class='portfolio-content'>"
				+"<div class='portfolio-img'>"
				+"<a href='/products/view?prodId="+prodId+"'><img src='/products/show?prodImg="+prodImg+"'/></a>"
				+"</div>"
				+"<div class='portfolio-btn'>"
 				+"<button class='saveDate btn btn-default' name='"
 				+data.productList[i].prodId+"'>加入最愛</button> &nbsp;"
				+"</div></div></div></div>"		
					)//-----------------------------------------------------
					}//end of for Loop
												}else{}//end of if
				$('.saveDate').click(function(e) {
				var prodId = e.target.name;
				var memberId=$("#loginTokenId").attr("value");
				var batchCode = $('#batchCode').val();
				if(memberId!=0&&memberId!=undefined){ //#1
				$.ajax({url : '/expdate/post', //#2
						type : 'POST',
						data : {"proIdStr" : prodId,
								"mfdStr" : data.mfdDate,
								"expStr" : data.expDate,"batchCode":batchCode},
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

						
			$(".checkbox").click(
					function(e){
						var checkState=e.target.checked;
						var checkBox=e.target.value;
					if(checkState==false){
					$('.portfolio-item[name='+checkBox+']').hide();
					}else{
						$('.portfolio-item[name='+checkBox+']').show();
					}
					}
					);
			
			var BatchCodeinformations=$("#information p");
			$("#information p:gt(0)").hide();
			var count=0;
			setInterval(function(){
				
				var tearget=$("#information p:eq("+count+")");
				console.log(tearget);
				$("#information p:eq("+count+")").hide("Fade" ,"swing","slow",callback());
				count++;
				if(count==4){
					count=0;
					}
			},7000);
		    function callback() {
		        if(count<3){
		        $("#information p:eq("+(count+1)+")").show("Fade" ,"swing","slow");
		        }else{
		        $("#information p:eq("+0+")").show("Fade" ,"swing","slow");
		        }
		    };
			
	})//---end onload
</script>
<style>
#mainSpace{
 width: 450px;
 margin-top:50px;
  margin-left: auto;
  margin-right: auto;
}

#proList{
 margin-top: 25px;
 font-size: 24px;
}

#dateResult{
width:300px;
margin: auto auto;
}
.dividerHeading h3{
margin-left:180px; }
.portfolio-content {
	border: 1px solid #E7E6E6;
	padding: 5px 10px 30px 10px;
	text-align: center;
}
.portfolio-content h3 {
	font-size: 15px;
 	line-height: 15px; 
}
.portfolio-img {
	margin: 0 auto;
	height: 130px;
	width: 130px;
	overflow:hidden;
}
.portfolio-content img{
	height: 130px;
	width: 130px;
}
.portfolio-content p {
	line-height: 1.1;
	margin: 5px;
	font-size: 15px;
}
.portfolio-btn {
	margin-top: 20px;
}
body {
	font-family: Microsoft JhengHei, "Open Sans",Helvetica,Arial,sans-serif;	
}
.portfolio-item {
 	padding: 15px; 
}
.portfolio-item:hover .portfolio-content{
	border-bottom-color:#727CB6; 
}

.portfolio-all {
	background-color: #ffffff;
	margin-bottom: 10px;
}

.portfolio-title{
	height: 60px;
	background-color: #98DaD6;  /*blue */
	border-bottom: 1px solid #4FBAAA;
	color: #ffffff;
	text-align: center;
	padding: 10px;
}
#proList div:nth-child(3n+2) .portfolio-title{
	background-color: #DDD5C9;	/*beige*/
	border-bottom: 1px solid #C6BFB4;
} 
#proList div:nth-child(3n+3) .portfolio-title{
	background-color: #FF9985;	/*pink*/
	border-bottom: 1px solid #D97F88;
}
.portfolio-title h3 {
	font-size: 15px;
 	line-height: 15px; 
	color: #ffffff;
	margin: 5px;
}
#information p{
font-size: 20px;
line-height: 55px;
}
.grey_bg{
background-image: url("/images/expdateSearchBackground.jpg");
-moz-background-size:cover;
-webkit-background-size:cover;
-o-background-size:cover;
background-size:cover;
min-height: 610px;}
.div-inline{ display:inline} 
#information div{
width: 380px;
margin: auto auto;}

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
<div class="grey_bg row">
	<div class="col-md-6" id="information">
	<div><h1>Welcome to Qutie 2016!</h1></div>
	<br>
	<div><p>Qutie helps you calculate your cosmetics' production date or expiration date from the batch code found on the product package.</p></div>
	<div><p>What is batch code?  -  Batch codes are mostly short codes printed or stamped on the package with different font from the product specification, e.g. XLO25LA</p></div>
	<div><p>The brands that can be calculated are Anna Sui, Aveda, Biotherm, BODY SHOP, Burt's bees, Chanel, Christian Dior, Clarins, Clinique, Decleor, Elizabeth Arden, Estee lauder, Givenchy, Guerlain, H2O+, Helena Rubinstein, Kiehl's , Lancome, L'occitane, L'Oreal, MAC, Neutrogena , Origins, Sisley, Sofina, Vichy, and YSL.</p></div>
	<div><p>Check the color and smell if you think that your product has expired. Strange smell, separation of oil, change of color are signs of expiration.</p></div>
	</div>
	<div id="mainSpace" class="col-md-6">	
		<h1>CHECK YOUR COSMETICS</h1><br>
		<h4>Production/Expiration Date</h4><br>
					<div >
					<label for="selectBar">Select A Brand</label>	
					<select id="brandId" class="form-control" name="selectBar" style="border-radius:20px;">
							<c:set var="reloadBrandId" scope="session" value="${reloadBrandId}"/>
							<c:forEach items='${Brands}' var="items">
							<c:if test="${reloadBrandId!=items.brandId}">
							<option value='${items.brandId}'>${items.brandName}</option>
							</c:if>
							<c:if test="${reloadBrandId==items.brandId}">
							<option value='${items.brandId}' selected="selected">${items.brandName}</option>
							</c:if>
							</c:forEach>
					</select>
					</div>
					<div >
					<label for="batchCode">Batch Code</label>	
					<input type="text" class="form-control" name="batchCode" id="batchCode"   value="${reloadBatchCode}" style="border-radius:20px;"/></div>
					<div style="display: inline-block;float:right;">
					<br>
					<button id="searchDate" class="btn btn-default btn-lg btn-block" >Calculate</button></div>
					
			
		
			<table id="dateResult"  >
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
			<div id="checkBox">
			
			<c:forEach items='${categorys}' var="items">
			<div class="col-md-3"><input type="checkbox" class="checkbox div-inline" value="${items.categoryId}" checked>&nbsp;${items.categoryName}&nbsp;</div>
			</c:forEach>
			</div>

	</div>
	
	
	</div>
 			<div class="row"> 
			<div  class="col-md-1">
			</div>
			<div id="proList" class="col-md-10 col-sm-7">
			</div>
 			</div> 
	<!-- ////////////////////////////////////////////////////////////////////-->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			
</body>
</html>
