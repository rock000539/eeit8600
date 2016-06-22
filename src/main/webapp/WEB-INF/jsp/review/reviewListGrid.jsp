<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review List</title>


	<!-- Header、NavBar js、css -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/sb-admin-2.js"></script>
	
	<!-- jqGrid js、css -->
    <script src="/js/trirand/i18n/grid.locale-tw.js"></script>
    <script src="/js/trirand/jquery.jqGrid.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
    <link rel="stylesheet" type="text/css" media="screen" href="/css/trirand/ui.jqgrid-bootstrap.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<!-- 一定要放在jqGrid的後面  -->
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


<style>
table{border:3px solid black; 
 	  width:900px;} 

th,td{border:1px solid black; 
 	  text-align:center;} 

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
	                
	                
					<h2>Review List</h2>
					<input type="button" name="add" value="add" onClick="location='/reviews/add'">
					<table>
					<thead align='center'>
						<tr>
							<th>心得id</th>
							<th>會員id</th>
							<th>產品id</th>
							<th>心得標題</th>
							<th>內文</th>
							<th>評分</th>
							<th>圖片</th>			
							<th>發布時間</th>
							<th>收藏數</th>
							<th>flag</th>
						</tr>
					</thead>
					<tbody align='center'>
						<c:forEach var='review' items="${reviews}">
						<tr>
							<td>${review.reviewId}</td>
							<td>${review.memberId}</td>
							<td>${review.prodId}</td>
							<td>${review.reviewTitle}</td>
							<td>${review.review}</td>
							<td>${review.reviewRating}</td>
							<td>${review.reviewImg}</td>
							<td>${review.reviewTime}</td>
							<td>${review.rewCollect}</td>
							<td>${review.reviewShow}</td>
							<td><input type="button" name="edit" value="edit" onClick="location='/reviews/edit?reviewId=${review.reviewId}'"></td>
							<td><input type="button" name="delete" value="delete" onClick="location='/reviews/delete?reviewId=${review.reviewId}'"></td>
						</tr>	
					</c:forEach>
					</tbody>
					</table>
					
					
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
					    width: 100,
					    align: 'center',
					    formatter: 'actions',
					    formatoptions: {
					        keys: true,
					        editbutton : true,
					        delbutton : true,
					        editformbutton: false,
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
						width: 40,
						align: 'center',
						key: true,
					},
					{ 
						label: 'Name',
						name: 'prodName',
						width: 80,
						align: 'center',
					},
					{ 
						label: 'BID', 
						name: 'brandId', 
						width: 40,
						align: 'center',
					},
					{ 
						label: 'CID', 
						name: 'categoryId', 
						width: 40,
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
						label: 'Date', 
						name: 'launchDate', 
						width: 90,
						align: 'center',
					},
					{ 
						label: 'ProdDesc', 
						name: 'prodDesc', 
						width: 80,
						align: 'center',
						hidden: true,
					},
					{ 
						label: 'MainIgdt', 
						name: 'mainIgdt', 
						width: 80,
						align: 'center',
					},
					{ 
						label: 'Concn', 
						name: 'concentration', 
						width: 90,
						align: 'center',
					},
					{ 
						label: 'Img', 
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