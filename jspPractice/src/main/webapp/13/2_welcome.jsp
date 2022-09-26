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
	<% 
		String name = null;
	
		Enumeration en = session.getAttributeNames();
		
		int i = 0;
		
		while(en.hasMoreElements()) {
			i++;
			name = en.nextElement().toString();
			if(name.equals("userID") && name.toString() != null) {
				name = (String)session.getAttribute("userID");
			}
		}
		if(name == null) {
			response.sendRedirect("2_session_out.jsp");
		}
	%>
	
	<h3><%= name %> 님 반갑습니다.</h3>
	<a href="2_session_out.jsp">로그아웃</a>
</body>
</html>