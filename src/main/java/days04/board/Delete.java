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

@WebServlet("/cstvsboard/delete.htm")
public class Delete extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public Delete() {
        super(); 
    } 
    
    // delete.htm
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Delete.doGet()...");
		 
		// 포워딩 
		String path = "/days04/board/delete.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("> Delete.doPost()...");		 
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		String pwd = request.getParameter("pwd"); // 입력받은 비밀번호
		
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		
		int rowCount = 0;
		String originalPwd ; // 실제 게시글 비밀번호
		
		String location = "/jspPro/cstvsboard/";
		
		try {
			originalPwd = dao.getOriginalPwd(seq);
			if(originalPwd.equals(pwd)) { // 작성자 확인
				rowCount = dao.delete(seq);
				location += "list.htm?delete=success&seq="+seq;
			}else {
				//location += "delete.htm?seq="+seq+"&delete=fail";
				// 모달창으로 삭제
				location += "view.htm?seq="+seq+"&delete=fail";
			}
		} catch (Exception e) {
			System.out.println("> Delete.doPost() Exception...");
			e.printStackTrace();
		} finally {
			DBConn.close();
		} // try
		
		
		// 리다이렉트
		
		response.sendRedirect(location);
	}

}




