<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="board.dao.BoardDAO" %>

<%
//데이터
int pg = Integer.parseInt(request.getParameter("pg"));
int seq = Integer.parseInt(request.getParameter("seq"));
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd"); 

int endNum = pg*5;
int startNum = endNum - 4;


//DB
BoardDAO boardDAO = BoardDAO.getInstance();

BoardDTO boardDTO = boardDAO.boardView(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
color: blue;
}
</style>
</head>
<body>
<form name="boardView" method="post" action="">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th>작성자</th>
				<td maxlength="500" style="width:250px">
					<%= boardDTO.getId() %>
				</td>
			<th>작성일</th>
				<td maxlength="500" style="width:250px" >
					<%= simpleDateFormat.format(boardDTO.getLogtime()) %>
				</td>
			<th>조회수</th>
				<td maxlength="500" style="width:50px">
					<%= boardDTO.getHit() %>
				</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="5"><%= boardDTO.getSubject() %></td>
		<tr>
			<td colspan="6" maxlength="1500" height="400px" style="vertical-align:top">
				<%= boardDTO.getContent() %>
			</td>
		</tr>
	</table>
</form>
</body>
</html>






