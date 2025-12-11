package days04.board.domain;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.DBConn;

import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;
import lombok.Getter;
 
@Getter
public class PageVO {

   // 이전 버튼
   private boolean prev;
   // 다음 버튼
   private boolean next;

   private int start;
   private int end;

   public PageVO(int currentPage, int numberPerPage, int numberOfPageBlock ) {

      int totalPages;

      Connection conn = DBConn.getConnection();
      BoardDAO dao = new BoardDAOImpl(conn);

      try {

         totalPages = dao.getTotalPages(numberPerPage);
         start = (currentPage-1)/numberOfPageBlock  * numberOfPageBlock+1;
         end = start + numberOfPageBlock -1;
         
         if (end > totalPages) end = totalPages;
         if (start != 1) this.prev = true;
         if (end != totalPages) this.next = true;
         

      } catch (SQLException e) {

         e.printStackTrace();

      }


   }

   public PageVO(int currentPage, int numberPerPage, int numberOfPageBlock, String condition, String keyword) {
      
      int totalPages;

      Connection conn = DBConn.getConnection();
      BoardDAO dao = new BoardDAOImpl(conn);

      try {

         totalPages = dao.getTotalPages(numberPerPage, condition, keyword); // 검색 결과에 맞는 총 페이지 수 (condition, keyword 추가)
         start = (currentPage-1)/numberOfPageBlock  * numberOfPageBlock+1;
         end = start + numberOfPageBlock -1;
         
         if (end > totalPages) end = totalPages;
         if (start != 1) this.prev = true;
         if (end != totalPages) this.next = true;
         

      } catch (SQLException e) {

         e.printStackTrace();

      }
      
   }

}
