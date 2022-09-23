<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = request.getParameter("id");
	String password = request.getParameter("passwd");
	
	if(userID.equals("admin") && password.equals("1234")) {
		Cookie cookie_id = new Cookie("userID", userID);
		Cookie cookie_pw = new Cookie("userPW", password);
		response.addCookie(cookie_id);
		response.addCookie(cookie_pw);
		out.println("추가 생성이 성공했습니다.<br>");
		out.println(userID + "님 환영합니다.");
	} else {
		out.println("추가 생성이 실패했습니다.");
	}
	%>
</body>
</html>