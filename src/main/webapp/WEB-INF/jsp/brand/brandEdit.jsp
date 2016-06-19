<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/src/js/jquery.validate.min.js"></script>
<title>Brand EditPage</title>
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
<h1>Brand EditPage</h1>
<FORM id="editForm"  enctype="multipart/form-data">
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
			<TD>LOGOPATH：</TD>
			<TD><input type="text" name="brandImg" value="${brand.brandImg}" readonly='readonly' /></TD>
			<TD></TD>
		</TR>
		<TR>
			<TD>LOGO：</TD>
			<TD>
<%-- 			<img id="imgShow" height="100" src="/brands/show?brandId=${brand.brandId}"/><br/> --%>
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
<span id="brandImg"></span><br/>
<span id="website"></span><br/>
<span id="bcFunc"></span><br/>
<span id="brandShow"></span><br/>
<img name="brandImgFile" width="100">
</div>

</body>
<script type="text/javascript">
$(function(){
	$('#'+$('#brandShowStatus').val()).attr("checked",true);
	
	$('#editForm').validate({
		onfocusout: function(element){
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
		//console.log($('#brandImgFile').prop('files')[0]);
		//console.log(typeof($('#brandImgFile').prop('files')[0])=='undefined');
		if($('#editForm').validate().form()){
			var formData = new FormData();
			var brandImgFile= $('#brandImgFile').prop('files')[0];
			
			//console.log(typeof(brandImgFile)!='undefined');
			//if(typeof(brandImgFile)!='undefined'){
				formData.append("brandImgFile", brandImgFile);
			//}
// 			else{
// 				formData.append("brandImgFile", null);
// 		    }
			formData.append("brand", 
					new Blob([JSON.stringify($("#editForm").serializeObject())],
							{type:'application/json'}));
			
			$.ajax({
				url:'/brands/update',
				type:'post',
				contentType: false,
				processData: false,
				data:formData,
				dataType:'json',
				success:function(data){
					console.log(data);
					$('#result>h2').text('Update Success');
					$('#brandName').text('BrandName:'+data.brandName);
					$('#brandImg').text('Logo:'+data.brandImg);
					$('#website').text('Website:'+data.website);
					$('#bcFunc').text('BatchCodeFunction:'+data.bcFunc);			
					$('#brandShow').text('顯示隱藏:'+data.brandShow);
					$('img[name="brandImgFile"]').removeAttr('src').attr('src','/brands/show?brandId='+data.brandId);
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
</html>