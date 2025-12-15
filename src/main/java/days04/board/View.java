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
import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;

@WebServlet("/cstvsboard/view.htm")
public class View extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public View() {
        super(); 
    }
    
    // [1]
    int currentPage = 1;  // 현재 페이지 번호
 
    // View.htm?seq=3
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> View.doGet()...");
				
		int seq = Integer.parseInt( request.getParameter("seq" ) );			
				
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		
		BoardDTO dto = null;
		int rowCount = 0;
		
		try {
			
			conn.setAutoCommit(false);
			
			// 1. 해당 게시글 조회수 증가
			rowCount = dao.increaseReaded(seq);
			// 2. 해당 게시글 얻어오기
			dto = dao.view(seq);
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();				
			} catch (Exception e2) {
				System.out.println("> View.doGet() Transaction Rollback...");
				e2.printStackTrace();
			}
			
			System.out.println("> View.doGet() Exception...");
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			DBConn.close();
		} // try
		
		// 포워딩
		request.setAttribute("dto", dto);
		
		String path = "/days04/board/view.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
