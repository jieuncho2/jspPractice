<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setIntHeader("Refresh", 5);
	%>
	<p>현재 시간은 <%= (new java.util.Date()) %>
	<p><a href="2_response_data.jsp">Google 홈페이지로 이동하기</a></p>
</body>
</html>