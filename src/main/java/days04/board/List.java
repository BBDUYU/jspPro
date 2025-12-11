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

@WebServlet("/cstvboard/list.htm")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public List() {
        super();
    }
    //[1]
    int currentPage=1; //현재페이지
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> List.doGet()");
		
		try {
			this.currentPage =Integer.parseInt(request.getParameter("page"));			
		}catch(Exception e){
			this.currentPage=1;
		}
		
		Connection conn=DBConn.getConnection();
		BoardDAO dao=new BoardDAOImpl(conn);
		java.util.List<BoardDTO> list = null;
		
		try {
			list = dao.select(); //페이징처리 X
		}catch(Exception e) {
			System.out.println(">List.doGet()");
			e.printStackTrace();
		}finally {
			DBConn.close();
		}
		
		//포워딩
		request.setAttribute("list", list);
		
		String path = "/days04/board/list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
