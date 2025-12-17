package days08;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import days06.MemberInfo;


//@WebServlet("/days08/sessionAndServlet.htm")
public class SessionAndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SessionAndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> SessionAndServlet.doGet()...");
		//1) request.getSession() == request.getSession(true)
		//		ㄴ 세션이 존재하면 존재하는 세션객체를 반환
		//		ㄴ 		존재하지 않으면 세션을 새로 생성해서 반환
		//2) request.getSession(false)
		//		ㄴ 세션이 존재하면 존재하는 세션객체를 반환
		//		ㄴ 		존재하지 않으면 null 반환
		
		//로그인한 회원정보
		MemberInfo mi = new MemberInfo();
		mi.setId("admin");
		mi.setName("관리자");
		mi.setPassword("1234");
		mi.setEmail("admin@1234");
		
		HttpSession session = request.getSession();
		session.setAttribute("auth", mi);
		
		//
		MemberInfo mm = (MemberInfo)session.getAttribute("auth");
		// (주의)
	      /*
	      HttpSession session= request.getSession();
	      if( session == null) {
	         
	      }
	      */
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
