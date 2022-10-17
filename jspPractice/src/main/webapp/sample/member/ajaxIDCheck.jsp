<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
			true
		</c:when>
		<c:otherwise>
			false
		</c:otherwise>
	</c:choose>
</c:forEach>