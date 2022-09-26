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
		세션에 저장된 속성 값 가져와 출력하기
		1) 세션에 저장된 세션 속성 이름 userID, userPW의 속성 값을 가져오도록 session 내장 객체의 getAttribute() 메서드를 작성
	--%>
	<%
		String userID = (String)session.getAttribute("userID");
		String password = (String)session.getAttribute("userPW");
		
		out.println("설정한 세션의 속성 값 [1]: " + userID + "<br>");
		out.println("설정한 세션의 속성 값 [2]: " + password + "<br>");
	%>
</body>
</html>