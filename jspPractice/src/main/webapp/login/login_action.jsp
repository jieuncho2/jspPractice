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
		request 내장 객체로 폼 페이지에서 아이디와 비밀번호를 전송받아 출력하기
		1) 폼 페이지에서 입력한 한글을 처리하도록 request 내장 객체의 setCharaterEncoding() 메서드에 문자 인코딩
		2) 입력한 아이디와 비밀번호를 폼 문으로부터 전송받도록 request 내장 객체의 getParameter() 메서드를 작성
		3) 폼 문으로부터 전송받은 아이디와 비밀번호를 출력하도록 표현문 태그를 작성
	--%>
	<%
	request.setCharacterEncoding("utf-8");
	String memberID = request.getParameter("memberID");
	String pass = request.getParameter("pass");
	%>
	<p> 아이디: <%=memberID%>
	<p> 비밀번호: <%=pass%>
</body>
</html>