<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String number = request.getParameter("number");
	%>
	<c:set var="number" value="<%= number %>" />
	<c:choose>
		<c:when test="${number/10==10 || number/10==9}">
			<c:out value="${number}" />점은 A학점
		</c:when>
		<c:when test="${number/10==8}">
			<c:out value="${number}" />점은 B학점
		</c:when>
		<c:when test="${number/10==7}">
			<c:out value="${number}" />점은 C학점
		</c:when>
		<c:when test="${number/10==6}">
			<c:out value="${number}" />점은 D학점
		</c:when>
		<c:when test="${number/10==5}">
			<c:out value="${number}" />점은 E학점
		</c:when>
		<c:otherwise>
			<c:out value="${number}" />점은 F 학점
		</c:otherwise>
	</c:choose>
</body>
</html>