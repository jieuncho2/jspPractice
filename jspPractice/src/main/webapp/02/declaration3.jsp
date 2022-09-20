<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 선언문 태그 사용 예: 전역 변수 선언 --%>
	<%!
		int sum(int a, int b) {
		return a + b;
	}
	%>
	<%
		out.println("2 + 3 = " + sum(2, 3));
	%>
</body>
</html>