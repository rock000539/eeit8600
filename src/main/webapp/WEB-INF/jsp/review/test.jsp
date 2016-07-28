<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Review Add</title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    
    <script src="/js/jquery.min.js"></script>
    
    <!-- FileInput -->	
    <link href="/css/fileinput.min.css" media="all" rel="stylesheet" />
    <script src="/js/fileinput.min.js"></script>
    
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
    padding-left: 140px;
}

#sidebar-wrapper {
    z-index: 1000;
    left: 220px;
    width: 0;
    height: 100%;
    margin-left: -220px;
    overflow-y: auto;
    overflow-x: hidden;
    background: #1a1a1a;
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
    background-color: #1c1c1c;
    -webkit-transition: width .2s ease-in;
      -moz-transition:  width .2s ease-in;
       -ms-transition:  width .2s ease-in;
            transition: width .2s ease-in;

}
.sidebar-nav li:first-child a {
    color: #fff;
    background-color: #1a1a1a;
}
.sidebar-nav li:nth-child(2):before {
    background-color: #ec1b5a;   
}
.sidebar-nav li:nth-child(3):before {
    background-color: #79aefe;   
}
.sidebar-nav li:nth-child(4):before {
    background-color: #314190;   
}
.sidebar-nav li:nth-child(5):before {
    background-color: #279636;   
}
.sidebar-nav li:nth-child(6):before {
    background-color: #7d5d81;   
}
.sidebar-nav li:nth-child(7):before {
    background-color: #ead24c;   
}
.sidebar-nav li:nth-child(8):before {
    background-color: #2d2366;   
}
.sidebar-nav li:nth-child(9):before {
    background-color: #35acdf;   
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
    color: #ddd;
    text-decoration: none;
    padding: 10px 15px 10px 30px;    
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
/*       Hamburger-Cross         */
/*-------------------------------*/

.hamburger {
  position: relative; 
  top: 10px;  
  z-index: 999;
  display: block;
  width: 32px;
  height: 32px;
  margin-left: 15px; 
  background: transparent;
  border: none;
}
.hamburger:hover,
.hamburger:focus,
.hamburger:active {
  outline: none;
}
.hamburger.is-closed:before {
  content: '';
  display: block;
  width: 100px;
  font-size: 14px;
  color: #fff;
  line-height: 32px;
  text-align: center;
  opacity: 0;
  -webkit-transform: translate3d(0,0,0);
  -webkit-transition: all .35s ease-in-out;
}
.hamburger.is-closed:hover:before {
  opacity: 1;
  display: block;
  -webkit-transform: translate3d(-100px,0,0);
  -webkit-transition: all .35s ease-in-out;
}

.hamburger.is-closed .hamb-top,
.hamburger.is-closed .hamb-middle,
.hamburger.is-closed .hamb-bottom,
.hamburger.is-open .hamb-top,
.hamburger.is-open .hamb-middle,
.hamburger.is-open .hamb-bottom {
  position: absolute;
  left: 0;
  height: 4px;
  width: 100%;
}
.hamburger.is-closed .hamb-top,
.hamburger.is-closed .hamb-middle,
.hamburger.is-closed .hamb-bottom {
  background-color: #1a1a1a;
}
.hamburger.is-closed .hamb-top { 
  top: 5px; 
  -webkit-transition: all .35s ease-in-out;
}
.hamburger.is-closed .hamb-middle {
  top: 50%;
  margin-top: -2px;
}
.hamburger.is-closed .hamb-bottom {
  bottom: 5px;  
  -webkit-transition: all .35s ease-in-out;
}

.hamburger.is-closed:hover .hamb-top {
  top: 0;
  -webkit-transition: all .35s ease-in-out;
}
.hamburger.is-closed:hover .hamb-bottom {
  bottom: 0;
  -webkit-transition: all .35s ease-in-out;
}
.hamburger.is-open .hamb-top,
.hamburger.is-open .hamb-middle,
.hamburger.is-open .hamb-bottom {
  background-color: #1a1a1a;
}
.hamburger.is-open .hamb-top,
.hamburger.is-open .hamb-bottom {
  top: 50%;
  margin-top: -2px;  
}
.hamburger.is-open .hamb-top { 
  -webkit-transform: rotate(45deg);
  -webkit-transition: -webkit-transform .2s cubic-bezier(.73,1,.28,.08);
}
.hamburger.is-open .hamb-middle { display: none; }
.hamburger.is-open .hamb-bottom {
  -webkit-transform: rotate(-45deg);
  -webkit-transition: -webkit-transform .2s cubic-bezier(.73,1,.28,.08);
}
.hamburger.is-open:before {
  content: '';
  display: block;
  width: 100px;
  font-size: 14px;
  color: #fff;
  line-height: 32px;
  text-align: center;
  opacity: 0;
  -webkit-transform: translate3d(0,0,0);
  -webkit-transition: all .35s ease-in-out;
}
.hamburger.is-open:hover:before {
  opacity: 1;
  display: block;
  -webkit-transform: translate3d(-100px,0,0);
  -webkit-transition: all .35s ease-in-out;
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

#addForm > table{
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

#addForm button{
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
/* 	position: absolute; */
    top: 26px;
    left: 70px;
    color: #4D4D4D;
/*     font-size: 12px; */
     letter-spacing:-7px;  /* diamond間距加寬*/
}

.urcosme-score-display{
	display: inline-block;
	background-color:white;
	border:#cccccc solid 1px;
	border-radius:20px;
	height: 44px;
	width: 250px;
}

.diamond{
	margin:6px 0px 0px 15px;
	font-size: 32px;
	width: 30px;
/* 	color:#FF5151;有得分(紅色) */
	color:#BEBEBE; /*沒有得分(灰色)*/
}

.review-rating{
	margin-left:20px;
	letter-spacing:3px;
	font-size: 20px;
	font-family:"Microsoft JhengHei";
}

/* .li{color:rgb(100, 140, 213);}  /*有顏色*/ 
.li{color:#FF5151;}  /*diamond粉紅色*/
/* .d1 {margin:40px 160px;} */
  /*width:100%;height:140px;*/

</style>
</head>

<body>
<div>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
<div class="grey_bg row bgcolor">
<FORM id="addForm">
    <div id="wrapper">
        <div class="overlay"></div>
        <!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation" style="margin-top:135px;height:350px;">
            <ul class="nav sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                       Brand
                    </a>
                </li>
                <li>
                    <a href="#">Home</a>
                </li>
                <li>
                    <a href="#">Home</a>
                </li>
            </ul>
        </nav>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div class="col-lg-1 col-md-1 col-sm-1"></div>
        <div class="col-lg-10 col-md-10 col-sm-10 article" >
<!-- 	        <div id="page-content-wrapper"> -->

            <button type="button" class="hamburger is-closed" data-toggle="offcanvas">
                <span class="hamb-top"></span>
    			<span class="hamb-middle"></span>
				<span class="hamb-bottom"></span>
            </button>
            
          	<section class="team row sub_content" style="padding-bottom: 0">
				<div class="col-lg-12 col-md-12 col-sm-12" style="margin-top:30px;padding-bottom: 0">
		            <div class="dividerHeading">
		                <h4><span style="font-family:'Microsoft JhengHei';">寫心得</span></h4>
		            </div>
		        </div>
			</section>  
			 
			
			<div class="row">
				<div class="form-group">
					<div class="col-lg-8 col-md-8 col-sm-8">
						<input type="hidden" name="memberId" value="${memberId}"/>
						<input type="hidden" name="rewCollect" value="0"/>
						<input type="hidden" name="reviewShow" value="true"/>
						<input type="hidden" name="reviewReport" value="0"/>
						<h3 style="margin:0;padding-bottom: 0;font-family:'Microsoft JhengHei';">&nbsp;&nbsp;&nbsp;心得標題</h3>
						<input type="text" name="reviewTitle" id="reviewTitle" class="form-control" value="${param.reviewTitle}" placeholder="請輸入心得標題" style="border-radius:20px;font-family:'Microsoft JhengHei';"/>
<!-- 						<textarea class="form-control" name="review"  rows="2" cols="5" placeholder="Please Enter Your Title" style="border-radius:10px;"></textarea> -->
						<!-- 評分 -->
						<h3 style="margin:0;padding-bottom: 0;color: #ff7080;font-family:'Microsoft JhengHei';">&nbsp;&nbsp;&nbsp;評分</h3>
						<div class="review-uc-diamond">
						    <ul class="urcosme-score-display">
						        <li id="d1"  class="fa fa-diamond diamond" aria-hidden="true"/>
						        <li id="d2"  class="fa fa-diamond diamond" aria-hidden="true"/>
						        <li id="d3"  class="fa fa-diamond diamond" aria-hidden="true"/>
						        <li id="d4"  class="fa fa-diamond diamond" aria-hidden="true"/>
						        <li id="d5"  class="fa fa-diamond diamond" aria-hidden="true"/>
						    </ul>
						    <b id="p1" class="review-rating" name="reviewRating">1~5分，由你決定!</b>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4">
						<h3 style="margin:0 100px 10px 0;padding-bottom: 0;float: left">&nbsp;&nbsp;&nbsp;封面圖片</h3>
						<input id="reviewImg" name="reviewImg" type="file" class="file-loading" >
						<script>
							$(document).on('ready', function() {
								$("#reviewImg").fileinput({
									showCaption: false,
									browseClass: 'btn btn-default',
							    	showRemove: false,
							    	showUpload : false,
							    	maxFileCount: 1,
							    	previewSettings:{image: {width: "auto", height: "150px"}},
							    });
// 								$('#reviewImg').on('fileimageloaded', function(event, previewId) {
// 									console.log("fileimageloaded");
// 								});
							});
						</script>						
					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 20px" >
				<div class="form-group" >
					<div class="col-lg-12" >
						<textarea class="ckeditor" id="review" name="review" cols="80" rows="12"></textarea>
					</div>
				</div>
			</div>	
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12 hasbutton">
						<button class="btn btn-default btn-lg" type="button" data-toggle="modal" data-target="#myModal" onclick="toModal()"><i class="fa fa-check fa-fw" aria-hidden="true"></i>&nbspSave</button>
						<button class="btn btn-default btn-lg" type="button" name="cancel" onclick="location='/articles/listfms'"><i class="fa fa-close" aria-hidden="true"></i>&nbspCancel</button>
					</div>
				</div>
			</div>		
<!-- 	        </div> <!-- /#page-content-wrapper -->
        </div>
        <div class="col-lg-1 col-md-1 col-sm-1"></div>
    </div><!-- /#wrapper -->
</FORM>
</div>        
            <!-- **每頁不同的內容結束** -->
</div>
<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			
	<!-- Scripts -->
	
	<script src="/js/bootstrap.min.js"></script>
	
	<script src="/js/jquery.validate.min.js"></script>

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
		  var trigger = $('.hamburger'),
		      overlay = $('.overlay'),
		     isClosed = false;

		    trigger.click(function () {
		      hamburger_cross();      
		    });

		    function hamburger_cross() {

		      if (isClosed == true) {          
		        overlay.hide();
		        trigger.removeClass('is-open');
		        trigger.addClass('is-closed');
		        isClosed = false;
		      } else {   
		        overlay.show();
		        trigger.removeClass('is-closed');
		        trigger.addClass('is-open');
		        isClosed = true;
		      }
		  }
		  
		  $('[data-toggle="offcanvas"]').click(function () {
		        $('#wrapper').toggleClass('toggled');
		  });  
		  
		/*  ===================================================== */
		
	var formdata = new FormData(); 
	formdata.append('reviewImg', $('#reviewImg').prop('files')[0]); 
	
	$('#reviewImg').on('click',function(){
		 if($(".file-input	")[0]){
		$('#reviewImgFake').removeClass("reviewImg");
			 console.log("yes pp")
			} else {
		$('#reviewImgFake').addClass("reviewImg");
				console.log("no pp")}
	})
	

		//驗證
// 			$('#addForm').validate({
// 				onfocusout: function (element) {
// 			        $(element).valid();
// 			    },
// 				rules:{
// 					articleType:{required:true},
// 					articleTitle:{required:true},
// //	 				review:{required:true},
// 				},//end of rules
// 				messages:{
// //	 				articleType:'必填',
// //	 				articleTitle:'必填',
// //	 				review:'必填'
// 				},//end of messages			
// 			});
			

			$('#confirm').on('click',function(){

//	 			var ckeditorvalue = CKEDITOR.instances['content'].getData();
//	 			var datas={'memberId':'${memberId}','articleType':$(':selected').val(),'articleTitle':$(':text[name=articleTitle]').val(),'review':ckeditorvalue};
//	 			console.log(JSON.stringify(datas));
				$('#review').val(CKEDITOR.instances['review'].getData());
				$.ajax({
						url:'/articles/insert',
						type:'post',
						contentType:'application/json;charset=UTF-8',
//	 					data:JSON.stringify(datas),
						data:JSON.stringify($('#addForm').serializeObject()),
						dataType:'json',
						success:function(data){
							location.href="/articles/listfms";
		 				}
					});		
				
			});

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
		
		
	/*  ===================================================== */
var flag = false;
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
	
	
});
	</script>
</body>
</html>