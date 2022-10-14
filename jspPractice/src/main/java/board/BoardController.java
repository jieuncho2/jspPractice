package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int LISTCOUNT = 5; // 페이지당 게시물 수

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response); // get으로 넘어온 것을 post로 넘김
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String RequestURI = request.getRequestURI(); // 전체 경로를 가져옴
		String contextPath = request.getContextPath(); // 프로젝트 Path만 가져옴
		String command = RequestURI.substring(contextPath.length()); // 전체 경로에서 프로젝트 Path 길이 만큼의 인덱스 이후의 문자열을 가져옴
		System.out.println(command);
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/BoardListAction.do")) { // 등록된 글 목록 페이지 출력하기. jsp로 포워딩.
			requestBoardList(request);
			 RequestDispatcher rd = request.getRequestDispatcher("sample/board/list.jsp");
			 rd.forward(request, response);
		} else if(command.equals("/BoardWriteForm.do")) { // 글 등록 페이지 출력하기. jsp로 포워딩.
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./sample/board/writeForm.jsp");
			rd.forward(request, response);
		} else if(command.equals("/BoardWriteAction.do")) { // 새로운 글 등록하기. jsp로 포워딩.
			requestBoardWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		} else if(command.equals("/BoardViewAction.do")) { // 선택된 상세 페이지 가져오기. 뷰로 이동.
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
			rd.forward(request, response);
		} else if(command.equals("/BoardView.do")) { // 글 상세 페이지 출력하기. jsp로 포워딩.
//			String loginId = requestLoginId(request);
//			String boardId = requestBoardId(request);
			String loginId = (String) request.getParameter("id");
			BoardDTO notice = (BoardDTO) request.getAttribute("board");
			String boardId = notice.getId();
			if(loginId.equals(boardId)) {
				RequestDispatcher rd = request.getRequestDispatcher("./sample/board/updateForm.jsp");
				rd.forward(request, response);				
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("./sample/board/view.jsp");
				rd.forward(request, response);		
			}
		} else if(command.equals("/BoardUpdateAction.do")) { // 선택된 글의 수정. 수정 후 목록으로 이동.
			requestBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		} else if(command.equals("/BoardDeleteAction.do")) { // 선택된 글 삭제하기. 삭제 후 목록으로 이동.
			requestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			
			rd.forward(request, response);
		}
		
	}
	
	public void requestBoardList(HttpServletRequest request) {
		/* 등록된 글 목록 가져오기 */
		
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
		int pageNum = 1; // 페이지 번호가 전달이 안 되면 1 페이지
		int limit = LISTCOUNT; // 페이지당 게시물 수
		
		if(request.getParameter("pageNum") != null) { // 페이지 번호가 전달이 된 경우
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String items = request.getParameter("items"); // 검색 필드
		String text = request.getParameter("text"); // 검색어
		
		int total_record = dao.getListCount(items, text); // 전체 게시물 수
		
		boardlist = dao.getBoardList(pageNum, limit, items, text); // 현재 페이지에 해당하는 목록 데이터 가져오기
		
		int total_page;
		
		// 전체 페이지 구하기
		if(total_record % limit == 0) { // 전체 게시물이 limit의 배수일 때 
			total_page = total_record / limit;
			Math.floor(total_page);
		} else {
			total_page = total_record / limit;
			Math.floor(total_page);
			total_page = total_page + 1;
		}
		int total_number = total_record - ((pageNum - 1) * limit);
		System.out.println(total_number);
		request.setAttribute("total_number", total_number);
		
		request.setAttribute("pageNum", pageNum); // 페이지 번호
		request.setAttribute("total_page", total_page); // 전체 페이지
		request.setAttribute("total_record", total_record); // 전체 게시물 수
		request.setAttribute("boardlist", boardlist); // 현재 페이지에 해당하는 목록 데이터
		
	}
	
	public void requestLoginName(HttpServletRequest request) {
		/* 로그인한 아이디의 이름 들고오기. 글쓰기에서 사용 */
		
		// 세션에서 들고오는 걸 추천
		String id = request.getParameter("id");
		System.out.println(id);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		String name = dao.getLoginNameById(id);
		
		request.setAttribute("name", name);
	}
	
	public void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("content"));
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date());
		
		board.setHit(0);
		board.setRegist_day(regist_day);
		board.setIp(request.getRemoteAddr());
		
		dao.insertBoard(board);
	}
	
	public void requestBoardView(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num);
		System.out.println(num);
		System.out.println(pageNum);
		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("board", board);
	}
	
	public void requestBoardUpdate(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();
		
		board.setNum(num);
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		dao.updateBoard(board);
	}

	public void requestBoardDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);
	}

	public String requestBoardId(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDAO dao = BoardDAO.getInstance();
		String boardId = dao.getIdByNum(num);
		System.out.println("boardId: " + boardId);
		return boardId;
	}
	
	public String requestLoginId(HttpServletRequest request) {
		String loginId = (String) request.getParameter("id");
		System.out.println("loginId: " + loginId);
		return loginId;
	}
}