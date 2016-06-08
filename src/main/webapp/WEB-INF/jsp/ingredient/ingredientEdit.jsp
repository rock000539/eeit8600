<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ingredient editPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.js"></script>
</head>
<body>
	<form>
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="ingredId"
					value="${ingredient.ingredId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>成份</td>
				<td><input type="text" name="ingredName"
					value="${ingredient.ingredName}"></td>
			</tr>
			<tr>
				<td>中文名稱</td>
				<td><input type="text" name="ingredChName"
					value="${ingredient.ingredChName}"></td>
			</tr>
			<tr>
				<td>特性</td>
				<td><input type="text" name="ingredChar"
					value="${ingredient.ingredChar}"></td>
			</tr>
			<tr>
				<td>刺激度</td>
				<td><input type="text" name="ingredIrritant"
					value="${ingredient.ingredIrritant}"></td>
			</tr>
			<tr>
				<td>致粉刺性</td>
				<td><input type="text" name="ingredAcne"
					value="${ingredient.ingredAcne}"></td>
			</tr>
			<tr>
				<td>安心度</td>
				<td><input type="text" name="ingredSafety"
					value="${ingredient.ingredSafety}"></td>
			</tr>
		</table>
		<br>
		<input id="editBtn" type="button" name="update" value="update">
		<input type="button" name="cancel" value="Cancel" onclick='window.location="/ingredients/list"'><br>
		</form>
</body>
<script type="text/javascript">
$(function(){
	$('#editBtn').on('click', function(){
		var data = JSON.stringify($('form').serializeObject());
		console.log(data);
		$.ajax({
			url:"/ingredients/update",
			type:"POST",
			dataType:"application/json",
			data:$('form').serialize(),
			success:function(result){
				console.log(result);
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