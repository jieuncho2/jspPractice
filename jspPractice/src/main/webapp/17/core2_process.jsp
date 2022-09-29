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
	<%--
	숫자가 짝수인지 또는 홀수인지 판단하기
	1) number 변수에 폼에서 전송된 number 값을 설정하도록 <c:set> 태그를 작성
	2) 다중 조건문을 출력하도록 <:choose> 태그를 작성
	3) <c:when> 태그를 사용하여 조건문 number%2==0이 참이면 number 변수 값을 출력하도록 <c:out> 태그를 작성 
	4) <c:when> 태그를 사용하여 조건문 number%2==1이 참이면 number 변수 값을 출력하도록 <c:out> 태그를 작성 
	5) 3), 4)에 해당되지 않으면 실행하도록 <c:otherwise> 태그를 작성
	--%>
	<%
	String number = request.getParameter("number");
	%>
	<c:set var="number" value="<%= number %>" />
	<c:choose>
		<c:when test="${number%2==0}">
			<c:out value="${number}" />은 짝수입니다.
		</c:when>
		<c:when test="${number%2==1}">
			<c:out value="${number}" />은 홀수입니다.
		</c:when>
		<c:otherwise>
			숫자가 아닙니다.
		</c:otherwise>
	</c:choose>
</body>
</html>