<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	쿠키 생성하기
	1) 전송된 아이디와 비밀번호가 일치하면 쿠키 이름 userID, userPW에 값을 설정하도록 Cookie 객체를 생성
	생성된 Cookie 객체를 쿠키로 저장하도록 response 내장 객체의 addCookie() 메서드를 작성하고 성공 메시지를 출력
	일치하지 않으면 실패 메시지를 출력
	--%>
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