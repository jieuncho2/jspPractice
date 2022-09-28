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
		
		// ResultSet, Statement 참조 변수를 null로 초기화
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
			// member 테이블의 폼 페이지에서 전송된 id와 일치하는 레코드를 찾아 id, passwd, name 필드 값을 가져오도록 SELECT 문을 작성
			String sql = "select id, passwd from member where id = '" + id + "'";
			// Statement 객체를 생성하도록 createStatement() 메서드 작성
			stmt = conn.createStatement();
			// SELECT 문을 실행하도록 Statement 객체의 executeQuery() 메서드를 작성
			rs = stmt.executeQuery(sql);

			// SELECT 문으로 가져온 레코드가 있으면 실행
			if(rs.next()) {
				String rId = rs.getString("id");
				String rPasswd = rs.getString("passwd");
				
				if(id.equals(rId) && passwd.equals(rPasswd)) {
					// member 테이블의 폼 페이지에서 전송된 id와 일치하는 레코드를 찾아 삭제하도록 DELETE 문을 작성
					sql = "delete from member where id = '" + id + "' and passwd = '" + passwd + "'";
					// DELETE 문을 실행하도록 Statement 객체의 executeQuery() 메서드를 작성
					stmt = conn.createStatement();
					// DELETE 문을 실행하도록 Statement 객체의 executeUpdate() 메서드를 작성
					stmt.executeUpdate(sql);
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