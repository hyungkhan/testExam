<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	//데이터
	request.setCharacterEncoding("UTF-8");//post 방식에만
	String name = (String)session.getAttribute("memName");
	String id = (String)session.getAttribute("memId");
	String email = (String)session.getAttribute("memEmail");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String write = null;
	
	BoardDTO boardDTO = new BoardDTO();	
	boardDTO.setName(name);
	boardDTO.setId(id);
	boardDTO.setEmail(email);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	
	Map<String, String> map = new HashMap<String, String>();
	map.put("id", id);
	map.put("name", name);
	map.put("email", email);
	map.put("subject", subject);
	map.put("content", content);
	
	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();//싱글톤
	int num = boardDAO.boardWrite(map);

	//응답
	%>
	<input type="button" value="메인화면" onclick="location.href='../index.jsp'">
	<!-- 뒤로가기 - history.go(-1) -->
	<script type="text/javascript">
	window.onload=function(){
		alert("작성하신 글을 저장하였습니다.");
		location.href="../index.jsp";
	}
	</script>
</body>
</html>