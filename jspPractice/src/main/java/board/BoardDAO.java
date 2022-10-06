package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	
	private static BoardDAO instance;
	
	private BoardDAO() {
		
	}
	
	public static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cnt = 0;
		
		String sql;
		
		if(items == null && text == null) {
			sql = "SELECT cont(*) FROM board";
		} else {
			sql = "SELECT cont(*) FROM board WHERE " + items + "LIKE '%" + text + "%'";			
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("getListCount() 에러: " + ex);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
				// TODO: handle exception
				throw new RuntimeException(ex.getMessage());
			}
		}
		return cnt;
	}
	
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int totalRecord = getListCount(items, text);
		int start = (page - 1) * limit;
		
		int index = start + 1;
		
		String sql;
		
		if(items == null && text == null) {
			sql = "SELECT cont(*) FROM board ORDER BY num DESC";
		} else {
			sql = "SELECT cont(*) FROM board WHERE " + items + "LIKE '%" + text + "%' ORDER BY num DESC";		
		}
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
			}
			
			if() {
				
			} else {
				
			}
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("getListCount() 에러: " + ex);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
				// TODO: handle exception
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}
	
	public static void main(String[] args) {
		
	}
}
