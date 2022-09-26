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
	
		if (userID.equals("admin") && password.equals("admin1234")) {
			session.setAttribute("userID", userID);
			
			response.sendRedirect("2_welcome.jsp");
		} else {
			out.println("추가 생성이 실패했습니다.");
		}
	%>
</body>
</html>