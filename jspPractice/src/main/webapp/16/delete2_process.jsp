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
	PreparedStatement 객체로 DELETE 쿼리문 실행 결과 값 가져오기
	--%>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		// ResultSet, PreparedStatement 참조 변수를 null로 초기화
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			// member 테이블의 폼 페이지에서 전송된 id와 일치하는 레코드를 찾아 id, passwd, name 필드 값을 가져오도록 SELECT 문을 작성
			String sql = "select id, passwd from member where id = ?";
			// PreparedStatement 객체를 생성하도록 prepareStatement() 메서드 작성
			pstmt = conn.prepareStatement(sql);
			// SELECT 문을 실행하도록 PreparedStatement 객체의 executeQuery() 메서드를 작성
			rs = pstmt.executeQuery();

			// SELECT 문으로 가져온 레코드가 있으면 실행
			if(rs.next()) {
				String rId = rs.getString("id");
				String rPasswd = rs.getString("passwd");
				
				if(id.equals(rId) && passwd.equals(rPasswd)) {
					// member 테이블의 폼 페이지에서 전송된 id와 일치하는 레코드를 찾아 삭제하도록 DELETE 문을 작성
					sql = "delete from member where id = ? and passwd = ?";
					// PreparedStatement 객체를 생성하도록 prepareStatement() 메서드 작성
					pstmt = conn.prepareStatement(sql);
					// DELETE 문을 실행하도록 PreparedStatement 객체의 executeUpdate() 메서드를 작성
					pstmt.executeUpdate();
					out.println("Member 테이블을 삭제했습니다.");
				} else {
					out.println("일치하는 비밀번호가 아닙니다.");
				}
			} else {
				out.println("Member 테이블에 일치하는 아이디가 없습니다.");
			}
			
		} catch(SQLException ex) {
			out.println("Member 테이블 삭제가 실패했습니다.");
			out.println("SQLException: " + ex.getMessage());
		} finally {   // 생성한 객체를 해제
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