<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="board.dao.BoardDAO"%>

<%
//데이터
String id = request.getParameter("id");

//DB
BoardDAO boardDAO = BoardDAO.getInstance();
boolean exist = boardDAO.isExistId(id); //아이디가 있으면 true - 사용 불가능, 아이디가 없으면 false - 사용 가능
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="" action="checkId.jsp"><!-- 재귀 -->
<%if(exist) {%>
	<h3><%=id %>는 사용 불가능</h3>
	<input type="text" name="id">
	<input type="submit" value="중복체크" onclick="checkId()">
<%}else{ %>
	<h3><%=id %>는 사용 가능</h3>
	<input type="button" value="사용하기" onclick="checkIdClose('<%=id%>')">
<%} %>
<!-- 원하는 아이디를 찾았으면
1. checkId.jsp의 값을 writeForm.jsp의 아이디 입력창에 넣기
2. 비밀번호에 포커스 맞추기
3. 창 닫기
 -->
</form>
<script type="text/javascript">
function checkIdClose(id){
	//var check = 1;
	//opener.writeForm.check.innerHTML = check; 
	opener.writeForm.id.value = id;
	opener.writeForm.pwd.focus();
	opener.writeForm.check.value = 1;
	window.close();
}
</script>
<!-- document.은 해당 jsp에게 해당되는 값일때 사용 , opener사용(열려있는 창) -->
<!-- 
숙제  
1. 중복체크 버튼을 누르지 않은 채로 회원가입 버튼을 누르면
   alert("아이디 중복체크를 완료해야합니다.")
2. 중복체크를 완료하여 아이디를 넣었는데 아이디를 다시 바꿨을 경우 
   회원가입 버튼을 눌렀을 때
   alert("아이디 중복체크를 완료해야합니다.")
   hint - check라는 변수를 잡아서 중복체크 버튼을 누르면 1, 안 눌렀으면 0
          아이디를 다시 변경했다면 중복체크 설정이 다시바뀜?
-->
</body>
</html>