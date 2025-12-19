package days10;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

//@WebServlet("/UploadServlet")
//@MultipartConfig()
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public UploadServlet() {
        super(); 
    } 
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<body>");
		
		String contentType = request.getContentType();
		// "multipart/form-data; boundary=----WebKitFormBoundary70HwoYveJK9k6a3W"
		if (contentType != null 
				&& contentType.toLowerCase().startsWith("multipart/")) {			
			printPartInfo(request, out);
		} else {
			out.print("> multipart 아니다. ");
		} // 
		
		out.print("</body>"); 
		out.print("</html>");
	}
	
	// Part 클래스 ? 업로드된 파일 정보나 파라미터값을 구할 수 있는 여러 메서드를 가지고 있는 클래스 
	private void printPartInfo(HttpServletRequest request, PrintWriter out)
			throws IOException, ServletException {
		Collection<Part> parts = request.getParts();
		
		for (Part part : parts) {
			out.print("<br>");
			out.print("> name : " + part.getName()); // 파라미터 이름
			String contentType = request.getContentType();
			out.print("<br> > contentType : " + contentType);
			
			if( part.getHeader("Content-Disposition").contains("filename=") ) { // 첨부파일 존재 O
				
				out.print("<br> > size : "+ part.getSize());
				
				String fileName = part.getSubmittedFileName(); // 업로드된 파일 이름
				out.print("<br> > fileName : " + fileName);
				
				if (part.getSize() > 0 ) {
					part.write("C:\\temp\\" + fileName); //업로드파일 저장.
					part.delete(); // 임시 파일 삭제   
				} // if
			}else {
				String paramValue= request.getParameter( part.getName() );
				out.println("<br> > paramValue : " + paramValue );
			}
		} // for
		
	}

}






