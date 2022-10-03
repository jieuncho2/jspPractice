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
	request.setCharacterEncoding("utf-8");
	String memberID = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("passwd");
	String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
	String email = request.getParameter("email");
	%>
	<p> 아이디: <%=memberID%>
	<p> 이름: <%=name%>
	<p> 비밀번호: <%=password%>
	<p> 연락처: <%=phone%>
	<p> 이메일: <%=email%>
</body>
</html>