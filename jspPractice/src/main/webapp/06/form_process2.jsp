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
		
		Enumeration paraNames = request.getParameterNames();
		while(paraNames.hasMoreElements()) {
			String name = (String)paraNames.nextElement();
			out.print("<tr><td>" + name + "</td>\n");
			String paraValue = request.getParameter(name);
			out.println("<td> " + paraValue + "</td></tr>\n");
		}
	%>
</body>
</html>