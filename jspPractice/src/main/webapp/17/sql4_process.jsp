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
	<%--
	<sql:query> 태그로 DELETE 쿼리문 실행하기
	--%>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
	%>
	<%-- 데이터베이스를 연결하기 위한 기본 설정을 하도록 <sql:setDataSource>문 작성 --%>
	<sql:setDataSource var="dataSource"
		url = "jdbc:mariadb://localhost:3306/sample2"
		driver = "org.mariadb.jdbc.Driver" user="root" password="1225" />
	<%-- member 테이블에 id, passwd 필드 값과 일치하는 값이 있으면
	해당 레코드를 삭제하도록 <sql:update> 태그로 DELETE 문을 작성 --%>
	<sql:update var="resultSet" dataSource="${dataSource}">
		DELETE FROM member where id = ? and passwd = ?
		<%-- 폼 페이지에서 전송된 아이디, 이름, 비밀번호를 쿼리문의 물음표에 설정하도록 <sql:param> 태그를 작성 --%>
		<sql:param value="<%= id %>" />
		<sql:param value="<%= passwd %>" />
	</sql:update>
	<c:import var="url" url="sql1.jsp"></c:import>
	${url}
</body>
</html>