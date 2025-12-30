package days15.replyboard.domain;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.DBConn;

import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;
import lombok.Getter;

// System.out.println("\t\t PREV    [1] 2 3 4 5 6 7 8 9 10   NEXT");
@Getter
public class PageVO {
	
	private int currentPage = 1;
	private int numberPerPage = 10;

	private boolean prev;
	private boolean next;	
	private int start;
	private int end;
	 	
	public PageVO(int currentPage, int numberPerPage, int numberOfPageBlock) {
		
		this.currentPage = currentPage;
		this.numberPerPage = numberPerPage;
		
		int totalPages;
		
		
		
		try(Connection conn = DBConn.getConnection()) {
			
			BoardDAO dao = new BoardDAOImpl(conn);
			
			totalPages = dao.getTotalPages(numberPerPage);
			start = (currentPage-1)/numberOfPageBlock  * numberOfPageBlock+1;
			end = start + numberOfPageBlock -1;
			if( end > totalPages ) end = totalPages; 
			
			if( start != 1 ) this.prev = true;
			if( end != totalPages ) this.next = true;
			
		} catch (SQLException e) { 
			e.printStackTrace();
		}
	}

	public PageVO(int currentPage, int numberPerPage
			, int numberOfPageBlock
			, String condition, String keyword) {
		
		this.currentPage = currentPage;      //
		this.numberPerPage = numberPerPage;  //

		int totalPages;
		
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		
		try {
			totalPages = dao.getTotalPages(
					numberPerPage
					, condition, keyword);
			
			start = (currentPage-1)/numberOfPageBlock  * numberOfPageBlock+1;
			end = start + numberOfPageBlock -1;
			if( end > totalPages ) end = totalPages; 
			
			if( start != 1 ) this.prev = true;
			if( end != totalPages ) this.next = true;
			
		} catch (SQLException e) { 
			e.printStackTrace();
		}
	}

}
