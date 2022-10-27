<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String name = (String)session.getAttribute("memName");
String id = (String)session.getAttribute("memId");
String email = (String)session.getAttribute("memEmail");

%>
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
<h3>글쓰기</h3>
<body>
<form name="boardWriteForm" method="post" action="boardWrite.jsp">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="subject" id="subject" maxlength="500" style="width:250px" placeholder="제목입력"/>
				<div id="subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea placeholder="내용입력" name="content" id="content" cols="50" rows="10"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="글작성" onclick="javascript:boardWriteCheck()">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
function boardWriteCheck(){
	document.getElementById("subjectDiv").innerText="";
	document.getElementById("contentDiv").innerText="";
	
	if(document.getElementById("subject").value == "")
		document.getElementById("subjectDiv").innerText="제목을 입력하세요";
	else if(document.getElementById("content").value == "")
		document.getElementById("contentDiv").innerText="내용을 입력하세요";
	else
		document.boardWriteForm.submit();
}
</script>
</body>
</html>