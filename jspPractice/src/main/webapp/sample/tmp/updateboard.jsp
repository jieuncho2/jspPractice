<%@page import="org.apache.taglibs.standard.lang.jstl.Literal"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn =null;
	
	String url = "jdbc:mariadb://localhost:3306/sample4";
	String user = "root";
	String password = "1225";
	
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	
	Statement stmt = null;
	try {
		stmt = conn.createStatement();
		int row = 0;
		
		int limit = 60;
		String[] ids = {"test", "test2"};
		String[] names = {"테스트", "테스트2"};
		
		for(int i = 0; i < limit; i++) {
			int index = i % 2;
			String id = ids[index];
			String subject = i % 10;
			String ip = request.getRemoteAddr();
			
			String sql = "INSERT INTO board (id, name, subject, content, regist_day, hit, ip) " +
						"VALUES ('" + id + "' + name + "'")"
		}
	} catch(SQLException e) {
		
	}
%>