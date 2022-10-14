package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	/*
	DAO(Data Access Object)는 데이터베이스의 data에 접근하기 위한 객체
	싱글턴 타입으로 작성
	*/
	
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
		
		int cnt = 0; // 레코드 개수 저장할 변수
		
		String sql = "SELECT count(*) FROM board";
		
		if(items == null && text == null) { // 검색이 없는 경우
		} else { // 검색이 있는 경우
			sql = sql + " WHERE " + items + " LIKE '%" + text + "%'";			
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1); // 레코드 개수 저장
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
		
		/*
		게시판은 최근 데이터가 위쪽으로 올라옴 sql문의 ORDER BY num DESC를 사용해서 내림차순으로 들고옴
		LIMIT을 자용
		-> WHERE문을 사용해서 데이터를 제한하는 게 더 효율적
		*/
		
		int start = (page - 1) * limit; // limit -> 한 페이지에 나올 게시물의 수
		// limit가 5일 경우 1페이지에서는 0, 2페이지에서는 5, 3페이지에서는 10
		
		String sql;
		
		if(items == null && text == null) {  // 검색이 없는 경우
			sql = "SELECT * FROM board ORDER BY num DESC";
		} else {  // 검색이 있는 경우
			sql = "SELECT * FROM board WHERE " + items + " LIKE '%" + text + "%' ORDER BY num DESC";		
		}
		sql = sql + " LIMIT " + start + ", " + limit;
		System.out.println(sql);
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// Resultset.absolute(int index): ResultSet 커서를 원하는 위치(Index)의 검색행으로 이동하는 메서드
			int total_record = getListCount(items, text);
			int total_number = total_record - ((page - 1) * limit);
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
//				board.setNum(total_number--);
//				total_number = total_number - 1;
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				list.add(board); // list에 저장
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
		/* 선택된 번호의 글 상세 내용 가져오기. view 페이지에서 사용 */
		
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
	
	
	public String getIdByNum(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = null;
		String sql = "SELECT id FROM board WHERE num = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("id");
			}
			return id;
			
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
}
