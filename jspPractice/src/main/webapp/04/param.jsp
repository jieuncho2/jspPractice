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
	<h2>이 파일은 param.jsp입니다.</h2>
	<jsp:include page="param_date.jsp" flush="true">
		<jsp:param value="<%= new java.util.Date() %>" name="date"/>
	</jsp:include>
	<p>Java Server Page</p>
</body>
</html>