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
	String userID = (String)session.getAttribute("userID");
	if(userID == null || userID.trim().equals("")) {
		response.sendRedirect("3_login.jsp");
	}
	%>
	<p><h4>회원 전용 페이지입니다</h4></p>
	<p><a href="3_logout.jsp">로그아웃</a></p>
</body>
</html>