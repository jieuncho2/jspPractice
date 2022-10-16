<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
	%>
	<%@ include file="../inc/DBConnSqlTag.jsp" %>
	
	<sql:query dataSource="${dataSource}" var="resultSet">
		SELECT COUNT(*) AS cnt FROM member WHERE id = ?
		<sql:param value="<%= id %>" />
	</sql:query>
	
	<c:forEach var="row" items="${ resultSet.rows }">
		<c:choose>
			<c:when test="${ row.CNT == 1 }">
				동일한 아이디가 있습니다.
			</c:when>
			<c:otherwise>
				동일한 아이디가 습니다.
			</c:otherwise>
		</c:choose>
	</c:forEach>
</body>
</html>