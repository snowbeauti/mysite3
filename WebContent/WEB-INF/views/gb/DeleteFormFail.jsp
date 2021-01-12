<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int no = (int)request.getAttribute("no");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>잘못된 비밀번호입니다.</h1>
<a href="./gb?action=dform&no=<%=no%>">비밀번호 재시도</a>
<a href="./gb?action=addlist">방명록으로 가기</a>
</body>
</html>