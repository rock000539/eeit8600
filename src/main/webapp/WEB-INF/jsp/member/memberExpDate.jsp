<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${nickname}'s 產品期限清單</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    <link rel="stylesheet" href="/css/product/sweetalert2.min.css">
	<script type="text/javascript" src="/js/product/sweetalert2.min.js"></script>
	<!-- customize -->
    <link rel="stylesheet" href="/css/member/member-customize.css">
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
<style>
.expDiv{
	padding: 33px 0 40px 0;
    border-bottom: 1px solid #E0E0E0;
}
.prodImg{
	display: table-cell;
	position: relative;
	width: 200px;
	margin-top: 10px;
}
.prodImg img{
	width: 100%;
}
.dateTitle h2{
	color: #000;
	font-size: 24px;
	line-height: 28px;
	font-weight: normal;
	letter-spacing: 0.05em;
	padding-bottom: 5px;
	margin-top:0px;
	margin-bottom:0px;
}
.dateTitle h3{
	color: #000;
	font-size: 16px;
	line-height: 20px;
	font-weight: normal;
	letter-spacing: 0.02em;
	padding-bottom: 5px;
	margin-top:0px;
	margin-bottom:0px;
}
div.expinfo{
	text-align: left;
}
div.expinfo h3{
	color: #000;
	font-size: 16px;
	line-height: 20px;
	font-weight: normal;
	letter-spacing: 0.02em;
	padding-bottom: 2px;
	margin-top:0px;
	margin-bottom:0px;
}
div.expinfo h3 span{
	color: #000;
	font-size: 16px;
	line-height: 20px;
	font-weight: normal;
	letter-spacing: 0.02em;
	padding-bottom: 2px;
	margin-top:0px;
	margin-bottom:0px;
	font-family: "Irvin Display",Georgia,"Times New Roman",Times,serif;
}
.lastDays{
	display: table-cell;
	vertical-align: middle;
	width: 145px;
	height: 145px;
	padding-left: 18%;
	background: #BBE4D3; /*#BBE4D3; blue*/
	color: #555;
	overflow: hidden;
}
.expired{
	background:#DDD5C9; /*B7B5B3; gray*/
}
.within30, .within30 p, .within30 h1{
	background:#FF9985;
	color:#fff;
}
.lastDays p{
	margin:0px;
}
.lastDays span, .lastDays h1 span{
	font-size: 16px;
    line-height: 20px;
    font-weight: normal;
}
.lastDays h1{
	font-family: "Irvin Display",Georgia,"Times New Roman",Times,serif;
	margin: 0px;
	font-size: 48px;
    line-height: 48px;
}
.btn-delete{
	margin-top: 50px;
}
.btn{
	border-radius: 0px;
}
#count-review span{
	border-bottom: 2px solid #5d5d5d;
	background-color: transparent;
    border: 2px solid #ECECEC;
    border-radius: 2px;
    color: #888;
    cursor: pointer;
    font: 400 12px/29px "Open Sans",sans-serif;
    margin: 10px 10px 0 0;
    padding: 0 17px;
    position: relative;
    display: inline-block;
}
#count-review span.selected{
	background-color: #5d5d5d;
    color: #fff;
    border-color: #5d5d5d;
}
.is-hidden{
	display: none;
}
</style>
</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
<div class="row detail-div"> 
	<div class="col-lg-10 col-sm-6 delay-05s memberDiv">
		<c:import url="/WEB-INF/jsp/member/memberPages-header.jsp" />
		<div class="subject">
			<p id="count-review">產品到期日清單</p>
			<p id="count-review">
				<span class="tab selected" value="all">全部產品 (${fn:length(beans)})</span>
				<span class="tab" value="efficient">有效 (${efficientNum})</span>
				<span class="tab" value="monthList">一個月內到期  (${withinMonthNum})</span>
				<span class="tab" value="expiredList">已過期  (${expiredNum})</span>				
			</p>
		</div>
		
<!-- Page Content -->
<div class="col-lg-12">
<!-- ExpDate Row -->
<div id="exprow" class="row">

	<c:forEach items="${beans}" var="item">
	<c:set var="expDays" value="${item.lastsDay}"></c:set>
	<div class='col-lg-12 expDiv' 
		 dateList=
		'<c:if test="${expDays<0}">expiredList</c:if> 
		 <c:if test="${expDays>0 && expDays<32}">monthList</c:if>
		 <c:if test="${expDays>=32}">efficient</c:if>' 
		 dateId="${item.expDate.dateId}" > 
	<div class="exp-content">
		<div class="col-lg-3">
			<div class="prodImg">
				<a href="<%=request.getContextPath()%>/products/view/${item.product.prodId}">
		            <img src="/products/show?prodImg=${item.product.prodImg}"/>
		        </a>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="dateTitle">
				<h2>${item.product.prodName}</h2>
				<h3>${item.brandName}</h3>
				<h3>${item.product.categoryName}</h3>
			</div>
			
			<div class="expinfo">
		        <h3 class="date">製造日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${item.mfd}</span></h3>
				<h3 class="date">到期日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${item.exp}</span></h3>
				<h3 class="date">生產批號&nbsp;&nbsp;<span>${item.expDate.batchCode}</span></h3>
		    </div>
		</div>
		<div class="col-lg-2 btnDiv">
			<button name="${item.expDate.dateId}" class="btn btn-default btn-delete">刪除</button>
		</div>
		<div class="col-lg-3">
			<div class='lastDays <c:if test="${expDays<0}"> expired </c:if> <c:if test="${expDays<=31 && expDays>0}"> within30</c:if>'>
				<p>
		        	<c:if test="${expDays>=0}">
		        		 <span>還有</span>&nbsp;<h1>${item.lastsDay}<span>&nbsp;&nbsp;天</span></h1></c:if>
		        	<c:if test="${expDays<0}">
		        		<span>已過期</span> &nbsp;<h1>${fn:substringAfter(item.lastsDay, "-")}<span>&nbsp;&nbsp;天</span></h1></c:if>
		        </p>
			</div>
		</div>
	</div> <!-- exp-content -->
	</div> <!-- expDiv -->
	</c:forEach>
	
</div> <!-- /.row -->
</div> <!-- col -->




	</div> <!-- col-lg -->
	
	<c:import url="/WEB-INF/jsp/member/memberPages-nav.jsp" />
	
</div> <!-- row -->

</div> <!-- grey_bg -->       
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />

<!-- Scripts -->
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/fms/swipe.js"></script>
<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/fms/fms-main.js"></script>
<script src="/js/member/member.js"></script>
<script>
$(function(){
	$('.tab').click(function(){
		$('#count-review>.selected').removeClass('selected');
		$(this).addClass('selected');
		
		var tabValue = $(this).attr('value');
		$(".expDiv").addClass('is-hidden');
		$(".expDiv[dateList*="+tabValue+"]").removeClass('is-hidden').addClass('animated fadeInUp');
		if(tabValue=="all"){
			$(".expDiv").removeClass('is-hidden').addClass('animated fadeInUp');
		}
	});
	
    $('.btn-delete').click(function(e){
    	var dateIdStr=e.target.name;
    	var target=e.target;

    	swal({
    		  title: '刪除 ?',
    		  showCancelButton: true,
    		  confirmButtonText: 'OK',
    		  showLoaderOnConfirm: true,
    		  allowOutsideClick: false
    		}).then(function() {
    			$.ajax({
    				url:'/expdate/delete',
              		type : 'GET',
              		data : {"dateIdStr":dateIdStr},
              		success : function(result){
              			$(".expDiv[dateId*="+dateIdStr+"]").remove();
              		}
            	}); //ajax
    		}) //then
    	
    });//end $('#delete').click
	
    
    var timelineBlocks = $('.expDiv'),
	offset = 0.9;
	
	hideBlocks(timelineBlocks, offset);
	
	$(window).on('scroll', function(){
		(!window.requestAnimationFrame) 
			? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
			: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
	});

	function hideBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.exp-content').addClass('is-hidden');
		});
	}

	function showBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.exp-content').hasClass('is-hidden') ) && $(this).find('.exp-content').removeClass('is-hidden').addClass('animated fadeInUp');
		});
	}

})
</script>		
</body>
</html>