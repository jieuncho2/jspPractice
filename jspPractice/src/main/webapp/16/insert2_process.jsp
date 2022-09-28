<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%--
	Statement 객체로 INSERT 쿼리문 실행하기
	1) Statement 객체를 null로 초기화
	2) member 테이블의 각 필드에 폼 페이지에서 전송된 아이디, 비밀번호, 이름을 삽입하도록 INSERT문을 작성
	3) Statement 객체를 생성하도록 작성
	4) INSERT 문을 실행하도록 Statement 객체의 executeUpdate() 메서드를 작성
	5) INSERT 문의 실행이 성공하면 메시지를 출력
	6) 생성한 Statement 객체의 Connection 객체를 해제
	--%>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO member(id, passwd, name) VALUES(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
			out.println("Member 테이블 삽입이 성공했습니다.");
		} catch(SQLException ex) {
			out.println("Member 테이블 삽입이 실패했습니다.");
			out.println("SQLException: " + ex.getMessage());
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	%>
</body>
</html>