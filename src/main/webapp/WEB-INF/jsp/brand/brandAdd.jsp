<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/src/js/jquery.validate.min.js"></script>
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
	$(':text:first').focus();
	$('#theForm').validate({
		onfocusout: function (element) {
	        $(element).valid();
	    },
		rules:{
			brandName:{required:true},
			//brandImg:'required',
			website:{required:true,url:true},
			bcFunc:'required'
		},//end of rules
		messages:{
			brandName:'必填',
			//brandImg:'必填',
			website:{required:'必填',url:'請輸入正確網址格式'},
			bcFunc:'必填'
		},//end of messages
	});
	
	
	$('#save').click(function(){		
		console.log(JSON.stringify($('#theForm').serializeObject()));
		if($('#theForm').validate().form()){
			$.ajax({
				url: '/brands/insert',
				contentType: 'application/json;charset=utf-8',
				//data: JSON.stringify({brandName:'LA MER',website:'http://www.lamer.com.tw/',bcFunc:'elca'}),
				data: JSON.stringify($('#theForm').serializeObject()),
				//data: JSON.stringify('{'+$('#theForm').serializeArray()+'}'),
				dataType: 'json',
				type: 'post',
				success: function(data){
					console.log(data); 
					$(':text').val("");
					$('#true').prop("checked",true);				
					$('h2').text('Insert Success');
					$('#brandName').text('BrandName:'+data.brandName);
					$('#brandImgFile').text('Logo:'+data.brandImgFile);
					$('#website').text('Website:'+data.website);
					$('#bcFunc').text('BatchCodeFunction:'+data.bcFunc);			
					$('#brandShow').text('顯示隱藏:'+data.brandShow);			
				}
			});
		}else{
			alert('請依訊息更正錯誤');
		}
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
	
});

</script>

</body>
</html>