<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="">




</form>

<div id="list"></div>


<script type="text/javascript">

var table = document.getElementById();
var xhr = new XMLHttpRequest();
table.addEventListener("click",function(){
	if(xhr != null){
		xhr.addEventListener("readystatechange", function(){
			if(xhr.readyState == 4)
				if(xhr.status == 200){
					var data = xhr.responseText;
					var jObject = data.parse(datas);
					
					for(var i=0; i<jObject.length; i++){
               	  		
               	  	}
				}
		});
	}
});
xhr.open('get','/movies/jmovie',true);
xhr.send();	

</script>

</body>
</html>