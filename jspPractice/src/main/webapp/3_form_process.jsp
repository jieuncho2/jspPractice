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
		request.setCharacterEncoding("UTF-8");
		
		String[] check = request.getParameterValues("check");
		
		if(check != null) {
			for(int i = 0; i < check.length; i++) {
				out.print(" " + check[i]);
			}
		}
	%>
</body>
</html>