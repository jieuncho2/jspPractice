<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="navbar-nav mr-auto">
		<% 
			if(session.getAttribute("userID") == null) {
		%>
			<li class="nav-item">
				<a class="nav-link" href="member_insert.jsp">회원 가입</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="member_login.jsp">로그인</a>
			</li>
		<%
			} else {
		%>
			<li class="nav-item">
				<a class="nav-link" href="member_update.jsp">회원 정보 수정</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="member_logout.jsp">로그아웃</a>
			</li>
		<%
			}
		%>
	</ul>
</body>
</html>