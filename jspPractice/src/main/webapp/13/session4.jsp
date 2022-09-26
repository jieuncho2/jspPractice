<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><h4>------------------세션을 삭제하기 전------------------</h4>
	<%--
		세션에 저장된 속성 삭제하기
		1) 세션에 저장된 세션 속성 이름 userID를 삭제하도록 session 내장 객체의 removeAttribute() 메서드를 작성
	--%>
	<%
		String userID = (String)session.getAttribute("userID");
		String password = (String)session.getAttribute("userPW");
		out.println("설정된 세션 userID: " + userID + "<br>");
		out.println("설정된 세션 userPW: " + password + "<br>");
		
	 	session.removeAttribute("userID");
	%>
	<p><h4>------------------세션을 삭제한 후------------------</h4>
	<%
		userID = (String)session.getAttribute("userID");
		password = (String)session.getAttribute("userPW");
		out.println("설정된 세션 userID: " + userID + "<br>");
		out.println("설정된 세션 userPW: " + password + "<br>");
	%>
</body>
</html>