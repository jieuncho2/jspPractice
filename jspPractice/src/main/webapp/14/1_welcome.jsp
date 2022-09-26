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
		String userID = null;
		Cookie[] cookies = request.getCookies();
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("userID") && cookies[i].getValue() != null) {
				userID = cookies[i].getValue();
			}
		}
		if(userID == null) {
			response.sendRedirect("1_cookie_out.jsp");
		}
	%>
	
	<h3><%= userID %> 님 반갑습니다.</h3>
	<a href="1_cookie_out.jsp">로그아웃</a>
</body>
</html>