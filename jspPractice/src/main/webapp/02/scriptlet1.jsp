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
		int count = 0; // 지역 변수 선언
	%>
	Page Count is
	<%
		out.println(++count); // 지역 변수 1 증가
	%>
</body>
</html>