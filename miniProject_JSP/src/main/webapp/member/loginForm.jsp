<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<h3>로그인</h3>
<body>
<form name="loginForm" method="post" action="login.jsp">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" id="id" maxlength="15" placeholder="아이디 입력"/>
				<div id="idDiv"></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pwd" id="pwd" maxlength="15" placeholder="비밀번호 입력"/>
				<div id="pwdDiv"></div>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type = "button" value="로그인" onclick="checklogin()">
				<input type = "button" value="회원가입" onclick= "location.href = 'writeForm.jsp';">
			</th>
		</tr>
	</table>
</form>
<script type="text/javascript">
function checklogin() {
	document.getElementById("idDiv").innerText="";
	document.getElementById("pwdDiv").innerText="";
	
	if(document.getElementById("id").value == "") {
		document.getElementById("idDiv").innerText="아이디를 입력하세요";
		document.loginForm.id.focus();
	}
	else if(document.getElementById("pwd").value == "") {
		document.getElementById("pwdDiv").innerText="비밀번호를 입력하세요";
		document.loginForm.pwd.focus();
	}
	else
		document.loginForm.submit();
}
</script>
</body>
</html>