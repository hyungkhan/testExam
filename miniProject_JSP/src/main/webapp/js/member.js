function checkWrite(){
	document.getElementById("nameDiv").innerText="";
	document.getElementById("idDiv").innerText="";
	document.getElementById("pwdDiv").innerText="";
	document.getElementById("repwdDiv").innerText="";
	
		
	if(document.getElementById("name").value == "")
		document.getElementById("nameDiv").innerText="이름을 입력하세요";
		
	else if(document.getElementById("id").value == "")
		document.getElementById("idDiv").innerText="아이디를 입력하세요";
		
	else if(document.getElementById("check").value == 0)
		alert("아이디 중복체크를 완료해야합니다.");
		
	else if(document.getElementById("pwd").value == "")
		document.getElementById("pwdDiv").innerText="비밀번호를 입력하세요";
		
	else if(document.getElementById("repwd").value == "")
		document.getElementById("repwdDiv").innerText="재확인 비밀번호를 입력하세요";
		
	else if(document.getElementById("repwd").value != document.getElementById("pwd").value)
		document.getElementById("repwdDiv").innerText="비밀번호가 맞지 않습니다";
			
	else
		document.writeForm.submit();
}
function change(){
	document.writeForm.email2.value = document.writeForm.email3.value;
}
function checkId(){
	//자료형 - var, let, const
	var sId = document.getElementById("id").value
	if(sId == "") {
		//document.getElementById("idDiv").innerText = "먼저 아이디를 입력하세요";
		document.getElementById("idDiv").innerHTML="<font color='magenta'>먼저 아이디를 입력하세요</font>";
	}else
		window.open("checkId.jsp?id=" + sId,"checkId","width=400 height=150 left=700 top=200");
		//팝업창(checkId - 같은 창은 두번 이상 안 열림)
}