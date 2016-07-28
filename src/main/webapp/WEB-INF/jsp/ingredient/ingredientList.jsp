<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ingredient ListPage</title>

	<script src="/js/jquery.min.js"></script>
	<!--  BASE CSS STYLE  -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/bms/style.min.css" rel="stylesheet">
	<link href="/css/bms/default.css" rel="stylesheet" id="theme">
	<link href="/css/bms/bms-customize.css" rel="stylesheet">
	<!--  BASE JS  -->
	<script src="/js/bms/pace.min.js"></script>
	
	<!-- 一定要放在Header、NavBar css的後面  -->
    <link rel="stylesheet" href="/css/trirand/ui.jqgrid-bootstrap.css" />
	
	
	<style>
		.ui-th-column {
			text-align: center;
		}
		.center .ui-jqgrid {
    		margin-left: auto;
    		margin-right: auto;
		}
</style>
</head>
<body>
	<!-- Loading animate -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	
	<!-- page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
	
	<c:import url="/WEB-INF/jsp/bms/bms_header.jsp" />
	<c:import url="/WEB-INF/jsp/bms/bms_navbar-side.jsp" />	
	
		<!-- page content -->
		<div id="content" class="content">
			<!-- breadcrumb 目前位置 -->
			<ol class="breadcrumb pull-right">
				<li><a href="<% request.getContextPath(); %>/bms">Home</a></li>
				<li><a href="javascript:;">檢舉系統</a></li>
				<li class="active">會員管理</li>
			</ol>
			
			<!-- page-header 每頁標題 副標 -->
			<h1 class="page-header">成份管理列表 <small></small></h1>
			
			<!-- 內文 -->
			<div class="row">
			    <div class="col-md-12 ui-sortable">
	            <!-- **每頁不同的內容從這裡開始** -->
                
                	<div id="grid" class="jqGrid" style="margin-top:20px">
					    <table id="jqGrid"></table>
					    <div id="jqGridPager"></div>
					</div>
					
                <!-- **每頁不同的內容 end** -->     
			    </div><!-- /end .col-md-12 -->
			</div> <!-- /end .row -->
		</div>
		<!-- /end #content -->
		<!-- scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- /end page container -->

	<!--  BASE JS  -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bms/jquery.slimscroll.min.js"></script>
	<script src="/js/bms/bms.js"></script>
	<!-- jqGrid js、css -->
    <script src="/js/trirand/i18n/grid.locale-tw.js"></script>
    <script src="/js/trirand/jquery.jqGrid.min.js"></script>
    
<script>
	$.jgrid.defaults.width = 780;
</script>

<script>
$(function () {
			
     $("#jqGrid").jqGrid({
             url: '/ingredients/select_jqgrid',
             mtype: "GET",
			 styleUI : 'Bootstrap',
             datatype: "json",
             jsonReader: {
				root: "content",
		      	page: "number"+1, 
		      	total: "totalPages", 
		      	records: "totalElements", 
			    repeatitems: false,
   			 },
             colModel: [
		{
			label: '',
		    name: '',
		    width: 100,
		    align: 'center',
		    resizable: false,
		    formatter: 'actions',
		    formatoptions: {
		        keys: true,
		        editbutton : true,
		        delbutton : true,
		        editformbutton: true, //test
		        // 各項option請參考 http://goo.gl/FV6iq
		        editOptions: {
		            beforeShowForm: function() {
		            	$('#editmodjqGrid').remove();
		            	document.location.href='/ingredients/edit?ingredId=' + $('#jqGrid').jqGrid('getGridParam', 'selrow');
		            },
		        },
		        delOptions: {
		        	width: 'auto',
		        	height: 'auto',
		        	modal: true,
		            resize: false,
		            msg: '刪除此筆資料？',
		        	bSubmit: 'Delete',
		        	bCancel: 'Cancel',
		        	closeOnEscape: true,
		        	url: '/ingredients/delete',
		        	ajaxDelOptions: { contentType: 'application/json; charset=utf-8;', dataType: 'json' },
		        	serializeDelData: function(postdata) { return JSON.stringify({'ingredId':$(this).getRowData(postdata.id).ingredId}); },
		        	afterSubmit: function(response) { $("#jqGrid").jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid'); console.log(response); return [true, '', false]; }
		        },
		    }       
		},
		{ 
			label: 'ID',
			name: 'ingredId',
			width: 40,
			align: 'center',
			resizable: false,
			key: true,
		},
		{ 
			label: '成份', 
			name: 'ingredName', 
			width: 180,
			align: 'center',
			resizable: false,
		},
		{ 
			label: '中文名稱', 
			name: 'ingredChName', 
			width: 180,
			align: 'center',
			resizable: false,
		},
		{ 
			label: '特性',
			name: 'ingredChar',
			width: 180,
			align: 'center',
			resizable: false,
		},
		{ 
			label: '刺激度', 
			name: 'ingredIrritant', 
			width: 80,
			align: 'center',
			resizable: false,
		},
		{ 
			label: '致粉刺性', 
			name: 'ingredAcne', 
			width: 80,
			align: 'center',
			resizable: false,
		},
		{ 
			label: '安心度', 
			name: 'ingredSafety', 
			width: 80,
			align: 'center',
			resizable: false,
		}		
         ],
            width: 'auto', // 寬度
			height: 380, // 高度
			rowNum: 10, // 每頁顯示列數
			rownumbers: true, // 第n列
			rownumWidth: 35, // 第n列寬度
			caption: 'Ingredient Grid View', // 最上方的標題和收合Table
			loadonce: false, // 資料是否只載入一次
			viewrecords: true, // 右下角的 1-10 共n條
			pager: '#jqGridPager',
			sortable: false,
			beforeRequest: function () {
                 responsive_jqgrid($(".jqGrid"));
             }
         });
         
   	// jQuery Grid Navigator
	$('#jqGrid').navGrid('#jqGridPager', 
	// the buttons to appear on the toolbar of the grid
	// 請參考 http://goo.gl/gBYXSe
	{
	          edit: false,
	          add: true,
	          del: false,
	          search: true,
	          refresh: true,
	          view: true,
	          position: 'left',
	          cloneToTop: false
	      },
	   	// options for the Edit Dialog
	         {
	   		
	         },
	      // options for the Add Dialog
	      {
	      	beforeShowForm: function() { 
	      		$('#editmodjqGrid').remove();
	      		document.location.href="/ingredients/add";
	      	},
	      },
	   	// options for the Delete Dailog
	         {
	   		
	         },
	      	// options for the Search Dailog
	         {
		width: 'auto',
		height: 'auto',
		modal: true,
		resize: false,
		searchOnEnter: true,
		closeOnEscape: true,
		closeAfterSearch: true,
	},
	// options for the View Dailog
         {
			
			height: 'auto',
	      	modal: true,
	        resize: false,
	      	bClose: 'Close',
	      	recreateForm: true,
	      	closeOnEscape: true,
	      	beforeShowForm: function(){
	      		$('#trv_').remove();
	      },
	});
	      	
	// Change Caption Position (TitleBar)
	$("#jqGrid").closest("div.ui-jqgrid-view").children("div.ui-jqgrid-titlebar").css("text-align", "center");
	     });
	     
	//jqGrid RWD
	function responsive_jqgrid(jqgrid) {
	    jqgrid.find('.ui-jqgrid').addClass('clear-margin span12').css('width', '');
	    jqgrid.find('.ui-jqgrid-view').addClass('clear-margin span12').css('width', '');
	    jqgrid.find('.ui-jqgrid-view > div').eq(1).addClass('clear-margin span12').css('width', '').css('min-height', '0');
	    jqgrid.find('.ui-jqgrid-view > div').eq(2).addClass('clear-margin span12').css('width', '').css('min-height', '0');
	    jqgrid.find('.ui-jqgrid-sdiv').addClass('clear-margin span12').css('width', '');
	    jqgrid.find('.ui-jqgrid-pager').addClass('clear-margin span12').css('width', '');
	}
 
   </script>

</body>
</html>