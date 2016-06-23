<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ProductList</title>
	
	<!-- Header、NavBar js -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/sb-admin-2.js"></script>
	
	<!-- jqGrid js、css -->
    <script src="/js/trirand/i18n/grid.locale-tw.js"></script>
    <script src="/js/trirand/jquery.jqGrid.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
	
	<!-- 一定要放在jqGrid的js後面  -->
	<script src="/js/metisMenu.min.js"></script>
	
	<!-- Header、NavBar css -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/metisMenu.min.css" rel="stylesheet">
	<link href="/css/sb-admin-2.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/bms-customize.css" rel="stylesheet" >
	
	<!-- 一定要放在Header、NavBar css的後面  -->
    <link rel="stylesheet" href="/css/trirand/ui.jqgrid-bootstrap.css" />
	
	<script>
		$.jgrid.defaults.width = 780;
	</script>
	
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
    
        $(function () {
			
            $("#jqGrid").jqGrid({
                url: '/products/select_jqgrid',
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
					    width: 75,
					    align: 'center',
					    resizable: false,
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
						label: 'ID',
						name: 'prodId',
						width: 50,
						align: 'center',
						resizable: false,
						key: true,
					},
					{ 
						label: 'Name',
						name: 'prodName',
						width: 80,
						align: 'center',
						resizable: false,
					},
					{ 
						label: 'BID', 
						name: 'brandId', 
						width: 50,
						align: 'center',
						resizable: false,
					},
					{ 
						label: 'CID', 
						name: 'categoryId', 
						width: 50,
						align: 'center',
						resizable: false,
					},
					{ 
						label: 'Weight', 
						name: 'weight', 
						width: 70,
						align: 'center',
						resizable: false,
					},
					{ 
						label: 'Score', 
						name: 'score', 
						width: 70,
						align: 'center',
						resizable: false,
					},
					{ 
						label: 'Price', 
						name: 'price', 
						width: 70,
						align: 'center',
						resizable: false,
					},
					{ 
						label: 'Capacity', 
						name: 'capacity', 
						width: 90,
						align: 'center',
						resizable: false,
					},
					{ 
						label: 'Date', 
						name: 'launchDate', 
						width: 100,
						align: 'center',
						resizable: false,
					},
					{ 
						label: 'ProdDesc', 
						name: 'prodDesc', 
						width: 100,
						align: 'center',
					},
					{ 
						label: 'MainIgdt', 
						name: 'mainIgdt', 
						width: 80,
						align: 'center',
						resizable: false,
					},
					{ 
						label: 'Concn', 
						name: 'concentration', 
						width: 90,
						align: 'center',
						resizable: false,
					},
					{ 
						label: 'Img', 
						name: 'prodImg', 
						width: 150,
						align: 'center',
						resizable: false,
					}
                ],
                width: 'auto', // 寬度
				height: 380, // 高度
				shrinkToFit: false,
				rowNum: 10, // 每頁顯示列數
				rownumbers: true, // 第n列
				rownumWidth: 35, // 第n列寬度
				caption: 'Products Grid View', // 最上方的標題和收合Table
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