<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="fileForm" method="post"
	action="1_insert_process.jsp">
		<p>학번: <input type="text" name="num">
		<p>학과: <input type="text" name="depart">
		<p>이름: <input type="text" name="name">
		<p>주소: <input type="text" name="address">
		<p>연락서: <input type="text" name="phone">
		<p><input type="submit" value="전송">
	</form>
</body>
</html>