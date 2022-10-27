<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "board.bean.BoardDTO"%>   
<%@ page import= "board.dao.BoardDAO"%>
<%@ page import= "java.util.Map"%>
<%@ page import= "java.util.HashMap"%>
<%@ page import= "member.bean.MemberDTO"%>   
    
<%
//데이터
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String userName = null;
String userId = null;
String userEmail = null;

//DB
BoardDAO boardDAO = BoardDAO.getInstance(); //DB는 싱글톤(static으로 생성 후에 클래스에서 주소값만 받아옴) 
Map<String, String> map = new HashMap<String, String>();
map.put("id", id);
map.put("pwd", pwd);
MemberDTO memberDTO = boardDAO.boardLogin(map);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(memberDTO != null){
	session.setAttribute("memId", memberDTO.getId());
	session.setAttribute("memName", memberDTO.getName());
	session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
	response.sendRedirect("loginOk.jsp");
}else{
	response.sendRedirect("loginFail.jsp");
}%>
</body>
</html>