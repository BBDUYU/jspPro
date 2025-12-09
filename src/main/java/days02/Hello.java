package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//super.service(request, response);
				//html 생성해서 응답
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				String pName=request.getParameter("name");
				
				
				out.println("<html>");
				out.println("<head><title>인사</title></head>");		
				out.println("<body>");
				out.println("안녕하세요");
				out.println("홍길동님");
				out.println("</body>");
				out.println("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
/*
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	*/
}
