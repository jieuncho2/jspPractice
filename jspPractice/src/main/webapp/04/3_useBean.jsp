<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bean" class="user.GuGuDan" />
	<%
		for(int i = 1; i < 10; i++) {
			int m = bean.process(5, i);	
			out.print("5 * " + i + " = " + m + "<br>");
		}
	%>
</body>
</html>