<%@page import="login.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><%
		String num = request.getParameter("num");
		int[] resultArray = (int[]) request.getAttribute("gugudanModel");
		for(int i = 0; i < 9; i++) {%>
			<%= num %> * <%= (i + 1) %> = <%= resultArray[i] %><br>
		<%	
		}
		%>
</body>
</html>