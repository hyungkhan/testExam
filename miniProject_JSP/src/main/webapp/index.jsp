<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
//String name = request.getParameter("name");
//세션에 삽입된 값을 가져온다
String name = (String)session.getAttribute("memName");
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>메인화면</h3>
<hr>
<h5>
<%if((String)session.getAttribute("memId") != null){%><!-- 세션이 없으면 -->
	<h3><%=name %>님 환영합니다</h3><br>
	<a href="http://localhost:8080/miniProject_JSP/member/logoutForm.jsp">로그아웃</a><br>
	<a href="http://localhost:8080/miniProject_JSP/board/boardWriteForm.jsp">글쓰기</a><br>
	<a href="http://localhost:8080/miniProject_JSP/member/listForm.jsp?pg=1">목록</a><br>
<%}else{%>
	<a href="http://localhost:8080/miniProject_JSP/member/writeForm.jsp">회원가입</a><br>
	<a href="http://localhost:8080/miniProject_JSP/member/loginForm.jsp">로그인</a><br>
	<a href="http://localhost:8080/miniProject_JSP/member/listForm.jsp?pg=1">목록</a><br>
<%}%>
</h5>
</body>
</html>
<!-- 
목록을 만들어 - 한 페이지당 5개씩
글번호 제목 작성자 작성일 조회수 
1. 작성자는 id로 가져와
2. 한 페이지당 5개씩 가져온다
3. 작성일은 yyyy.mm.dd
4. 최신먼저
5. 번호는 굳이 안해도 됨
-->
<!-- 
숙제
회원가입 o - 로그아웃 x
로그인이 되어있는 상태 - 로그아웃 o

1.
세선이 있다면 -> 로그아웃/글쓰기(방명록 참고)
세션이 없다면 -> 회원가입/로그인
if조건으로 구분
목록은 공통으로 뜨고, 세션이 있는지봐서 로그인 해라 물어봐
member.jsp로 참고

2.
세션 등록할 때(로그인을 성공한다면)
memId
memName
memEmail = ~~@~~.com <- email1 email2 합쳐야해
글쓰기까지만 작성하면 끝~

3. 
글쓰기
Folder : board
file : boardWriteForm.jsp
	   boardWrite.jsp

package : board.dao
class : BoardDAO.java
		boardMapper.xml
		
package : board.bean
	      BoardDTO.java
	      
이거는 완전 새로작성

테이블
CREATE TABLE board(
     seq NUMBER NOT NULL,               -- 글번호 (시퀀스 객체 이용)
     id VARCHAR2(20) NOT NULL,           -- 아이디      ->
     name VARCHAR2(40) NOT NULL,       -- 이름         ->
     email VARCHAR2(40),                  -- 이메일    ->  세션으로부터 얻어와
     subject VARCHAR2(255) NOT NULL,    -- 제목
     content VARCHAR2(4000) NOT NULL,   -- 내용 

     ref NUMBER NOT NULL,                 -- 그룹번호(글번호와 똑같은 값을 넣는다)
     lev NUMBER DEFAULT 0 NOT NULL,     -- 단계
     step NUMBER DEFAULT 0 NOT NULL,    -- 글순서
     pseq NUMBER DEFAULT 0 NOT NULL,    -- 원글번호
     reply NUMBER DEFAULT 0 NOT NULL,   -- 답변수

     hit NUMBER DEFAULT 0,              -- 조회수
     logtime DATE DEFAULT SYSDATE
 );

시퀀스 객체
CREATE SEQUENCE seq_board  NOCACHE NOCYCLE;
 -->
<!-- webapp에 만든 jsp는 주소가 프로젝트명만 들어감 -->