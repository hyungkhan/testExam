<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//String name = request.getParameter("name");
//세션에 삽입된 값을 가져온다
String name = (String)session.getAttribute("memName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><img src="../img/img2.jpg" width="100px" height="100" onclick = "location.href='../index.jsp'" 
         style="cursor: pointer;">
<%= name +"님이 로그인하였습니다" %></h3>
<br>
<input type = "button" value = "로그아웃" onclick = "location.href='logoutForm.jsp'">
</body>
</html>