<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<title>Brand Add</title>
</head>
<body>
<FORM id="theForm" name="" action="/brands/insert" method="post" enctype="multipart/form-data">
	<TABLE>
		<TR>
			<TD>品牌：</TD>
			<TD><input type="text" name="brandName" value="${param.brandName}" /></TD>
			<TD style="color:red"></TD>
		</TR>
<!-- 		<TR> -->
<!-- 			<TD>LOGO：</TD> -->
<!-- 			<TD><input type="file" name="brandLogo" /></TD> -->
<!-- 			<TD style="color:red"></TD> -->
<!-- 		</TR> -->
		<TR>
			<TD>官網：</TD>
			<TD><input type="text" name="website" value="${param.website}" /></TD>
			<TD style="color:red"></TD>
		</TR>
		<TR>
			<TD>批號公式：</TD>
			<TD><input type="text" name="bcFunc" value="${param.bcFunc}" /></TD>
			<TD style="color:red"></TD>
		</TR>
	</TABLE>
<input type="submit" name="save" value="save">
<input type="button" name="cancel" value="cancel" onclick="location='/brands/list'" />

<input type="button" onclick="sendAjax()" value="send"/>

<div>
BrandName:<span id="brandName"></span><br/>
Website:<span id="website"></span><br/>
BatchCodeFunction:<span id="bcFunc"></span>
</div>

<script>

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

function sendAjax(){
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
			$('#brandName').text(data.brandName);
			$('#website').text(data.website);
			$('#bcFunc').text(data.bcFunc);			
		}
	});
	
}

</script>
</FORM>

</body>
</html>