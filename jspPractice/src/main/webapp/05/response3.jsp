<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	response 내장 객체로 오류 응답
	1) 5초마다 JSP 페이지가 갱신되도록
	--%>
	<%
		response.sendError(404, "요청 페이지를 찾을 수 없습니다.");
	%>
</body>
</html>