package days04.board;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.domain.PageVO;
import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;

@WebServlet("/cstvsboard/list.htm")
public class List extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public List() {
        super(); 
    }
    
    // [1]
    int currentPage = 1;  // 현재 페이지 번호
    int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
    int numberOfPageBlock = 10;  // [1] 2 3 4 5 6 7 8 9 10 >
    int totalRecords = 0;   // 총 레코드 수
    int totalPages = 0 ;    // 총 페이지 수

    // list.htm
    // list.htm?currentPage=3&numberPerPage=30
    // list.htm?currentPage=3&numberPerPage=30&searchCondition=w&searchWord=홍길동
    // list.htm?currentPage=2&numberPerPage=10&searchCondition=w&searchWord=%EA%B8%B8%EB%8F%992
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> List.doGet()...");
		
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
		
		Connection conn = DBConn.getConnection();
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
			System.out.println("> List.doGet() Exception...");
			e.printStackTrace();
		} finally {
			DBConn.close();
		} // try
		
		// 포워딩
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);
		
		String path = "/days04/board/list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
