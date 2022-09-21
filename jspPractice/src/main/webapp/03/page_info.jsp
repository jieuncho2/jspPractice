<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	page 디렉티브 태그에 현재 웹 페이지의 설명 작성하기
	1) 
	2) 
	--%>
	<%@ page info="Date 클래스를 아용한 날짜 출력하기" %>
	Today is <%= new java.util.Date() %>
</body>
</html>