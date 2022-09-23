<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	request 내장 객체로 모든 HTTP 헤더 정보 값 출력하기
	1) 
	2) 
	3) 
	--%>
	<%
		Enumeration en = request.getHeaderNames();
		while(en.hasMoreElements()) {
			String headerName = (String)en.nextElement();
			String headerValue = request.getHeader(headerName);
	%>
	<%= headerName %>: <%= headerValue %><br>
	<%
		}
	%>
</body>
</html>