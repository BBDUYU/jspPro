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

public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// "GET" "POST"
		String requestMethod = request.getMethod();

		if (requestMethod.equals("GET")) {			
			System.out.println("> WriteHandler.process() ...Get...");
			return "/days07/board/write.jsp"; 			
		} else if (requestMethod.equals("POST") ){  
			request.setCharacterEncoding("UTF-8");

			System.out.println("> WriteHandler.process() ...POst...");

			String writer = request.getParameter("writer");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			int tag = Integer.parseInt( request.getParameter("tag") );
			String content = request.getParameter("content");

			BoardDTO dto = new BoardDTO().builder()
					.writer(writer)
					.pwd(pwd)
					.email(email)
					.title(title)
					.tag(tag)
					.content(content)				
					.build();

			Connection conn = ConnectionProvider.getConnection();
			BoardDAO dao = new BoardDAOImpl(conn);

			int rowCount = 0;

			try {
				rowCount = dao.insert(dto);
			}catch (Exception e) {
				System.out.println("> WriteHandler.process() Post() Exception...");
				e.printStackTrace();
			} finally {
				conn.close();
			}

			// 리다이렉트
			String location = "/jspPro/board/list.do";
			response.sendRedirect(location);
		} // if

		return null;
	}

}
