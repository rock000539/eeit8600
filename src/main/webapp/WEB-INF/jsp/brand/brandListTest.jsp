<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>BrandList JQGrid</title>
	
	<!-- Header、NavBar js、css -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/sb-admin-2.js"></script>
	
	<!-- jqGrdi js、css -->
    <script type="text/ecmascript" src="/js/trirand/i18n/grid.locale-tw.js"></script>
    <script type="text/ecmascript" src="/js/trirand/jquery.jqGrid.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
    <link rel="stylesheet" type="text/css" media="screen" href="/css/trirand/ui.jqgrid-bootstrap.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<script src="/js/metisMenu.min.js"></script>
	
	<!-- Header、NavBar js、css -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/metisMenu.min.css" rel="stylesheet">
	<link href="/css/sb-admin-2.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/css/bms-customize.css" rel="stylesheet" >
	
	<script>
		$.jgrid.defaults.width = 780;
	</script>
	
</head>
<body>
	
	<!-- 內文全部用wrapper包起來 -->
	<div id="wrapper">
	
	<!-- 加入上方及側邊Nav-Bar -->
	<c:import url="../bms_header.jsp" />
	<c:import url="../bms_navbar-side.jsp" />
	
	<!-- Page Content --> 
	<div id="page-wrapper">
	    <div class="container-fluid">
	        <div class="row">
	            <div class="col-lg-12">
	                <!-- **每頁不同的內容從這裡開始** -->
	                
	                <div id="grid" class="jqGrid" style="margin-top:20px">
					    <table id="jqGrid"></table>
					    <div id="jqGridPager"></div>
					</div>
	                
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
			//對應35行傳回的result
			jsonReader:{
				root:'content',
				page:'number'+1,
				total:'totalPages',
				records:'totalElements',
				repeatitems: false,
			},
			colModel:[
				{
					label:'edit delete',
					name: '',
					width:60,
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
					width: 40,
					align: 'center',
					key: true,											
				},
				{
					label: 'BrandName',
					name: 'brandName',
					width: 80,
					align: 'center',
					//editable:true
				},
				{
					label: 'BrandCName',
					name: 'brandCName',
					width: 80,
					align: 'center'	
				},
				{
					label: 'brandImgPath',
					name: 'brandImg',
					width: 150,
					align: 'center'							
				},
				{
					label: 'Logo',
		            name: '',
		            width: 100,
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
					width: 150,
					align: 'center'	
				},
				{
					label: 'bcFunc',
					name: 'bcFunc',
					width: 80,
					align: 'center'	
				},
				{
					label: 'brandShow',
					name: 'brandShow',
					width: 80,
					align: 'center'	
				}
	          
			],
			width: 'auto', // 寬度
			height: 250, // 高度
			rowNum: 3, // 每頁顯示列數
			rownumbers: true, // 第n列
			rownumWidth: 35, // 第n列寬度
			caption: 'Brand Grid View', // 最上方的標題和收合Table
			loadonce: false, // 資料是否只載入一次  --> 設false就無法使用搜尋功能
			viewrecords: true, // 右下角的 1-10 共n條
			pager: '#jqGridPager',
		
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