<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ingredient addPage</title>
<style type="text/css">
.error{
color:red;
}
</style>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/metisMenu.min.css" rel="stylesheet">
<link href="/css/sb-admin-2.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bms-customize.css" rel="stylesheet" >
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/src/js/jquery.validate.min.js"></script>

<script type="text/javascript">
	$(function() {	
		var validate= $('#Addform').validate({rules:
		{
			ingredName:{required:true},
			ingredChar:{required:true},
			ingredIrritant:{digits:true},
			ingredAcne:{digits:true},
			ingredSafety:{digits:true}
			},
	messages:{
		ingredName:"必填項目",
		ingredChName:"必填項目",
		ingredChar:"必填項目",
		ingredIrritant:"必須為數字",
		ingredAcne:"必須為數字",
		ingredSafety:"必須為數字"}
		});
		
		$('#insert').click(function(){})
		
	}); //onload end

</script>
</head>
<body>
<div id="wrapper">

<c:import url="../bms_header.jsp" />
<c:import url="../bms_navbar-side.jsp" />

<!-- Page Content --> 
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Ingredient Add</h1>
                
	<form id='Addform'>
	<fieldset>
		<table>
			<tr>
				<td>成分</td>
				<td><input type="text" name="ingredName"
					value="${ingredient.ingredName}"></td>
				<td><label for='ingredName' class='error'></label></td>
			</tr>
			<tr>
				<td>中文名稱</td>
				<td><input type="text" name="ingredChName"
					value="${ingredient.ingredChName}"></td>
				<td><label for='ingredChName' class='error'></label></td>
			</tr>
			<tr>
				<td>特性</td>
				<td><input type="text" name="ingredChar"
					value="${ingredient.ingredChar}"></td>
				<td><label for='ingredChar' class='error'></label></td>
			</tr>
			<tr>
				<td>刺激度</td>
				<td><input type="text" name="ingredIrritant"
					value="${ingredient.ingredIrritant}"></td>
				<td><label for='ingredIrritant' class='error'></label></td>
			</tr>
			<tr>
				<td>致粉刺性</td>
				<td><input type="text" name="ingredAcne" 
					value="${ingredient.ingredAcne}" ></td>
				<td><label for='ingredAcne' class='error'></label></td>
			</tr>
			<tr>
				<td>安心度</td>
				<td><input type="text" name="ingredSafety"
					value="${ingredient.ingredSafety}"></td>
				<td><label for='ingredSafety' class='error'></label></td>
			</tr>
		</table>
		<br> <input type="button" name="insert" value="insert" id="insert"> 
			<input type="button" name="cancel"
			value="Cancel" onclick='window.location="/ingredients/list"'><br>
	</fieldset>
	</form>
	
	
	<div id="resultMsg"></div>
	<div id="data"></div>
	
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


<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/metisMenu.min.js"></script>
<script src="/js/sb-admin-2.js"></script>

<script type="text/javascript">
$(function(){
	$('#insert').click(function(){
		var validate=$('#Addform').validate().form();
		var data = JSON.stringify($('form').serializeObject());
		console.log(data);
		if(validate){
		
		$.ajax({
			url:'/ingredients/insert',
			type:"POST",
			contentType: 'application/json; charset=utf-8',
			dataType:"json",
			data:JSON.stringify($('form').serializeObject()),
			success:function(result){
				$(':text').val(" ");
				$('#resultMsg').empty().append("<h2>insert success</h2>");
				var tb = $('#data').append('<table></table>');
				tb.empty();
				tb.append('<tr align="center"><td>ID</td><td>成份</td><td>中文名稱</td><td>特性</td><td>刺激度</td><td>致粉刺性</td><td>安心度</td></tr>');
				var row = $('<tr align="center"></tr>').appendTo(tb);
				$('<td></td>').text(result.ingredId).appendTo(row);
				$('<td></td>').text(result.ingredName).appendTo(row);
				$('<td></td>').text(result.ingredChName).appendTo(row);
				$('<td></td>').text(result.ingredChar).appendTo(row);
				$('<td></td>').text(result.ingredIrritant).appendTo(row);
				$('<td></td>').text(result.ingredAcne).appendTo(row);
				$('<td></td>').text(result.ingredSafety).appendTo(row);
			}
		});
		}//end of if
		else{
			alert("資料輸入錯誤");
		}
	});
	
	$.fn.serializeObject = function() {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name]) {
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