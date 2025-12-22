package days11;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

@WebServlet("*.ss")
public class FileTestServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
      
    public FileTestServlet() {
        super(); 
    } 
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
       response.setContentType("text/html; charset=UTF-8");
       
       String uri = request.getRequestURI(); // list.ss, write.ss, update.ss 등등
       
       Connection conn = null;
       String saveDirectory = null;
       
       try {
          conn = ConnectionProvider.getConnection();
          FileTestDAO dao = FileTestDAO.getInstance(); // 싱글톤
          // 
          saveDirectory = request.getServletContext().getRealPath("/days11/upload");
          System.out.println(saveDirectory);
          
          if(uri.endsWith("list.ss")) { // 자료실 목록 보기
             ArrayList<FileTestDTO> list = dao.selectFileList(conn);
             request.setAttribute("list", list);
             // 포워딩
             String path = "/days11/ex01_list.jsp";
             RequestDispatcher dispatcher = request.getRequestDispatcher(path);
             dispatcher.forward(request, response);
             
          }else if(uri.endsWith("write.ss")) { // 글쓰기 + write.jsp
             // 포워딩
             String path = "/days11/ex01_write.jsp";
             RequestDispatcher dispatcher = request.getRequestDispatcher(path);
             dispatcher.forward(request, response);
             
             
          }else if(uri.endsWith("write_ok.ss")) { // 글쓰기 저장
        	  
        	//  System.out.println("write_ok.ss 호출됨..");
        	  
             File f = new File(saveDirectory);
             if(!f.exists())f.mkdirs();
             
             int maxPostSize=5*1024*1024;
             String encoding="UTF-8";
             FileRenamePolicy policy=new DefaultFileRenamePolicy();
             
             MultipartRequest multiRequest = new MultipartRequest(
            		 request, 
            		 saveDirectory,
            		 maxPostSize,
            		 encoding,
            		 policy
            		 );
             
             FileTestDTO dto = new FileTestDTO();
             String subject = multiRequest.getParameter("subject");
             dto.setSubject(subject);
             
             File attachFile = multiRequest.getFile("attachFile");
             if(attachFile != null) {
            	 String fileName = attachFile.getName();
            	 long filelength = attachFile.length();
            	 String originalFileName = multiRequest.getOriginalFileName("attachFile");
            	 String fileSystemName=multiRequest.getFilesystemName("attachFile");
            	 
            	 dto.setFilelength(filelength);
            	 dto.setOriginalfilename(originalFileName);
            	 dto.setFilesystemname(fileSystemName);
             }
             
             int rowCount = dao.insert(conn, dto);
             response.sendRedirect("list.ss");
            		 
          }else if(uri.endsWith("delete.ss")) { // 삭제
             int num = Integer.parseInt(request.getParameter("num"));
             String filesystemname = request.getParameter("filesystemname");
             int rowCount = dao.delete(conn, num);
             
             String pathname=String.format("%s\\%s", saveDirectory,filesystemname);
             File deleteFile = new File(pathname);
             if(deleteFile.exists()) {
            	 deleteFile.delete();
             }
             response.sendRedirect("list.ss");
          }else if(uri.endsWith("update.ss")) { // 수정 + update.jsp
        	// update.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}
              int num = Integer.parseInt(request.getParameter("num"));
              FileTestDTO dto = dao.selectOne(conn, num);
              request.setAttribute("dto", dto); 
              String path = "/days12/ex01_update.jsp";
              RequestDispatcher dispatcher = request.getRequestDispatcher(path);
              dispatcher.forward(request, response);
          }else if(uri.endsWith("update_ok.ss")) { // 수정 저장
             
          }
             
          
          
       } catch (Exception e) {
          e.printStackTrace();
       } finally {
         JdbcUtil.close(conn);
      }
    }
    
    
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   doGet( request,  response );
   }
   

}






