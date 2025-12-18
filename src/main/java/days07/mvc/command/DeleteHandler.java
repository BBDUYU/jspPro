package days07.mvc.command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;  
import com.util.DBConn;
 
import days04.board.domain.BoardDTO; 
import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;

public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// "GET" "POST"
		String requestMethod = request.getMethod();

		if (requestMethod.equals("GET")) {			
			System.out.println("> DeleteHandler.process() ...Get...");
			return "/days07/board/delete.jsp"; 			
		} else if (requestMethod.equals("POST") ){  
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			System.out.println("> DeleteHandlder.process() ...Post...");		 

			int seq = Integer.parseInt(request.getParameter("seq"));
			String pwd = request.getParameter("pwd"); // 입력받은 비밀번호

			Connection conn = ConnectionProvider.getConnection(); 
			BoardDAO dao = new BoardDAOImpl(conn);

			int rowCount = 0;
			String originalPwd ; // 실제 게시글 비밀번호

			String location = "/jspPro/board/";

			try {
				originalPwd = dao.getOriginalPwd(seq);
				if(originalPwd.equals(pwd)) { // 작성자 확인
					rowCount = dao.delete(seq);
					location += "list.do?delete=success&seq="+seq;
				}else { 
					location += "view.do?seq="+seq+"&delete=fail";
				}
			} catch (Exception e) {
				System.out.println("> DeleteHandler.doPost() Exception...");
				e.printStackTrace();
			} finally {
				conn.close();
			} // try


			// 리다이렉트

			response.sendRedirect(location);
		} // if

		return null;
	}

}
