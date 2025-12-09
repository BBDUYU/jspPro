package days02;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet(
      description = "두 번째 @WebServlet 어노테이션 사용 서블릿 등록", 
      urlPatterns = { 
            "/days02/Now", 
            "/now"
      })*/
public class Now extends HttpServlet {
   private static final long serialVersionUID = 1L;
       

    public Now() {
        super();
    }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	  response.setContentType("text/html; charset=UTF-8");
	   
	  Date now = new Date();
	  String pattern = "yyyy-MM-dd hh:mm:ss";
	  SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	  String strNow=sdf.format(now);
      PrintWriter out = response.getWriter();
      
      out.write("<!DOCTYPE html>");
      out.write("<html>");
      out.write("<head>");
      out.write("<meta charset='UTF-8'>");
      out.write("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
      out.write("<title>2025. 12. 9. 오후 4:07:55</title>");
      out.write("<link rel='shortcut icon' type='image/x-icon' href='http://localhost/jspPro/images/SiSt.ico'>");
      out.write("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'></script>");
      out.write("<link rel='stylesheet' href='http://localhost/jspPro/resources/cdn-main/example.css'>");
      out.write("<script src='http://localhost/jspPro/resources/cdn-main/example.js'></script>");
      out.write("<style>");
      out.write("</style>");
      out.write("</head>");
      out.write("<body>");;
      out.write("<header>");
      out.write("  <h1 class='main'><a href='#' style='position: absolute;top:30px;'>CHacha's Home</a></h1>");
      out.write("  <ul>");
      out.write("    <li><a href='#'>로그인</a></li>");
      out.write("    <li><a href='#'>회원가입</a></li>");
      out.write("  </ul>");
      out.write("</header>");
      out.write("<div>");
      out.write("  <xmp class='code'> ");
      out.write("  </xmp>");
      
      out.write(String.format("<h3> 현재 날짜 시간 : %s </h3>", strNow));
      
      out.write("</div>");
      out.write("<script>");
      out.write("</script>");
      out.write("</body>");
      out.write("</html>");
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}
