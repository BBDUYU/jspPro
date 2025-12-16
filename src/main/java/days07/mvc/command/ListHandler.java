package days07.mvc.command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days04.board.domain.BoardDTO;
import days04.board.domain.PageVO;
import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;

public class ListHandler implements CommandHandler{

	// [1]
	int currentPage = 1;  // 현재 페이지 번호
	int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
	int numberOfPageBlock = 10;  // [1] 2 3 4 5 6 7 8 9 10 >
	int totalRecords = 0;   // 총 레코드 수
	int totalPages = 0 ;    // 총 페이지 수

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> ListHandler.process()...");

		try {
			this.currentPage = Integer.parseInt( request.getParameter("currentPage" ) );			
		} catch (Exception e) {
			this.currentPage = 1;
		}

		try {
			this.numberPerPage = Integer.parseInt( request.getParameter("numberPerPage" ) );			
		} catch (Exception e) {
			this.numberPerPage = 10;
		}

		// 검색 시작
		String searchCondition = null;
		try {
			searchCondition = request.getParameter("searchCondition" ) ;			
		} catch (Exception e) {
			searchCondition = "t";
		}		
		String searchWord = request.getParameter("searchWord" ) ;
		// 검색 끝

		// Connection conn = DBConn.getConnection();
		Connection conn = ConnectionProvider.getConnetcion();
		
		BoardDAO dao = new BoardDAOImpl(conn);

		java.util.List<BoardDTO> list = null;
		PageVO pvo = null;

		try {

			if ( searchWord == null || searchWord.equals("") ) {  // 검색 X, 목록 조회
				// list = dao.select(); // 페이징 처리 X
				pvo = new PageVO(currentPage, numberPerPage, numberOfPageBlock);
				list = dao.select(this.currentPage, this.numberPerPage); // 페이징 처리 O
			} else {          // 검색 O, 목록 조회
				pvo = new PageVO(currentPage, numberPerPage, numberOfPageBlock, searchCondition, searchWord);
				list = dao.search(searchCondition, searchWord, currentPage, numberPerPage);
			}

		} catch (Exception e) {
			System.out.println("> ListHandler.process() Exception...");
			e.printStackTrace();
		} finally {
			//DBConn.close();
			conn.close();  // 커넥션 풀 반환... ( 기억 )
		} // try

		// 1. 서블릿 역할이지만 모델에서 request 저장. 
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);

		// 2. 모델 - 포워딩
		return  "/days07/board/list.jsp";
		
	}

}
