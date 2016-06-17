<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/src/js/jquery.validate.min.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<!-- <script src="/src/js/jquery.ui.widget.js"></script> -->
<!-- <script src="/src/js/jquery.iframe-transport.js"></script> -->
<!-- <script src="/src/js/jquery.fileupload.js"></script> -->
<title>Brand AddPage</title>
<style>
.error {
	color: red;
	font-style: italic;
}

input.error {
	border: 1px red solid;
}
</style>
</head>
<body>
<h1>AddPage By JSON</h1>
<FORM id="theForm" enctype="multipart/form-data">
	<TABLE>
		<TR>
			<TD>品牌：</TD>
			<TD><input type="text" name="brandName" value="${param.brandName}" class="required" title="請輸入品牌名稱" /></TD>
			<TD></TD>
		</TR>
<!-- 		<TR> -->
<!-- 			<TD>LOGO：</TD> -->
<!-- 			<TD><input type="text" name="brandImg" /></TD> -->
<!-- 			<TD></TD> -->
<!-- 		</TR> -->
		<TR>
			<TD>LOGO：</TD>
			<TD><input type="file" name="brandImgFile" id="brandImgFile" accept="image/*"/></TD>
			<TD><input type="button" id="start" value="開始上傳" /></TD>
		</TR>
		<TR>
			<TD>官網：</TD>
			<TD><input type="text" name="website" value="${param.website}" /></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>批號公式：</TD>
			<TD><input type="text" name="bcFunc" value="${param.bcFunc}" /></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>顯示隱藏：</TD>
			<TD><input type="radio" name="brandShow" id="true" value="true" checked="checked"/>顯示
				<input type="radio" name="brandShow" id="false" value="false" />隱藏			
			</TD>
			<TD></TD>
		</TR>
	</TABLE>
<input type="button" name="save" value="save" id="save"/>
<input type="button" name="cancel" value="cancel" onclick="location='/brands/list'" />
</FORM>

<div id='result'>
<h2></h2>
<span id="brandName"></span><br/>
<span id="brandImgFile"></span><br/>
<span id="website"></span><br/>
<span id="bcFunc"></span><br/>
<span id="brandShow"></span>
</div>

<script>
$(function(){
	$('#save').click(function(){
		console.log($('#brandImgFile').prop('files')[0]);
		console.log('serializeObject--->'+$('#theForm').serializeObject());
		console.log('JSON--->'+JSON.stringify($('#theForm').serializeObject()));
		console.log('new Blob--->'+new Blob([JSON.stringify($('#theForm').serializeObject())]));
		            //$('#brandImgFile').prop('files')[0]
		var formData = new FormData();
		formData.append('brandImgFile',$('#brandImgFile').prop('files')[0]);
		formData.append('brandJsonStr',JSON.stringify($('#theForm').serializeObject()));
		//formData.append('filename',$('#filename').val());
		//formData.append('brand',$('#theForm').serializeObject());
		//formData.append('brand',new Blob([JSON.stringify($('#theForm').serializeObject())]));
		$.ajax({
			url:'/brands/insert2',
			type:'post',
			contentType: false,
			processData: false,
			data:formData,
			success:function(data){
				console.log(data);
				$('h2').text('Update Success');
				$('#brandName').text('BrandName:'+data.brandName);
				$('#brandImg').text('Logo:'+data.brandImg);
				$('#website').text('Website:'+data.website);
				$('#bcFunc').text('BatchCodeFunction:'+data.bcFunc);			
				$('#brandShow').text('顯示隱藏:'+data.brandShow);
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

	
	
})

</script>

</body>
</html>