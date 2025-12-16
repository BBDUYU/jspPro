package days07.mvc.command;

import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;

public class EditHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// GET POST
		String requestMethod = request.getMethod();

		if (requestMethod.equals("GET")) {

			System.out.println("> EditHandler.process ...Get...");

			int seq = Integer.parseInt(request.getParameter("seq"));

			Connection conn = ConnectionProvider.getConnetcion();
			BoardDAO dao = new BoardDAOImpl(conn);

			int rowCount = 0;
			BoardDTO dto = null;

			try {
				dto = dao.view(seq);
			}catch (Exception e) {
				System.out.println("> EditHandler.doGet() Exception...");
				e.printStackTrace();
			} finally {
				conn.close();
			}

			// 포워딩 
			request.setAttribute("dto", dto);

			return "/days07/board/edit.jsp";

		} else if (requestMethod.equals("POST")) {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			System.out.println("> EditHandler.doPost() Exception...");

			int seq = Integer.parseInt(request.getParameter("seq"));		
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			int tag = Integer.parseInt( request.getParameter("tag") );
			String content = request.getParameter("content");

			BoardDTO dto = new BoardDTO().builder()
					.seq(seq)
					.pwd(pwd)
					.email(email)
					.title(title)
					.tag(tag)
					.content(content)				
					.build();

			Connection conn = DBConn.getConnection();
			BoardDAO dao = new BoardDAOImpl(conn);

			int rowCount = 0;

			try {
				rowCount = dao.update(dto);
			}catch (Exception e) {
				System.out.println("> Edit.doPost() Exception...");
				e.printStackTrace();
			} finally {
				DBConn.close();
			}

			// 리다이렉트
			String location = "/jspPro/board/view.do?seq="+ seq;
			// response.sendRedirect(location);

			PrintWriter out = response.getWriter();

			if (rowCount == 1) {
				out.println("<script>");
				out.println("alert('글이 성공적으로 작성되었습니다.');");
				out.println("location.href='"+ location+"'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('글 작성에 실패했습니다. 다시 시도해주세요.');");
				out.println("history.back();");
				out.println("</script>");
			}


		}

		return null;
	}

}
