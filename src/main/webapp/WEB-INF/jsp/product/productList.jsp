<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<script src="/js/jquery.min.js"></script> 
    <script src="/js/trirand/jquery.jqGrid.min.js"></script>
    <script src="/js/trirand/i18n/grid.locale-tw.js"></script>
    
    <!-- BootStrap -->
<!--     <script src="/js/bootstrap.min.js"></script>  -->
<!--     <link rel="stylesheet" href="/css/bootstrap.min.css">  -->
<!--     <link rel="stylesheet" href="/css/trirand/ui.jqgrid-bootstrap.css" /> -->
    
    <!-- jQuery UI -->
    <link rel="stylesheet" href="<c:url value='/css/jquery-ui.min.css'/>" />
	<link rel="stylesheet" href="<c:url value='/css/trirand/ui.jqgrid.css'/>" />
	
	<script>
		$.jgrid.defaults.width = 780;
		$.jgrid.defaults.responsive = true;
	</script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ProductList</title>
</head>
<body>

	<div style="margin-left:20px">
	  	<table id="jqGrid"></table>
	    <div id="jqGridPager"></div>
	</div>

	<script type="text/javascript">
    
	    $(function () {
			
	    	$.ajax({
				url: '/products/select_jqgrid?page=1&rows=10',
				type: 'GET',
				dataType: 'json',
				success:function(response){
					console.log(response);
				}
			});
	    	
	    	// jQuery Grid
			$('#jqGrid').jqGrid({
				url: '/products/select_jqgrid',
				datatype: 'json',
				jsonReader: {
					root: "content",
			      	page: "number"+1, 
			      	total: "totalPages", 
			      	records: "totalElements", 
				    repeatitems: false,
			    },
				colModel: [ // 定義各列的具體格式, 請參考 http://goo.gl/lph9u
					{
						label: '',
					    name: '',
					    width: 60,
					    formatter: 'actions',
					    formatoptions: {
					        keys: true,
					        editbutton : true,
					        delbutton : true,
					        editformbutton: true,
					        // 各項option請參考 http://goo.gl/FV6iq
					        editOptions: {
					            beforeShowForm: function() {
					            	$('#editmodjqGrid').remove();
					            	document.location.href='/products/edit?prodId=' + $('#jqGrid').jqGrid('getGridParam', 'selrow');
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
					        	url: '/products/delete',
					        	ajaxDelOptions: { contentType: 'application/json; charset=utf-8;', dataType: 'json' },
					        	serializeDelData: function(postdata) { return JSON.stringify({ 'prodId': $(this).getRowData(postdata.id).prodId }); },
					        	afterSubmit: function(response) { $("#jqGrid").jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid'); console.log(response); return [true, '', false]; }
					        },
					    }       
					},
					{ 
						label: 'ProdID',
						name: 'prodId',
						width: 50,
						align: 'center',
						key: true,
					},
					{ 
						label: 'ProdName',
						name: 'prodName',
						width: 80,
						align: 'center',
					},
					{ 
						label: 'BrandID', 
						name: 'brandId', 
						width: 60,
						align: 'center',
					},
					{ 
						label: 'CategoryID', 
						name: 'categoryId', 
						width: 70,
						align: 'center',
					},
					{ 
						label: 'Weight', 
						name: 'weight', 
						width: 50,
						align: 'center',
					},
					{ 
						label: 'Score', 
						name: 'score', 
						width: 50,
						align: 'center',
					},
					{ 
						label: 'Price', 
						name: 'price', 
						width: 60,
						align: 'center',
					},
					{ 
						label: 'Capacity', 
						name: 'capacity', 
						width: 60,
						align: 'center',
					},
					{ 
						label: 'LaunchDate', 
						name: 'launchDate', 
						width: 90,
						align: 'center',
					},
					{ 
						label: 'ProdDesc', 
						name: 'prodDesc', 
						width: 80,
						align: 'center',
					},
					{ 
						label: 'MainIgdt', 
						name: 'mainIgdt', 
						width: 80,
						align: 'center',
					},
					{ 
						label: 'Concentration', 
						name: 'concentration', 
						width: 90,
						align: 'center',
					},
					{ 
						label: 'ProdImg', 
						name: 'prodImg', 
						width: 80,
						align: 'center',
					}
				],
				width: 'auto', // 寬度
				height: 250, // 高度
				rowNum: 10, // 每頁顯示列數
				rownumbers: true, // 第n列
				rownumWidth: 35, // 第n列寬度
				caption: 'Products Grid View', // 最上方的標題和收合Table
				loadonce: false, // 資料是否只載入一次
				viewrecords: true, // 右下角的 1-10 共n條
				pager: '#jqGridPager',
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
	        		document.location.href="/products/add";
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
			});
			
	    	// Change Caption Position (TitleBar)
			$("#jqGrid").closest("div.ui-jqgrid-view").children("div.ui-jqgrid-titlebar").css("text-align", "center");
		});
   
   </script>
</body>
</html>