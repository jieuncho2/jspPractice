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
		/* board 테이블의 레코드 개수. 페이지 계산을 위해서 필요. */
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cnt = 0;
		
		String sql;
		
		if(items == null && text == null) {
			sql = "SELECT count(*) FROM board";
		} else {
			sql = "SELECT count(*) FROM board WHERE " + items + "LIKE '%" + text + "%'";			
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
		System.out.println(cnt);
		return cnt;
	}
	
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		/* board 테이블의 레코드 가져오기 */
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int totalRecord = getListCount(items, text);
		int start = (page - 1) * limit;
		
		int index = start + 1;
		
		String sql;
		
		if(items == null && text == null) {
			sql = "SELECT * FROM board WHERE name LIKE '%name%' ORDER BY num DESC LIMIT 0, 5";
		} else {
			sql = "SELECT * FROM board WHERE " + items + "LIKE '%" + text + "%' ORDER BY num DESC";		
		}
		sql = sql + " LIMIT " + start + ", " + limit;
		System.out.println(sql);
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				list.add(board);
			}
			
			return list;
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("getBoardList() 에러: " + ex);
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
	
	public String getLoginNameById(String id) {
		/* member 테이블에서 로그인한 id의 이름을 테이블에서 가져오기 */
		/* 글쓰기 페이지에서 사용 */
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String name = null;
		String sql = "SELECT * FROM member WHERE id = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("name");
			}
			return name;
			
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("getBoardByNum() 에러: " + ex);
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
	
	public void insertBoard(BoardDTO board) {
		/* board 테이블에 새로운 글 삽입하기 */
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "INSERT INTO board VALUES (?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getId());
			pstmt.setString(3, board.getName());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getRegist_day());
			pstmt.setInt(7, board.getHit());
			pstmt.setString(8, board.getIp());
			
			pstmt.execute();
			
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("insertBoard() 에러: " + ex);
		} finally {
			try {
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
	}
	
	public void updateHit(int num) {
		/* 선택된 글의 조회수 증가하기. view 페이지에서 사용. */
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "SELECT hit FROM board WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			int hit = 0;
			
			if(rs.next()) {
				hit = rs.getInt("hit") + 1;
				sql = "UPDATE board SET hit = ? WHERE num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, hit);
				pstmt.setInt(2, num);
				pstmt.executeUpdate();
			}
			
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("updateHit() 에러: " + ex);
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
	}
	
	public BoardDTO getBoardByNum(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = null;
		
		updateHit(num);
		String sql = "SELECT * FROM board WHERE num = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
			}
			
			return board;
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("getBoardByNum() 에러: " + ex);
		} finally {
			try {
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
	
	public void updateBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE board set name = ?, subject = ?, content = ? where num = ?";
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);
			
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getNum());
			
			pstmt.executeUpdate();
			conn.commit();
			
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("updateBoard() 에러: " + ex);
		} finally {
			try {
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
	}
	
	public void deleteBoard(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM board WHERE num = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("deleteBoard() 에러: " + ex);
		} finally {
			try {
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
	}
	
}
