<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Brand List</title>
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
/* 		.ui-jqgrid tr.jqgrow td { */
/* 			line-height: 50px; */
/* 			text-align: center; */
/* 		} */
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
				<li><a href="javascript:;">美妝資料管理</a></li>
				<li class="active">品牌管理</li>
			</ol>
			
			<!-- page-header 每頁標題 副標 -->
			<h1 class="page-header">品牌資料列表<small>品牌管理總覽</small></h1>
			
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
    <script type="text/javascript">
    
    $(function(){
		
//			$.ajax({
//				url:'/brands/select_jqgrid?page=1&rows=10',
//				type:'get',
//				dataType:'json',
//				success:function(result){
//					console.log(result);
//				}
//			});
		
		$('#jqGrid').jqGrid({
			url:'/brands/select_jqgrid',
			datatype:'json',
			mtype: "GET",
			styleUI : 'Bootstrap',
			//對應79行傳回的result
			jsonReader:{
				root:'content',
				page:'number'+1,
				total:'totalPages',
				records:'totalElements',
				repeatitems: false,
			},
			colModel:[
				{
					label:'',
					name: '',
					width:75,
					align: 'center',
					formatter:'actions',
					formatoptions:{
						keys: true,
						editbutton : true,
				        delbutton : true,
				        editformbutton: true, //若設為false(預設)，則可以在當頁當列直接修改-->欄位要加 editable:true
				        editOptions: {
				        	beforeShowForm: function(){
				        		$('#editmodjqGrid').remove();
				        		window.location.href='/brands/edit?brandId='+$('#jqGrid').jqGrid('getGridParam', 'selrow');
				        	}
				        },
				        
				        //設定delbutton點擊後彈出視窗的格式
						delOptions:{
							width: 'auto',
				        	height: 'auto',
				        	modal: true,
				            resize: false,
				            msg: '刪除此筆資料？',
				        	bSubmit: 'Delete',
				        	bCancel: 'Cancel',
				        	closeOnEscape: true,
				        	url: '/brands/delete',
				        	ajaxDelOptions: { contentType: 'application/json; charset=utf-8;', dataType: 'json' },
				        	serializeDelData: function(postdata) { return JSON.stringify({ 'brandId': $(this).getRowData(postdata.id).brandId }); },
				        	afterSubmit: function(response) { $("#jqGrid").jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid'); 
				        									  console.log(response); 
				        									  return [true, '', false]; }			
						}				
					}					
				},
				{
					label: 'BrandID',
					name: 'brandId',
					width: 80,
					align: 'center',
					key: true,											
				},
				{
					label: 'BrandName',
					name: 'brandName',
					width: 100,
					align: 'center',
					//editable:true
				},
				{
					label: 'BrandCName',
					name: 'brandCName',
					width: 110,
					align: 'center'	
				},
				{
					label: 'brandImgPath',
					name: 'brandImg',
					width: 350,
					//align: 'center'							
				},
				{
					label: 'Logo',
		            name: '',
		            width: 110,
		            fixed: true,
		            formatter: function (cellvalue, options, rowObject) {
		            	var str = '/brands/show?brandId='+ rowObject.brandId;
		                return "<img height='30' src=" + str + " />";
		            },
					align: 'center'
		        },
				{
					label: 'website',
					name: 'website',
					width: 250,
					//align: 'center'	
				},
				{
					label: 'bcFunc',
					name: 'bcFunc',
					width: 70,
					align: 'center'	
				},
				{
					label: 'brandShow',
					name: 'brandShow',
					width: 100,
					align: 'center'	
				}
	          
			],
			width: 'auto', // 寬度
			height: 400, // 高度
			shrinkToFit: false,
			rowNum: 10, // 每頁顯示列數
			rownumbers: true, // 第n列
			rownumWidth: 35, // 第n列寬度
			caption: 'Brand Grid View', // 最上方的標題和收合Table
			loadonce: false, // 資料是否只載入一次  --> 設false就無法使用搜尋功能
			viewrecords: true, // 右下角的 1-10 共n條
			pager: '#jqGridPager',
			sortable: false,
			beforeRequest: function () {
                 responsive_jqgrid($(".jqGrid"));
             }
		
		});
		
		// jQuery Grid Navigator
		$('#jqGrid').navGrid('#jqGridPager',
			//設定要出現在jqGridPager的button
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
            //options for the Add Dialog
            {
            	beforeShowForm: function(){
            		$('#editmodjqGrid').remove();
	        		document.location.href="/brands/add";
            	}
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
				width: 300,
				height: 'auto',
	        	modal: true,
	            resize: false,
	        	bClose: 'Close',
	        	recreateForm: true,
	        	closeOnEscape: true,
	        	beforeShowForm: function(){
	        		$('#trv_').remove();
	        	},
			}
		);
		
    	// Change Caption Position (TitleBar)
		$("#jqGrid").closest("div.ui-jqgrid-view")
					.children("div.ui-jqgrid-titlebar")
					.css("text-align", "center");
	});

        
        // jqGrid RWD
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