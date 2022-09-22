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
			out.print("5 *" + m);
		}
		int m = bean.process(5, 1);	
		out.print("5의 3 제곱: " + m);
	%>
</body>
</html>