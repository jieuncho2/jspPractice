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
	
	--%>
	<h2>param 액션 태그</h2>
	<jsp:forward page="param2_date.jsp">
		<jsp:param value="admin" name="id"/>
		<jsp:param value='<%= java.net.URLEncoder.encode("관리자") %>' name="name"/>
	</jsp:forward>
	<p>Java Server Page</p>
</body>
</html>