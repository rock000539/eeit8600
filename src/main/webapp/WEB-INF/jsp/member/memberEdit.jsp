<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member editPage</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.js"></script>
<script src="/src/js/jquery.validate.min.js"></script>
<style>
.temp1 {
	border: 1px solid black;
	width: 500px;
}

.temp2 {
	border: 1px solid black;
	align: center;
	background-color: yellow;
}

.error {
	color: red;
}
</style>
</head>
<body>
	<form id="editForm" action="/members/update" method="POST" enctype="multipart/form-data">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="memberId"
					value="${member.memberId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>電子信箱</td>
				<td><input type="text" name="email"
					value="${member.email}"></td>
			</tr>
			<tr>
				<td>暱稱</td>
				<td><input type="text" name="nickname"
					value="${member.nickname}"></td>
			</tr>
			<tr>
				<td>姓</td>
				<td><input type="text" name="lastName"
					value="${member.lastName}"></td>
			</tr>
			<tr>
				<td>名</td>
				<td><input type="text" name="firstName"
					value="${member.firstName}"></td>
			</tr>
			<tr>
				<td>性別</td>
				<td><input type="text" name="gender"
					value="${member.gender}"></td>
			</tr>
			<tr>
				<td>生日</td>
				<td><input type="text" name="birthDay"
					value="${member.birthDay}"></td>
			</tr>
			<tr>
				<td>肌膚性質</td>
				<td><input type="text" name="skinType"
					value="${member.skinType}"></td>
			</tr>
			<tr>
				<td>圖片</td>
				<td><input type="file" name="memberImgFile"
					value=""></td>
			</tr>
			<tr>
				<td>電話</td>
				<td><input type="text" name="phone"
					value="${member.phone}"></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><input type="text" name="addr"
					value="${member.addr}"></td>
			</tr>
			<tr>
				<td>停權</td>
				<td><input type="text" name="memberSuspend"
					value="${member.memberSuspend}"></td>
			</tr>
			<tr>
				<td>停權到期日</td>
				<td><input type="text" name="memberSuspendExp"
					value="${member.memberSuspendExp}"></td>
			</tr>
		</table>
		<div>
			<br> <input type="submit" id="editBtn" name="update"
				value="update">
				 <input type="button" name="cancel"
				value="Cancel" onclick='window.location="/members/list"'><br>
		</div>
	</form>
	<br>
	<div id="resultMsg"></div>
	<div id="data"></div>
</body>
<script type="text/javascript">
/*	$(function() {
		$('#editForm').validate(
			{rules:{
				email:{required:true},
				nickname:{required:true},
				lastName:{required:true},
				firstName:{required:true},
				gender:{required:true},
				birthDay:{required:true},
				skinType:{required:true},
				memberImg:{required:true},
				phone:{required:true},
				addr:{required:true},
				memberSuspend:{required:true},
				memberSuspendExp:{required:true}
			},messages:{
				email:"必填項目",
				nickname:"",
				lastName:"",
				firstName:"",
				gender:"",
				birthDay:"",
				skinType:"",
				memberImg:"",
				phone:"",
				addr:"",
				memberSuspend:"",
				memberSuspendExp:""
			}}
		);

		$('#editBtn').on('click',function() {
			var validate=$('#editForm').validate().form();
			if(validate){
			$.ajax({
				url : "/members/update",
				type : "POST",
				//contentType : 'multipart/form-data',
				//dataType : "json",
				data : $('form').serialize(),
				success : function(result) {
				//$(':text:gt(0)').val(" ");//clear the form except id
				$('#resultMsg').empty().append("<h2>update success</h2>");
				var tb = $('#data').append('<table></table>');
				tb.empty();
				tb.append('<tr align="center"><td>ID</td><td>電子信箱</td><td>暱稱</td><td>姓</td><td>名</td><td>性別</td><td>生日</td><td>肌膚性質</td><td>圖片</td><td>電話</td><td>地址</td><td>停權</td><td>停權到期日</td></tr>');
				var row = $('<tr align="center"></tr>').appendTo(tb);
				$('<td></td>').text(result.memberId).appendTo(row);
				$('<td></td>').text(result.nickname).appendTo(row);
				$('<td></td>').text(result.ingredChName).appendTo(row);
				$('<td></td>').text(result.lastName).appendTo(row);
				$('<td></td>').text(result.firstName).appendTo(row);
				$('<td></td>').text(result.gender).appendTo(row);
				$('<td></td>').text(result.birthDay).appendTo(row);
				$('<td></td>').text(result.skinType).appendTo(row);
				$('<td></td>').text(result.memberImg).appendTo(row);
				$('<td></td>').text(result.phone).appendTo(row);
				$('<td></td>').text(result.addr).appendTo(row);
				$('<td></td>').text(result.memberSuspend).appendTo(row);
				$('<td></td>').text(result.memberSuspendExp).appendTo(row);
				//	$('#data').children().addClass("temp1");
										}
									});
			}else{$('#resultMsg').empty().append("資料格式不正確");}
		});

		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};

	});	*/
</script>
</html>