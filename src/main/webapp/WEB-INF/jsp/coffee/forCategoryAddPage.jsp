<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<
<title>Category AddPage</title>
<script src="/src/jquery-2.2.3.js">
$(function(){
	$("#userform").click(function(){
		
	alert("send2");
	$.ajax({
		type : "POST",
		url : "/coffees/CategoryAdd",
		data : $('#userform').serialize(),
		
		success : function(data) {
			alert("Success");
		},
		error : function(xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		}
	});
	});
});
</script>
<script>

	window.addEventListener("load", init, false);
	var showDiv = document.getElementById("showArea");
	function init() {
		var xhr = new XMLHttpRequest();
		xhr.onloadend = action;
		document.getElementById("send").onclick = send
	}
	
	function send() {
		alert("send");
        var url = "/CategoryAdd";
		xhr.open("post", url, true);
		xhr.send("id="+id+ "&local=" +local+ "&name=" +name+ "&price=" +price+ "&testing=" +testing);
		alert(url);
		//xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		//  xhr.send("id=" + id + "&kind=" + kind + "&level=" + level);
		//xhr.send("id="+id+"&local="+local+"&name="+name+"&price="+price+"&testing="+testing);
		//xhr.send(data);
	}

	function action() {
		alert("get");
		var json = JSON.parse(xhr.responseText);
		alert("json");
		for (var i = 0; i <= json.length; i++) {

			var tr = document.createElement("tr");

			var td1 = document.createElement("td");
			var text1 = document.createTextNode(json[i].id);
			td1.appendChild(text1);
			var td2 = document.createElement("td");
			var text2 = document.createTextNode(json[i].kind);
			td2.appendChild(text2);
			var td3 = document.createElement("td");
			var text3 = document.createTextNode(json[i].level);
			td3.appendChild(text3);

			tr.appendChild(td1);
			tr.appendChild(td2);
			tr.appendChild(td3);

			showDiv.appendChild(tr);

		}
	}


	
</script>
<style>
form {
	border: 1px solid black;
}
</style>
</head>
<body>
	<h1>Category AddPage</h1>
	<form id="userformMain" action="/CategoryAdd" method="post">
		<input type="text" name="id" /><br> <input type="text"
			name="kind" /><br> <input type="text" name="level" /><br>
		<input type="submit" id="send1" />
	</form>
	<div>
		<table id="showArea"></table>
	</div>
	---------------------------------------------
	<form id="userform"  name="uesrform"  method="post">
		<table>
			<tr>
				<td><input type="text" name="id" value="">ID</td>
				<td>${errorMsg.Id}</td>
			</tr>
			<tr>
				<td><input type="text" name="name" value="">名字</td>
				<td>${errorMsg.Name}</td>
			</tr>
			<tr>
				<td><input type="text" name="local" value="">產地</td>
				<td>${errorMsg.Local}</td>
			</tr>
			<tr>
				<td><input type="text" name="price" value="">價錢</td>
				<td>${errorMsg.Price}</td>
			</tr>
			<tr>
				<td><input type="text" name="testing" value="">試用</td>
				<td>${errorMsg.Testing}</td>
			</tr>
		</table>
		<br> <input type="submit" id="send" name="send" />
	</form>
	----------------------------------------------
</body>
</html>