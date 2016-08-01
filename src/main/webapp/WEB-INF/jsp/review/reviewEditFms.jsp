<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title></title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    <link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    	
   	<!-- Scripts -->
    <script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	
	<!-- 表單驗證  -->
	<script src="/js/jquery.validate.min.js"></script>
    
    <!-- FileInput -->	
    <link href="/css/fileinput.min.css" media="all" rel="stylesheet" />
    <script src="/js/fileinput.min.js"></script>
    
   	<!-- Select2 Plugin -->
	<link href="/css/product/select2.min.css" rel="stylesheet" />
	<script src="/js/product/search/select2.min.js"></script>
    
<style>
/* ===========Slidebar  Start=================== */
body {
    position: relative;
    overflow-x: hidden;
    font-family:"Microsoft JhengHei"; 
}
body,
html { height: 100%;}
.nav .open > a, 
.nav .open > a:hover, 
.nav .open > a:focus {background-color: transparent;}

/*-------------------------------*/
/*           Wrappers            */
/*-------------------------------*/

#wrapper {
    padding-left: 0;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
}

#wrapper.toggled {
    padding-left: 70px; /*main往右多少*/
}

#sidebar-wrapper {
    z-index: 1000;
    left: 220px;
    width: 0;
    height: 100%;
    margin-left: -220px;
    overflow-y: auto;
    overflow-x: hidden;
    background: #ffffff; 
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
}

#sidebar-wrapper::-webkit-scrollbar {
  display: none;
}

#wrapper.toggled #sidebar-wrapper {
    width: 220px;
}

#page-content-wrapper {
    width: 100%;
    padding-top: 70px;
}

#wrapper.toggled #page-content-wrapper {
    position: absolute;
    margin-right: -220px;
}

/*-------------------------------*/
/*     Sidebar nav styles        */
/*-------------------------------*/

.sidebar-nav {
	margin-top:200px;
    position: absolute;
    top: 0;
    width: 220px;
    margin: 0; 
    padding: 0;
    list-style: none;
}

.sidebar-nav li {
    position: relative; 
    line-height: 20px;
    display: inline-block;
    width: 100%;
}

.sidebar-nav li:before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;
    height: 100%;
    width: 3px;
    -webkit-transition: width .2s ease-in;
      -moz-transition:  width .2s ease-in;
       -ms-transition:  width .2s ease-in;
            transition: width .2s ease-in;

}

.sidebar-nav li:hover:before,
.sidebar-nav li.open:hover:before {
    width: 100%;
    -webkit-transition: width .2s ease-in;
      -moz-transition:  width .2s ease-in;
       -ms-transition:  width .2s ease-in;
            transition: width .2s ease-in;

}

.sidebar-nav li a {
    display: block;
    color: white;
    text-decoration: none;
    padding: 10px 15px 10px 30px;    
    font-size: 14px;
}

.sidebar-nav li a:hover,
.sidebar-nav li a:active,
.sidebar-nav li a:focus,
.sidebar-nav li.open a:hover,
.sidebar-nav li.open a:active,
.sidebar-nav li.open a:focus{
    color: #fff;
    text-decoration: none;
    background-color: transparent;
}

.sidebar-nav > .sidebar-brand {
    height: 65px;
    font-size: 20px;
    line-height: 44px;
}
.sidebar-nav .dropdown-menu {
    position: relative;
    width: 100%;
    padding: 0;
    margin: 0;
    border-radius: 0;
    border: none;
    background-color: #222; 
    box-shadow: none;
}

/*-------------------------------*/
/*            Overlay            */
/*-------------------------------*/

.overlay {
    position: fixed;
    display: none;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 1;
}
/* ===========Slidebar  End=================== */

/* ===========article  Start=================== */

.bgcolor{
/* 	background-color:#EBDBFF; */
	background: -webkit-linear-gradient(#EBDBFF , #FFEFD5); /* For Safari 5.1 to 6.0 */
 	background: -o-linear-gradient(#EBDBFF , #FFEFD5); /* For Opera 11.1 to 12.0 */
  	background: -moz-linear-gradient(#EBDBFF , #FFEFD5); /* For Firefox 3.6 to 15 */
  	background: linear-gradient(#EBDBFF , #FFEFD5); /* Standard syntax */
/* 	padding:40px; */
/* 	border-radius:10px; */
}

.article > section{
	padding-top: 0;
	padding-bottom:0;
}

#eidtForm > table{
width:72vw;
}

/*dividerHeading*/
.dividerHeading,
.widget_title
{
    text-align: center;
    position: relative;
    margin-bottom:25px;
}
.dividerHeading h4,
.widget_title h4
{
    font-size:18px;
    position:relative;
    line-height:0;
    border-bottom: 1px solid #727CB6;
}
.dividerHeading h4 span{
    background:white;
    position:relative;
    line-height: 7px;
    top: 4px;
    display: inline-block;

}
.dividerHeading h4 span:before,
.dividerHeading h4 span:after,
.widget_title h4 span:after,
.widget_title h4 span:before
{
    color:#E74C3C;
    font-size:10px;
    content: "\f10c";
    font-family:fontawesome;
    display: inline-block;

}
.dividerHeading h4 span:before,
.widget_title h4 span:before
{
    margin-right:10px ;
}
.dividerHeading h4 span:after,
.widget_title h4 span:after
{
    margin-left:10px ;
}

/* 修改樣式 */

.dividerHeading h4 span:after, 
.widget_title h4 span:after, 
.widget_title h4 span:before {
    color: #727CB6;
}

.dividerHeading h4 span:before, 
.dividerHeading h4 span:after, 
.widget_title h4 span:after, 
.widget_title h4 span:before {
    color: #727CB6;
}

.dividerHeading h4 span {
    background: #EBDBFF; /*new post bgcolor*/
}
		
.dividerHeading h4,
.widget_title h4{
    font-size: 21px;
    font-weight: normal;
    margin-bottom: 0px;
    padding: 0px;
    position: relative;
}

.dividerHeading h4::before, .widget_title h4::before { 
	border: 0px;
    content: none;
}

#eidtForm button{
	margin:0 5px;
}

select { 
	text-align-last:center; 
}

.hasbutton{
	text-align:center; 
	margin-top:20px;
	margin-bottom:20px;
}

/* ===========article  End=================== */
.reviewImg{
/* 	text-align: center; */
/*     position: absolute; */
    top: 0;
    margin: 0 auto;
    width: 300px;
    height: 210px;
    z-index: 5;
    border: 1px solid #ccc;
    float: left;
    background-color: white;
    border-radius:20px;
}

.review-uc-diamond {
    top: 26px;
    left: 70px;
    color: #4D4D4D;
    letter-spacing:-7px;  /* diamond間距加寬*/
}

.urcosme-score-display{
	display: inline-block;
	border-radius:20px;
	height: 44px;
	width: 250px;
}

.diamond{
	margin:6px 0px 0px 15px;
	font-size: 32px;
	width: 30px;
	color:#BEBEBE; /*沒有得分(灰色)*/
}

.review-rating{
	letter-spacing:1px;
	font-size: 18px;
	font-family:"Microsoft JhengHei";
}

.prodImgMain{
	width:210px;
	display: table-cell;
    text-align: center;
	overflow: hidden;
    margin: 0px auto;
    padding: 0px;
    vertical-align: middle;
    border-radius:20px;
}
.li{
	color:#FF5151; /*diamond粉紅色*/
	}  

</style>
</head>

<body>
<div>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
<div class="grey_bg row bgcolor">
<FORM id="editForm">
    <div id="wrapper">
        <div class="overlay"></div>
        <!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation" style="margin-top:135px;height:390px;">
            <ul class="nav sidebar-nav">
                <li class="sidebar-brand" style="background: black;">
                    <a  class="fa fa-search" style="height: 65px;font-size: 26px;padding:20px 0 0 10px">&nbsp;&nbsp;Product Search</a>
                </li>
                <li>
                    <a style="color: #565656;font-size: 14px;">選擇品牌名稱，搜尋產品！</a>
                </li>
                <li>
                    <a >
                    	<div class="row">
	<!-- 						<select id="sbrand" class="js-example-basic-single" style="width: 80%; visibility: hidden;"> -->
							<select id="sbrand" class="js-example-basic-single" style="width: 90%;">
								<option value="0">請選擇品牌</option>
								<c:forEach items="${brands}" var="brand">
									<option value="${brand.brandId}">${brand.brandName}</option>
								</c:forEach>
							</select>
						</div>
					</a>
                </li>
                <li id="sprodLi">
                    <a >
                    	<div class="row">
							<select id="sprod" class="js-example-basic-single" style="width: 90%"></select>
						</div>                 
                    </a>
                </li>
                <li id="prodImgLi">
                    <a >
                        <div class="row">
							<img id="prodImg" class="js-example-basic-single" alt="prodImg" style="width: auto;height: 120px;margin-left: 30px">
						</div>
                    </a>
                </li>
                <li id="check">
                    <a >
                        <div class="row">
							<button  class="btn btn-default" type="button" style="margin:0 0 0 45px;"><i class="fa fa-check fa-fw" aria-hidden="true"></i>&nbsp;Check</button>
						</div>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div class="col-lg-1 col-md-1 col-sm-1"></div>
        <div class="col-lg-10 col-md-10 col-sm-10 article">
        
<!-- 	        <div id="page-content-wrapper"> -->
            
          	<section class="team row sub_content" style="padding-bottom: 0">
				<div class="col-lg-12 col-md-12 col-sm-12" style="margin-top:30px;padding-bottom: 0">
		            <div class="dividerHeading">
		                <h4><span style="font-family:'Microsoft JhengHei';">Edit your Review</span></h4>
		            </div>
		        </div>
			</section>  
			 
			
			<div class="row">
				<div class="form-group">
					<input type="hidden" name="reviewId" value="${review.reviewId}"/>
					<input type="hidden" name="memberId" value="${memberId}"/>
					<input type="hidden" name="rewCollect" value="${review.rewCollect}"/>
					<input type="hidden" name="reviewShow" value="${review.reviewShow}"/>
					<input type="hidden" name="reviewReport" value="${review.reviewReport}"/>
					
					
					<input type="hidden" name="reviewRating" id="reviewRating"/>
					<input type="hidden" name="prodId" id="prodId"/>
		
					
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="row">
							<button class="btn btn-default btn-lg is-closed" type="button" data-toggle="offcanvas" style="width:400px;margin-left: 35px">
								<i class="fa fa-search" aria-hidden="true">
								</i>&nbsp;請先找到您要發表心得的產品唷
							</button>
						</div>
					
						<div class="col-lg-5 col-md-5 col-sm-5" style="width:210px;height: 210px;margin: 20px 0 0 20px;">
							<div class="row"> 						<!-- max-width:240px;max-height:270px; -->
								<input id="prodImgButton" type="text" class="form-control" placeholder="&nbsp;&nbsp;產品圖片" style="border-radius:20px;font-family:'Microsoft JhengHei';height: 210px;font-size:35px;"/>
								<img id="prodImgMain" class="js-example-basic-single prodImgMain" src="/reviews/showProd?prodId=${review.prodId}">
							</div>
						</div>
						<div class="col-lg-5 col-md-5 col-sm-5" style="margin:0 0 0 10px ">
							<div class="row">
								<div id="brandName" style="margin:70px 0 50px 10px;font-family:'Microsoft JhengHei';font-size:20px;">${review.product.brandName}</div> 
								<div id="prodName"style="margin:0 0 0 10px;font-family:'Microsoft JhengHei';font-size:20px;">${review.product.prodName}</div>
							</div>
						</div>
						<!-- 評分  -->
						<div style="margin:250px 0 0 20px">
							<h3 style="margin:0;padding-bottom: 0;font-family:'Microsoft JhengHei';">&nbsp;&nbsp;&nbsp;評分:
								<b id="p1" class="review-rating" style="margin:15px 0 5px 15px;">1~5分，由你決定!</b>
							</h3>
							<div class="review-uc-diamond">
							    <ul class="urcosme-score-display">
							        <li id="d1"  class="fa fa-diamond diamond" aria-hidden="true"/>
							        <li id="d2"  class="fa fa-diamond diamond" aria-hidden="true"/>
							        <li id="d3"  class="fa fa-diamond diamond" aria-hidden="true"/>
							        <li id="d4"  class="fa fa-diamond diamond" aria-hidden="true"/>
							        <li id="d5"  class="fa fa-diamond diamond" aria-hidden="true"/>
							    </ul>
							</div>
						</div>	
						<!-- 評分 -->
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="row">
							<h3	style="margin:0 20px 10px 0;padding-bottom: 0;float: left">&nbsp;&nbsp;&nbsp;封面圖片</h3>
							<input id="reviewImg" name="reviewImg" type="file" class="file-loading"/>
							<input type="hidden" id="reviewImgPath" name="reviewImgPath" value="${review.reviewImg}" />
								<script>
									$(document).on('ready', function() {
										$("#reviewImg").fileinput({
											showCaption: false,
											browseClass: 'btn btn-default',
									    	showRemove: false,
									    	showUpload : false,
									    	maxFileCount: 1,
									    	previewSettings:{image: {width: "auto", height: "210px"}},
									        initialPreview: [
										        "http://localhost:8080/reviews/show?reviewImg="+$('#reviewImgPath').val(),
									        ],
				                     		initialPreviewAsData: true,
				                     		initialPreviewFileType: 'image',
				                     	    initialPreviewConfig:{image:{width: "auto", height: "210px"}},
									    });
		// 								$('#reviewImg').on('fileimageloaded', function(event, previewId) {
		// 									console.log("fileimageloaded");
		// 								});
									});
								</script>	
						</div>					
					</div>
						
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="row" >
							<h3 style="margin:15px 0 5px 35px;padding-bottom: 0;font-family:'Microsoft JhengHei';">&nbsp;&nbsp;&nbsp;心得標題</h3>
							<input type="text" name="reviewTitle" id="reviewTitle" class="form-control"  placeholder="請輸入心得標題" value="${review.reviewTitle}"style="border-radius:20px;font-family:'Microsoft JhengHei';margin-left: 35px"/>
		<!-- 						<textarea class="form-control" name="review"  rows="2" cols="5" placeholder="Please Enter Your Title" style="border-radius:10px;"></textarea> -->
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-12 col-md-12 col-sm-12" >
				<div class="row" style="margin-top: 20px;margin-left: 15px" >
					<div class="form-group" >
						<textarea class="ckeditor" id="review" name="review" cols="80" rows="12"></textarea>
					</div>
				</div>
			</div>	
			<div class="col-lg-12 col-md-12 col-sm-12 hasbutton">
				<div class="row">
					<div class="form-group">
						<button id="save" class="btn btn-default btn-lg" type="button" data-toggle="modal" data-target="#myModal"><i class="fa fa-check fa-fw" aria-hidden="true"></i>&nbsp;Save</button>
						<button class="btn btn-default btn-lg" type="button" name="cancel" onclick="history.back()"><i class="fa fa-close" aria-hidden="true"></i>&nbsp;Cancel</button>
					</div>
				</div>
			</div>		
<!-- 	        </div> <!-- /#page-content-wrapper -->
        </div>
        <div class="col-lg-1 col-md-1 col-sm-1"></div>
    </div><!-- /#wrapper -->
</FORM>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
<!--       Modal content -->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
	        	<button id="close" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
    
</div>
<!-- end of Modal -->

</div>        
            <!-- **每頁不同的內容結束** -->
</div>			

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
	
	<!-- Scripts -->	
	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>
	
	<script type="text/javascript" src="/js/article/summernote.js"></script>
	
	<script src="/ckeditor/ckeditor.js"></script>

	<script type="text/javascript">
	$(document).ready(function () {
		
		//設定title
		$('title').text("Review - Edit  ${review.reviewTitle}");
		
		// 設定原始文章內容
		CKEDITOR.replace('review');
		CKEDITOR.instances['review'].setData('${review.review}');
		
		// 設定Side Bar
// 		id="sbrand"
// 		${review.product.brandName}
// 		$('#').attr('selected',true);
		
	/*  ==================== Side Bar ======================== */
		
		  $('[data-toggle="offcanvas"]').click(function () {
		        $('#wrapper').toggleClass('toggled');
		  });  

	/*  ================驗     證============================= */
	
	$('#eidtForm').validate({
		onkeyup: true,
		onfocusout: function (element) {
	        $(element).valid();
	    },
	    focusInvalid: true,
		rules:{
			reviewTitle:{required:true},
		},//end of rules
		messages:{
				reviewTitle:{required:'please enter review title'},
		},//end of messages	
	});
	/*  =====================Prod Search ======================== */
		
	// hide  select
	$('#sprod').hide();
	$('#sprodLi').hide();
	$('#prodImg').hide();
	$('#prodImgLi').hide();
	$('#check').hide();
	$('#prodImgButton').hide();
	
	
// 	// select-brand init
// 	$('#sbrand').select2({
// 		placeholder: 'Select a	 brand',
// 		allowClear: true,
// 		theme: 'classic', 
// 	});
	
// 	$('#sbrand').on('select2:select', function (evt) {

// 		if($(this).val() > 0) {
			
// 			$('#brandName').text($(this).select2('data')[0].text);
// 			$('#sprodLi').show();
			
// 			// select-product init
// 			$('#sprod').select2({
// 				placeholder: '請選擇產品',
// 				allowClear: true,
// 				theme: 'classic',
// 			});
			
// 			// append data to select #sprod
// 			$.ajax({
// 				url: '/products/search/' + $(this).val(),
// 				type: 'POST',
// 				dataType: 'json',
// 				contextType: 'application/json; charset=utf-8;',
// 				success:function(response){
// 					var select = $('#sprod').empty();
// 					select.append($('<option>請選擇產品</option>'));
// 					for(i=0; i<response.length; i++) {
// 						select.append($('<option></option>').attr('value', response[i].prodId).text(response[i].prodName));
// 					}
// 				}
// 			});
// 		}
// 	});
	
	
// 	$('#sprod').on('select2:select', function (evt) {
		
// 		var prodNum=$(this).val();
		
// 		$('#prodId').val(prodNum); //產品id評分到後端
		
// 		if(prodNum > 0) {
// 			$('#prodName').text($(this).select2('data')[0].text);
// 			// show img
// 			$('#prodImgLi').show();
// 			$('#prodImg').show()
// 						.attr("src","/reviews/showProd?prodId="+prodNum);
// 			$('#check').show();
			
// 			$('#check').on('click',function(){
// 				$("#prodImgButton").remove();
// 				$('#prodImgMain').attr("src","/reviews/showProd?prodId="+prodNum);
// 				$('#wrapper').toggleClass('toggled'); //sidebar open/close
// 			})
// 		}
// 	});
	
	/*  ===================== diamond ================================ */
	
		// 設定原始diamond變亮
		for (var i = 1; i <= "${review.reviewRating}" ; i++) {//img的id的第二個字1,2,3,4.... 
	        document.getElementById("d" + i).className = "fa fa-diamond diamond li";
	    }
	    var flag = true; //click的時候不能讓星星變黑白
	    
	    //同reviewAddFms diamond
	    for (var i = 1; i <= 5; i++) {
	        with (document.getElementById("d" + i)) {
	            addEventListener("mouseover", function () { mouseOver(this.id) });  //哪個img id觸發了mouseOver事件讓星星變亮 
	            addEventListener("mouseout", function () { mouseOut(this.id) }); //哪個img id觸發了mouseOut事件讓星星變暗 
	            addEventListener("click", function () { Click(this.id) }); //id哪個img id觸發了onClick事件讓星星變亮 
	        }
	    }
	
	
	function Click(id) {  //id哪個img id觸發了onClick事件讓星星變亮 
	    for (var i = 1; i <= id.substr(1) ; i++) {//img的id的第二個字1,2,3,4.... 
	        document.getElementById("d" + i).className = "fa fa-diamond diamond li";
	    }
	    flag = true; //click的時候不能讓星星變黑白
	}
	
	function mouseOut(id) {//哪個img id觸發了mouseOut事件讓星星變暗 
	    if (flag == false) { //click的時候不能讓星星變黑白
	        for (var i = 1; i <= id.substr(1) ; i++) {//img的id的第二個字1,2,3,4....  
	            document.getElementById("d" + i).className ="fa fa-diamond diamond";
	        }
	        document.getElementById("p1").textContent = "1~5分，由你決定!";
	    }
	    flag = false; //click後mouseout的時候mouseout功能恢復
	}
	
	function mouseOver(id) {//哪個img id觸發了mouseOver事件讓星星變亮 
	    for (var i = 1; i <= 5; i++) { //把星星點亮前先設為不亮(讓click之後回到預設狀態) 
	        document.getElementById("d" + i).className = "fa fa-diamond diamond";
	    }
	    for (var i = 1; i <= id.substr(1) ; i++) {//img的id的第二個字1,2,3,4....  
	        document.getElementById("d" + i).className = "fa fa-diamond diamond li";
	    }
	    $('#reviewRating').val(id.substr(1)); //心得評分到後端
	    
		    switch (id.substr(1)) {
			    case "1":  document.getElementById("p1").textContent =id.substr(1) + "分，不合我意...";
			             break;
			    case "2":  document.getElementById("p1").textContent =id.substr(1) + "分，勉強接受...";
			             break;
			    case "3":  document.getElementById("p1").textContent =id.substr(1) + "分，普通啦！";
			             break;
			    case "4":  document.getElementById("p1").textContent =id.substr(1) + "分，相當不錯！";
			             break;
			    case "5":  document.getElementById("p1").textContent =id.substr(1) + "分，超棒！超讚的！";
			             break;
			}
		}
/*  ============================================= */
		$.fn.serializeObject = function()
		{
		    var o = {};
		    var a = this.serializeArray();
		    $.each(a, function() {
		        if (o[this.name] !== undefined) {
		            if (!o[this.name].push) {
		                o[this.name] = [o[this.name]];
		            }
		            o[this.name].push(this.value || '');
		        } else {
		            o[this.name] = this.value || '';
		        }
		    });
		    return o;
		};
/*  =================save click============================ */

		$('#save').on('click',function(){
		    if($('#eidtForm').validate().form()&& CKEDITOR.instances['review'].getData().replace(/&nbsp;/g,'').replace(/<p>/g, "").replace(/<\/p>/g,"").trim().length != 0){
		    	
			//ckEditor and eidtForm input formdata
			$('#review').val(CKEDITOR.instances['review'].getData().replace(/\n/g,""));
			var formdata = new FormData(); 
				formdata.append('reviewImgFile', $('#reviewImg').prop('files')[0]); 
				formdata.append('review', new Blob([JSON.stringify($('#eidtForm').serializeObject())],
											{type: 'application/json'})); 
// 			var ckeditorvalue = CKEDITOR.instances['content'].getData();
// 			var datas={'memberId':'${memberId}','articleType':$(':selected').val(),'articleTitle':$(':text[name=articleTitle]').val(),'review':ckeditorvalue};
// 			console.log(JSON.stringify(datas));
			$.ajax({
					url:'/reviews/insert_fms',
					type:'post',
					contentType : false,
					processData : false, 
					data:formdata,
					dataType:'json',
					success:function(data){
						console.log("data="+data);
						toModalSuccess();
	 				}
				});//ajax end
		    }else{
		    	toModealError();
		   	}//validate end
		});//save click end
});	

	/*  ================= Modal ============================ */
	function toModalSuccess(){
		console.log("false");
			$(".modal-title").empty()
							 .append('<img style="width: 150px;height: auto;margin-left:200px" src="/images/review/thumbs-up.jpg">');
			$(".modal-body").empty()
							.append('<h2 style="margin-left:130px">Success! Your Review Will Post</h2>')	
			$('#close').hide();
		    window.setTimeout(function () {		    	
		        $("#myModal").modal("hide");
		        history.back(1);
		    }, 2500);	
	}
	
	function toModealError(){
			$(".modal-title").empty()
						     .append('<img style="width: 280px;height: auto;margin-left:140px" src="/images/review/Oops.jpg">');
			$(".modal-body").empty()
							.append('<p style="color:red;font-size:20px;margin-left:140px">Please Enter the Required Fields</p>');
	}
	

</script>
</body>
</html>