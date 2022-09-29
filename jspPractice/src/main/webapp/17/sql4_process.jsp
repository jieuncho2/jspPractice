<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
	%>
	<sql:setDataSource var="dataSource"
		url = "jdbc:mariadb://localhost:3306/sample2"
		driver = "org.mariadb.jdbc.Driver" user="root" password="1225" />
	
	<sql:update var="resultSet" dataSource="${dataSource}">
		DELETE FROM member where id = ? and passwd = ?
		
		<sql:param value="<%= id %>" />
		<sql:param value="<%= passwd %>" />
	</sql:update>
	<c:import var="url" url="sql1.jsp"></c:import>
	${url}
</body>
</html>