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
	--%>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
			String sql = "select id, passwd from member where id = '" + id + "'";
			out.print(sql);

			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);

			if(rs.next()) {
				String rId = rs.getString("id");
				String rPasswd = rs.getString("passwd");
				
				if(id.equals(rId) && passwd.equals(rPasswd)) {
					sql = "update member set name = '" + name + "' where id = '" + id + "'";
					out.print(sql);
					stmt = conn.createStatement();
					
					stmt.executeUpdate(sql);
					out.println("Member 테이블을 수정했습니다.");
				} else {
					out.println("일치하는 비밀번호가 아닙니다.");
				}
			} else {
				out.println("Member 테이블에 일치하는 아이디가 없습니다.");
			}
			
		} catch(SQLException ex) {
			out.println("Member 테이블 삽입이 실패했습니다.");
			out.println("SQLException: " + ex.getMessage());
		} finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	%>
</body>
</html>