<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%session.removeAttribute("memId");%>
<%session.removeAttribute("memName");%>
<%session.removeAttribute("memEmail");%>
<!-- session.setAttribute("memName", null) 해도 됨 -->
<!--response.sendRedirect("../index.jsp");-->
</body>
<script type="text/javascript">
window.onload=function(){
	alert("로그아웃");
	location.href="../index.jsp";
}
</script>
</html>