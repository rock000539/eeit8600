<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ingredient addPage</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		$('#ADDbutton').click(function() {
			var ingredId = $('input[name*="ingredId"]').val();
			var ingredName = $('input[name*="ingredName"]').val();
			var ingredChName = $('input[name*="ingredChName"]').val();
			var ingredChar = $('input[name*="ingredChar"]').val();
			var ingredIrritant = $('input[name*="ingredIrritant"]').val();
			var ingredAcne = $('input[name*="ingredAcne"]').val();
			var ingredSafety = $('input[name*="ingredSafety"]').val();
			alert("postAdd");
			$.post('src/main/java/tw/com/softleader/eeit8600/product/web/IngredientAddController.java', {
				'ingredId' : ingredId,
				'ingredName' : ingredName,
				'ingredChName' : ingredChName,
				'ingredChar' : ingredChar,
				'ingredIrritant' : ingredIrritant,
				'ingredAcne' : ingredAcne,
				'ingredSafety' : ingredSafety
			}, function(backdata) {
				alert("postAdd back");
				
				$('#show').html("<td>"+backdata+"<td>");
				
			})//success function end
		})//button click end

	}); //onload end
</script>
</head>
<body>
	<form>
		<table>
			<tr>
				<td>成分</td>
				<td><input type="text" name="ingredName"
					value="${ingredient.ingredName}"></td>
				<td>${errorMsg.ingredName}</td>
			</tr>
			<tr>
				<td>中文名稱</td>
				<td><input type="text" name="ingredChName"
					value="${ingredient.ingredChName}"></td>
				<td>${errorMsg.ingredChName}</td>
			</tr>
			<tr>
				<td>特性</td>
				<td><input type="text" name="ingredChar"
					value="${ingredient.ingredChar}"></td>
				<td>${errorMsg.ingredChar}</td>
			</tr>
			<tr>
				<td>刺激度</td>
				<td><input type="text" name="ingredIrritant"
					value="${ingredient.ingredIrritant}"></td>
				<td>${errorMsg.ingredIrritant}</td>
			</tr>
			<tr>
				<td>致粉刺性</td>
				<td><input type="text" name="ingredAcne"
					value="${ingredient.ingredAcne}"></td>
				<td>${errorMsg.ingredAcne}</td>
			</tr>
			<tr>
				<td>安心度</td>
				<td><input type="text" name="ingredSafety"
					value="${ingredient.ingredSafety}"></td>
				<td>${errorMsg.ingredSafety}</td>
			</tr>
		</table>
		<br>
		<input type="button" name="insert" value="insert" id="insert">
		<input type="button" name="cancel" value="Cancel"
			onclick='window.location="/ingredients/list"'><br>
	</form>
<div id="resultMsg"></div>
<div id="data"></div>
</body>
<script type="text/javascript">
$(function(){
	$('#insert').click(function(){
		var data = JSON.stringify($('form').serializeObject());
		console.log(data);
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

</html>