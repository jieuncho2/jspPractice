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
		
		String id = (String) session.getAttribute("userID");
		String passwd = request.getParameter("passwd");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "select MemberID, password from member where MemberID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				sql = "update member set password = ? where MemberID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, passwd);
				pstmt.setString(2, id);
				pstmt.executeUpdate();

				response.sendRedirect("index.jsp");
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