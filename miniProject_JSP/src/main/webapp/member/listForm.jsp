<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="board.bean.BoardPaging" %>

<%
//데이터
int pg = Integer.parseInt(request.getParameter("pg"));
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd"); 

//페이징 처리 - 1페이지당 5개씩
int endNum = pg*5;
int startNum = endNum - 4;

//DB
BoardDAO boardDAO = BoardDAO.getInstance();

Map<String, Integer> map = new HashMap<String, Integer>();//Map<키값, 값(오브젝트로 보통 사용)>은 인터페이스, HashMap이 Map에게 추상메소드를 overriding해준다.
map.put("startNum", startNum);
map.put("endNum", endNum);

List<BoardDTO> boardList = boardDAO.boardPrint(map);

//페이징 처리
int totalA = boardDAO.getTotalA();//총 글수
int totalPage = (totalA + 4) / 5;


BoardPaging boardPaging = new BoardPaging();
boardPaging.setCurrentPage(pg);
boardPaging.setPageBlock(3);
boardPaging.setPageSize(5);
boardPaging.setTotalA(totalA);
boardPaging.makePagingHTML();

//응답
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
pre {
	white-space:pre-wrap;
}/*자동줄바꿈+입력된 값 그대로 보여주는 태그*/
#pagingDiv{ 
	text-align:center;
	width: 950px;
	margin-top:10px;
	display: inline-block;
}
#currentPaging { /* 해시태그 = id로 설정한 값들에게 style 설정*/
    
    border: 1px solid blue; 
	padding: 5px 10px;
	margin: 2px;
	background:lightGreen;
	color:blue;
	text-decoration: underline;
	cursor:pointer;
}
#paging {
	cursor: pointer;
	padding: 5px 10px;
	margin: 2px;
}
.subjectA:hover {
  text-decoration: underline;
  color:hotpink;
}
</style>
</head>
<body>
<% if(boardList != null){ %>

		<table border="1" cellpadding="5" cellspacing="0" frame="hsides" rules="rows" bordercolor="blue">
			<tr>		
				<th style="width:100px">글번호</th>
				<th style="width:400px">제목</th>
				<th style="width:100px">작성자</th>
				<th style="width:100px">조회수</th>
				<th style="width:100px">작성일</th>
			</tr>
		<%for(BoardDTO boardDTO : boardList) { %>
			<tr>
				<td>
					<%= boardDTO.getSeq() %><!-- ArrayList 안에 i번째 인덱스의 DTO에서 이름을 가져오겠다 -->
				</td>
				<td class="subjectA" onclick="isLogin(<%=pg%>,<%= boardDTO.getSeq() %>)">
					<%= boardDTO.getSubject() %>
				</td>
				<td>
					<%= boardDTO.getId() %>
				</td>
				<td>
					<%= boardDTO.getHit() %>
				</td>
				<td>
					<%= simpleDateFormat.format(boardDTO.getLogtime()) %>
				</td>
			</tr>
		<%} %><!-- for -->
		</table>
		<input type ="button" value="메인화면" onclick="location.href='../index.jsp'">
		<div id="pagingDiv"><%=boardPaging.getPagingHTML()%></div>
	<%} %><!-- if(list가 정상적으로 왔다면 실행) -->
	<!-- 페이지 번호 -->
<script type="text/javascript">
function boardPaging(pg){
	location.href = "listForm.jsp?pg="+pg;
}
function isLogin(pg,seq){
	if('<%=(String)session.getAttribute("memId")%>' == 'null'){
		alert("먼저 로그인하세요");
		location.href="http://localhost:8080/miniProject_JSP/member/loginForm.jsp";
	}else{
		location.href="http://localhost:8080/miniProject_JSP/board/boardView.jsp?pg="+pg+"&seq="+seq;
	}
}
</script>
</body>
</html>