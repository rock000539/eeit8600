<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body>


<h1>BookTest</h1>


<form id="theForm" name="myForm">
	<input type="text" name="name" id="name">
	<input type="button" onclick="sendAjax()" value="Send..."/>
</form>

<div>
	Name:<span id="resultname"></span> <br/>
	Price:<span id="resultprice"></span>
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


function sendAjax() {
	
	$.ajax({
		url: '/books/sayHello',
		contentType: 'application/json; charset=utf-8',
		data: JSON.stringify($("#theForm").serializeObject()),
		dataType : 'json',
		type :'post',
		success: function(data) {
			console.log(data);
			
			$("#resultname").text(data.name);
			$("#resultprice").text(data.price);
			
		}
	});
	
	
}
/*
function sendAjax() {
	var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance 
	xmlhttp.open("POST", "/books/sayHello");
	xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xmlhttp.send(JSON.stringify({name:"Happy to learn Java", isbnNo:"AAA-000-1234"}));
}
*/


</script>


</body>
</html>