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
	<%
		Connection conn = null;
	
		String url = "jdbc:mariadb://localhost:3306/sample3";
		String user = "root";
		String password = "1225";
		
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);

		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		// ResultSet, PreparedStatement 참조 변수를 null로 초기화
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			// member 테이블의 폼 페이지에서 전송된 id와 일치하는 레코드를 찾아 id, passwd, name 필드 값을 가져오도록 SELECT 문을 작성
			String sql = "select MemberId, password from member where MemberId = ?";
			// PreparedStatement 객체를 생성하도록 prepareStatement() 메서드 작성
			pstmt = conn.prepareStatement(sql);
			// 물음표에 해당하는 값을 설정하도록 setString() 메서드를 작성
			pstmt.setString(1, id);
			// SELECT 문을 실행하도록 PreparedStatement 객체의 executeQuery() 메서드를 작성
			rs = pstmt.executeQuery();

			// SELECT 문으로 가져온 레코드가 있으면 실행
			if(rs.next()) {
				String rId = rs.getString("MemberID");
				String rPasswd = rs.getString("password");
				
				if(id.equals(rId) && passwd.equals(rPasswd)) {
					session.setAttribute("userID", id);
					response.sendRedirect("index.jsp");
				} else {
					out.println("일치하는 비밀번호가 아닙니다.");
					response.sendRedirect("member_login.jsp");
				}
			} else {
				out.println("Member 테이블에 일치하는 아이디가 없습니다.");
				response.sendRedirect("member_login.jsp");
			}
			
		} catch(SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} finally {  // 생성한 객체를 해제
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