<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Brand AddPage</title>
	
	<!-- Header, NavBar -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/metisMenu.min.css" rel="stylesheet">
	<link href="/css/sb-admin-2.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/css/bms-customize.css" rel="stylesheet" >
	
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/sb-admin-2.js"></script>
	
	<!-- BootStrap 基本檔案  -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<!-- 表單驗證  -->
	<script 
		src="/js/jquery.validate.min.js"></script>
	
	<!-- DatePicker -->
	<link rel="stylesheet" 
		href="/css/bootstrap-datetimepicker.min.css" />
    <script
    	src="/js/bootstrap-datetimepicker.min.js"></script>
    <script
    	src="/js/trirand/i18n/bootstrap-datetimepicker.zh-TW.js"></script>
    
    <!-- Dialog -->
    <link rel="stylesheet" 
		href="/css/bootstrap-dialog.min.css" />
    <script
    	src="/js/bootstrap-dialog.min.js"></script>
    	
    <!-- FileInput -->
    <link href="/css/fileinput.min.css" media="all" rel="stylesheet" />
    <script src="/js/fileinput.min.js"></script>
    
    <script src="/js/metisMenu.min.js"></script>
    <!-- <script src="/src/js/jquery.ui.widget.js"></script> -->
	<!-- <script src="/src/js/jquery.iframe-transport.js"></script> -->
	<!-- <script src="/src/js/jquery.fileupload.js"></script> -->
	
	<style>
		.col-md-6 {
			margin-top: 20px;
		}
		.error {
			color: red;
			font-style: italic;
		}
		input.error {
			border: 1px red solid;
		}
		.panel {
			margin-top: 20px;
		}
		textarea {
		    resize: none;
		}
	</style>
	
</head>

</head>
<body>
<!-- 內文全部用wrapper包起來 -->
<div id="wrapper">

<!-- 加入上方及側邊Nav-Bar -->	
<c:import url="../bms_header.jsp" />
<c:import url="../bms_navbar-side.jsp" />
<!-- ?? url有沒有更好的寫法 ?? -->


<!-- Page Content --> 
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Brand EditPage</h1>   <!-- **內文中的標題，請修改** -->
                <!-- **每頁不同的內容從這裡開始** -->
                
<FORM id="editForm"  enctype="multipart/form-data" >
	<TABLE>
		<TR>
			<TD>ID：</TD>
			<TD><input type="text" name="brandId" value="${brand.brandId}" readonly='readonly' /></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>品牌：</TD>
			<TD><input type="text" name="brandName" value="${brand.brandName}" class="required" title="請輸入品牌名稱" /></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>品牌(中文名)：</TD>
			<TD><input type="text" name="brandCName" value="${brand.brandCName}" /></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>LOGOPATH：</TD>
			<TD><input type="text" name="brandImg" value="${brand.brandImg}" readonly='readonly' /></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>LOGO：</TD>
			<TD>
			<img name="brandImgFile" height="100" src="/brands/show?brandId=${brand.brandId}"/><br/>
			<input type="file" name="brandImgFile" id="brandImgFile" accept="image/*" /></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>官網：</TD>
			<TD><input type="text" name="website" value="${brand.website}" /></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>批號公式：</TD>
			<TD><input type="text" name="bcFunc" value="${brand.bcFunc}" /></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>顯示隱藏：</TD>
			<TD><input type="radio" name="brandShow" id="true" value="true"/>顯示
				<input type="radio" name="brandShow" id="false" value="false" />隱藏			
			</TD>
			<TD><input type="hidden" id="brandShowStatus" value="${brand.brandShow}"/></TD>
	</TABLE>
<input type="button" name="save" value="save" id="save"/>
<input type="button" name="cancel" value="cancel" onclick="location='/brands/list'" />
</FORM>

<div id='result'>
<h2></h2>
<span id="brandName"></span><br/>
<span id="brandCName"></span><br/>
<span id="brandImg"></span><br/>
<span id="website"></span><br/>
<span id="bcFunc"></span><br/>
<span id="brandShow"></span><br/>
<img name="brandImgFile" width="100">
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
	$('#'+$('#brandShowStatus').val()).attr("checked",true);
	
	// 驗證表單資料
	$('#editForm').validate({
		onfocusout: function(element){
			$(element).valid();
		},
		rules:{
			brandName:{required:true},
			website:{required:true,url:true},
			bcFunc:'required'
		},//end of rules
		messages:{
			brandName:'必填',
			website:{required:'必填',url:'請輸入正確網址格式'},
			bcFunc:'必填'
		},//end of messages	
	});
	
	
	$('#save').click(function(){
		//console.log($('#brandImgFile').prop('files')[0]);
		//console.log(typeof($('#brandImgFile').prop('files')[0])=='undefined');
		
		//if表單驗證通過(true)	
		if($('#editForm').validate().form()){
			
			//create一個空的FormData
			var formData = new FormData();
			console.log(formData)
			
			//append表單資料
			//type=file
			formData.append("brandImgFile", $('#brandImgFile').prop('files')[0]);
			
			//type=text--> now Blob ([表單序列化] , {設定格式為json})
			formData.append("brand", 
					new Blob([JSON.stringify($("#editForm").serializeObject())],
							{type:'application/json'}));
			
			$.ajax({
				url:'/brands/update',
				type:'post',
				//contentType 和 processData都要設為false
				contentType: false,
				processData: false,
				data:formData,
				dataType:'json',
				success:function(data){
					console.log(data);
					$('#result>h2').text('Update Success');
					$('#brandName').text('BrandName:'+data.brandName);
					$('#brandCName').text('BrandName(中文):'+data.brandCName);
					$('#brandImg').text('LogoPath:'+data.brandImg);
					$('#website').text('Website:'+data.website);
					$('#bcFunc').text('BatchCodeFunction:'+data.bcFunc);			
					$('#brandShow').text('顯示隱藏:'+data.brandShow);
					//避免圖片被cache, 在圖片src後面加上"時間"
					var d = new Date();
					$('img[name="brandImgFile"]').attr('src','/brands/show?brandId='+data.brandId+'&'+d.getTime());					
				}
			});
		}else{
			alert('請依訊息更正錯誤');
		}
	})	
	
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
	
})

</script>
</body>
</html>