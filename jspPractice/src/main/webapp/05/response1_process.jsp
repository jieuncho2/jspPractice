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
	request.setCharacterEncoding("utf-8");
	String userID = request.getParameter("id");
	String password = request.getParameter("passwd");
	
	if(userID.equals("관리자") && password.equals("1234")) {
		response.sendRedirect("response1_success.jsp");
	} else {
		response.sendRedirect("response1_failed.jsp");
	}
	%>
</body>
</html>