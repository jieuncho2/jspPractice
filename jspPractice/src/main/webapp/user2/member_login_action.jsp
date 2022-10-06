<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>
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
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String loginDate = LocalDateTime.now().toString();
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "select MemberId, password from member where MemberId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				String rId = rs.getString("MemberID");
				String rPasswd = rs.getString("password");
				
				if(id.equals(rId) && passwd.equals(rPasswd)) {
					session.setAttribute("userID", id);
					
					sql = "update member set LoginDate = ? where MemberID = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, loginDate);
					pstmt.setString(2, id);
					pstmt.executeUpdate();
					
					response.sendRedirect("index.jsp");
				} else {
					out.println("일치하는 비밀번호가 아닙니다.");
				}
			} else {
				out.println("Member 테이블에 일치하는 아이디가 없습니다.");
			}
			
		} catch(SQLException ex) {
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
</body>
</html>