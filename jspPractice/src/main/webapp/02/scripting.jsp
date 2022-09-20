<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Scripting Tag</h2>
	<%--
		주석 태그
		JSP 주석 태그 comments tag: JSP 웹 컨테이너가 무시하는 텍스트를 표시
		주석 태그는 JSP 페이지의 일부를 주석 처리하려 숨길 때 유용
		주석은 프로그램의 실행에는 영향을미치지 않지만 프로그램의 이해 및 소스 코드의 분석을 위해 반드시 기술할 것을 권장
		
		주석
	--%>
	<%!
		//
		int count = 3;
		String makeItLower(String data) {
			return data.toLowerCase();
		}
	%>
	<%
		//
		for(int i = 1; i <= count; i++) {
			out.println("Java Server Page " + i + ".<br>");
	}
	%>
	<%-- --%>
	<%= makeItLower("Hello World") %>
</body>
</html>