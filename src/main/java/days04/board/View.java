package days04.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

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
    //[1]
    int currentPage=1; //현재페이지
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> View.doGet()");
		

		int seq =Integer.parseInt(request.getParameter("seq"));			
		
		Connection conn=DBConn.getConnection();
		BoardDAO dao=new BoardDAOImpl(conn);
		java.util.List<BoardDTO> list = null;
		
		BoardDTO dto = null;
		int rowCount = 0;
		
		try {
			conn.setAutoCommit(false);
			rowCount = dao.increaseReaded(seq);
			dto = dao.view(seq);
			conn.commit();
			
		}catch(Exception e) {
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
			System.out.println(">View.doGet() Transaction Rollback");
			e.printStackTrace();
		}finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBConn.close();
		}
		
		//포워딩
		request.setAttribute("dto", dto);
		
		String path = "/days04/board/view.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
