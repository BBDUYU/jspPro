package days07.mvc.command;

import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;

public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("> ViewHandler.process()...Get...");

		int seq = Integer.parseInt( request.getParameter("seq" ) );			

		Connection conn = ConnectionProvider.getConnetcion();
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
				System.out.println("> ViewHandler.process()....Get Transaction Rollback...");
				e2.printStackTrace();
			}

			System.out.println("> ViewHandler.process()....Get Exception...");
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
			conn.close();
		} // try

		// 포워딩
		request.setAttribute("dto", dto);

		return "/days07/board/view.jsp";
	}

}
