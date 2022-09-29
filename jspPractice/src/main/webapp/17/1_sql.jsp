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
	<sql:setDataSource var="dataSource"
		url = "jdbc:mariadb://localhost:3306/sample2"
		driver = "org.mariadb.jdbc.Driver" user="root" password="1225" />
	
	<sql:query var="resultSet" dataSource="${dataSource}">
		select * from student
	</sql:query>
	
	<table border="1">
		<tr>
			<th>학번</th>
			<th>학과</th>
			<th>이름</th>
			<th>주소</th>
			<th>연락처</th>
		</tr>
		<c:forEach var="row" items="${resultSet.rowsByIndex}">
			<tr>
				<c:forEach var="colum" items="${row}" varStatus="i">
				<td>
					<c:if test="${colum != null}">
						<c:out value="${colum}"></c:out>
					</c:if>
					<c:if test="${colum == null}">
						&nbsp;
					</c:if>
				</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>