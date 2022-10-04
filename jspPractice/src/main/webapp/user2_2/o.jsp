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
		if(session.getAttribute("userID") == null) {
			response.sendRedirect("x.jsp");
		}
	%>
	<p><a href="member_update.jsp">회원 정보 수정</a>
	<p><a href="member_logout.jsp">로그아웃</a>
</body>
</html>