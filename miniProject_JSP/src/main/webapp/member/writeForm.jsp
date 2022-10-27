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
<h3>회원가입</h3>
<body>
<form name="writeForm" method="post" action="write.jsp"> <!-- 회원가입은 정보가 나타나는 get말고 post사용 -->
	<table border="1" width = "550" cellpadding="3" cellspacing="0">
		<tr>
			<th width="100" height="30">이름</th>
			<td>
				<input type="text" name = "name" id = "name" maxlength = "5" placeholder = "이름 입력"/>
				<div id="nameDiv"></div>
			</td>
		</tr>
		<tr>
			<th height="30">아이디</th>
			<td>
				<input type="text" name = "id" id = "id" maxlength = "15" onchange="reCheck()" placeholder = "아이디 입력"/>
				<input type="button" value="중복체크" onclick="checkId()" />
			    <input type="hidden" name="check" id="check" value="0" />
			    <!-- 
			    초기에 값을 0을 주고 중복체크를 알림 
			    중복체크를 한다면 값을 1을 주고 중복체크를 하였는데 아이디를 다시 바꾸면 0을 줌(onchange)
			    회원가입 버튼을 누를 때 중복체크 값이 1인지 확인한 후에 1이아닌 0이라면 alert으로 알려줌
			    -->
				<div id="idDiv"></div>
			</td>
		</tr>
		<tr>
			<th height="30">비밀번호</th>
			<td>
				<input type="password" name = "pwd" id = "pwd" maxlength = "15" />
				<div id="pwdDiv"></div>
			</td>
		</tr>
		<tr>
			<th height="30">재확인</th>
			<td>
				<input type="password" name = "repwd" id = "repwd" maxlength = "15" />
				<div id="repwdDiv"></div>
			</td>
		</tr>
		<tr>
			<th height="30">성별</th>
			<td>
				<input type = "radio" name = "gender" id = "gender_m" value = "0" checked/>
				<label for = "gender_m">남</label>
				<input type = "radio" name = "gender" id = "gender_f" value = "1"/>
				<label for = "gender_m">여</label>
			</td>
		</tr>
		<tr>
			<th height="30">이메일</th>
			<td>
				<input type="text" name = "email1" id = "email1" maxlength = "15" style="width:120px;" /> 
				@
				<input type="text" name="email2" id="email2" style="width:120px;">
				<select name="email3" onchange="change()" style="width:120px;">
				   	<option value = "">직접입력</option>
					<option value = "naver.com">naver.com</option>
					<option value = "gmail.com">gmail.com</option>
					<option value = "daum.net">daum.net</option>
				</select>
			</td>
		</tr>
		<tr>
			<th height="30">핸드폰</th>
			<td>
				<select name="tel1" id="tel1" style="width:70px;">
					<option value = "010">010</option>
					<option value = "011">011</option>
					<option value = "019">019</option>
				</select> - 
				<input type="tel" name = "tel2" id = "tel2" maxlength = "4" style="width:70px;" /> - 
				<input type="tel" name = "tel3" id = "tel3" maxlength = "4" style="width:70px;" />
			</td>
		</tr>
		<tr>
			<th height="60">주소</th>
			<td>
				<input type="text" name = "zipcode" id = "zipcode" maxlength = "5" readonly/>
				<input type="button" id = "button" value = "우편번호검색" onclick="checkPost()"><br>
				<input type="text" name = "addr1" id = "addr1" placeholder = "주소" style="width:370px;" readonly/><br>
				<input type="text" name = "addr2" id = "addr2" placeholder = "상세주소" style="width:370px;" />
			</td>
		</tr>
		<tr>
			<th colspan="2" height="20">
				<input type = "button"  value="회원가입" onclick="checkWrite()">
				<button type = "reset" >다시작성</button>
			</th>
		</tr>
	</table>
</form>
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/post.js"></script>
<script src="../js/member.js"></script>
<script>
function reCheck(){
	var c = document.getElementById("check");
	c.value = 0;
}
</script>
</body>
</html>