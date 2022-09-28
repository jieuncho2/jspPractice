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
	<table width="300" border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
		</tr>
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
			ResultSet rs = null;
			PreparedStatement pstmt = null;
		
		try {
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("passwd");
				String name = rs.getString("name");
	%>
	<tr>
		<td><%= id %></td>
		<td><%= pw %></td>
		<td><%= name %></td>
	</tr>
	<%
			}
		} catch(SQLException ex) {
			out.println("Member 테이블 호출이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} finally {
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	%>
	</table>
</body>
</html>