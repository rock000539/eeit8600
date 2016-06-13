<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<script type="text/ecmascript" src="<c:url value='/js/jquery.min.js'/>"></script> 
    <script type="text/ecmascript" src="<c:url value='/js/trirand/jquery.jqGrid.min.js'/>"></script>
    <script type="text/ecmascript" src="<c:url value='/js/trirand/i18n/grid.locale-tw.js'/>"></script>
    
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/css/jquery-ui.min.css'/>" />
	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/css/trirand/ui.jqgrid.css'/>" />
	
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
			
			$('#jqGrid').jqGrid({
				url: '/products/select',
				datatype: 'json',
				colModel: [
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
					        editOptions: {
					            width: 'auto',
					        	height: 'auto',
					            modal: true,
					            resize: false,
					            bSubmit: 'Save',
					            bCancel: 'Cancel',
					            recreateForm: true,
					            closeOnEscape: true,
					            closeAfterEdit: true,
					            reloadAfterSubmit: true,
					            beforeShowForm: function() { $('#prodId').prop('disabled', true); },
					            url: '/products/update',
					            ajaxEditOptions: { contentType: 'application/json; charset=utf-8;', dataType: 'json' },
					            serializeEditData: function(postdata) { return JSON.stringify(postdata); },
					            afterSubmit: function(response) { $("#jqGrid").jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid'); console.log('afterSubmit'); console.log(response); return [true, '', false]; }
					        },
					        delOptions: {
					        	width: 'auto',
					        	height: 'auto',
					        	modal: true,
					            resize: false,
					        	bSubmit: 'Delete',
					        	bCancel: 'Cancel',
					        	closeOnEscape: true,
					        	reloadAfterSubmit: true,
					        	url: '/products/delete',
					        	ajaxDelOptions: { contentType: 'application/json; charset=utf-8;', dataType: 'json' },
					        	serializeDelData: function(postdata) { return JSON.stringify($(this).getRowData(postdata.id)); },
					        	afterSubmit: function(response) { $("#jqGrid").jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid'); console.log('afterSubmit'); console.log('afterSubmit'); console.log(response); return [true, '', false]; }
					        },
					    }       
					},
					{ 
						label: 'ProdID', 
						name: 'prodId', 
						width: 50,
						align: 'center',
						sorttype: 'integer',
						key: true,
						editable: true,
						editrules: { required: true, number: true, },
					},
					{ 
						label: 'ProdName', 
						name: 'prodName', 
						width: 80,
						align: 'center',
						editable: true,
						editoptions: { maxlength: 30 },
					},
					{ 
						label: 'BrandID', 
						name: 'brandId', 
						width: 60,
						align: 'center',
						editable: true,
						editrules: { required: true, number: true, },
					},
					{ 
						label: 'CategoryID', 
						name: 'categoryId', 
						width: 70,
						align: 'center',
						editable: true,
						editrules: { required: true, number: true, },
					},
					{ 
						label: 'Weight', 
						name: 'weight', 
						width: 50,
						align: 'center',
						editable: true,
						editrules: { number: true, },
					},
					{ 
						label: 'Score', 
						name: 'score', 
						width: 50,
						align: 'center',
						editable: true,
						editrules: { number: true, },
					},
					{ 
						label: 'Price', 
						name: 'price', 
						width: 60,
						align: 'center',
						editable: true,
						editrules: { number: true, },
					},
					{ 
						label: 'Capacity', 
						name: 'capacity', 
						width: 60,
						align: 'center',
						editable: true,
						editrules: { number: true, },
					},
					{ 
						label: 'LaunchDate', 
						name: 'launchDate', 
						width: 90,
						align: 'center',
						editable: true,
						editrules: { date: true, },
					},
					{ 
						label: 'ProdDesc', 
						name: 'prodDesc', 
						width: 80,
						align: 'center',
						editable: true,
						editoptions: { maxlength: 100 },
					},
					{ 
						label: 'MainIgdt', 
						name: 'mainIgdt', 
						width: 80,
						align: 'center',
						editable: true,
						editoptions: { maxlength: 100 },
					},
					{ 
						label: 'Concentration', 
						name: 'concentration', 
						width: 90,
						align: 'center',
						editable: true,
						editrules: { number: true, },
					},
					{ 
						label: 'ProdImg', 
						name: 'prodImg', 
						width: 80,
						align: 'center',
						editable: true,
						editoptions: { maxlength: 100 },
					}
				],
				width: 'auto', // 寬度
				height: 250, // 高度
				rowNum: 10, // 每頁顯示列數
				rownumbers: true, // 第n列
				rownumWidth: 35, // 第n列寬度
				caption: 'Products Grid View', // 最上方的標題和收合Table
				loadonce: true, // 資料是否只載入一次
				viewrecords: true, // 右下角的 1-10 共n條
				pager: '#jqGridPager',
			});
			
			$('#jqGrid').navGrid('#jqGridPager', 
			// the buttons to appear on the toolbar of the grid
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
	            width: 'auto',
	        	height: 'auto',
	            modal: true,
	            resize: false,
	            bSubmit: 'Save',
	            bCancel: 'Cancel',
	            recreateForm: true,
	            closeOnEscape: true,
	            closeAfterAdd: true,
	            reloadAfterSubmit: true,
	            beforeShowForm: function() { $('#tr_prodId').empty(); },
	            url: '/products/insert',
	            ajaxEditOptions: { contentType: 'application/json; charset=utf-8;', dataType: 'json' },
	            serializeEditData: function(postdata) { return JSON.stringify(postdata); },
	            afterSubmit: function(response) { $("#jqGrid").jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid'); console.log('afterSubmit'); console.log(response); return [true, '', false]; },
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
			});
		});
   
   </script>
</body>
</html>