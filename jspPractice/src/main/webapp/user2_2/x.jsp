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
		if(session.getAttribute("userID") != null) {
			response.sendRedirect("o.jsp");
		}
	%>
	<p><a href="member_insert.jsp">회원 가입</a>
	<p><a href="member_login.jsp">로그인</a>
</body>
</html>