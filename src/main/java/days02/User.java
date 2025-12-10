package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet({ "/User", "/question/user.htm" })
public class User extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public User() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		System.out.println("> User.doGet()");
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		PrintWriter out = response.getWriter();

		
		out.println("<html>");
		out.println("<head><title>인사</title></head>");		
		out.println("<body>");
		out.println("> method : get<br>");
		out.println("> name : "+name+"<br>");
		out.println("> age : "+age+"<br>");
		out.println("</body>");
		out.println("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("> User.doPost()");
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		PrintWriter out = response.getWriter();

		
		out.println("<html>");
		out.println("<head><title>인사</title></head>");		
		out.println("<body>");
		out.println("> method : post<br>");
		out.println("> name : "+name+"<br>");
		out.println("> age : "+age+"<br>");
		out.println("</body>");
		out.println("</html>");
	}

}
