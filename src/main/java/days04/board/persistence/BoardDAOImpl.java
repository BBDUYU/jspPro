package days04.board.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.doit.domain.DeptVO;

import com.util.DBConn;

import days04.board.domain.BoardDTO;

public class BoardDAOImpl implements BoardDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private BoardDTO vo = null;

	// 1. 생성자 DI 
	public BoardDAOImpl() {
		super(); 
	} 
	public BoardDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	// 2. Setter DI
	public void setConn(Connection conn) {
		this.conn = conn;
	} 
	public Connection getConn() {
		return conn;
	}

	@Override
	public List<BoardDTO> select() throws SQLException {

		String sql = "SELECT seq, title, writer, email, writedate, readed \r\n"
				+ "FROM tbl_cstvsboard\r\n"
				+ "ORDER BY seq DESC";

		ArrayList<BoardDTO> list = null;

		int seq;
		String title, writer, email;
		Date writedate;
		int readed;

		try {			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<BoardDTO>();
				do {
					// seq, title, writer, email, writedate, readed
					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");

					vo = new BoardDTO().builder()
							.seq(seq)
							.title(title)
							.writer(writer)
							.email(email)
							.writedate(writedate)
							.readed(readed)
							.build();

					list.add(vo);

				} while (rs.next());

			}

		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		} 

		return list;
	}

	// try ~ catch 블럭 삭제한다. 
	@Override
	public int insert(BoardDTO dto) throws SQLException {
		String sql = "INSERT INTO tbl_cstvsboard \r\n"
				+ "(seq, writer, pwd, email, title, tag, content)\r\n"
				+ "VALUES (seq_tbl_cstvsboard.NEXTVAL, ?, ?, ?, ?, ?, ?)";

		int rowCount = 0;

		try {
			pstmt =  conn.prepareStatement(sql);
			// ?, ?, ?, ?, ?, ?
			// writer, pwd, email, title, tag, content
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getTitle());
			pstmt.setInt(5, dto.getTag());
			pstmt.setString(6, dto.getContent());

			rowCount = pstmt.executeUpdate();

		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		} 

		return rowCount;
	}

	@Override
	public int increaseReaded(int seq)  throws SQLException{
		String sql = "UPDATE tbl_cstvsboard "
				+ " SET readed = readed + 1 "
				+ " WHERE seq = ? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, seq);
		int rowCount = this.pstmt.executeUpdate();
		return rowCount;
	}

	@Override
	public BoardDTO view(int seq)  throws SQLException{

		String sql = 
				"SELECT seq, title, writer, email, writedate, readed, content \r\n"
						+ "FROM tbl_cstvsboard \r\n"
						+ "WHERE seq = ? ";

		this.vo = null;

		String title, writer, email, content;
		Date writedate;
		int readed;


		pstmt = conn.prepareStatement(sql);
		// ?
		pstmt.setInt(1, seq);
		rs = pstmt.executeQuery();

		if (rs.next()) {

			// seq, title, writer, email, writedate, readed
			seq = rs.getInt("seq");
			title = rs.getString("title");
			writer = rs.getString("writer");
			email = rs.getString("email");
			writedate = rs.getDate("writedate");
			readed = rs.getInt("readed");
			content = rs.getString("content");

			vo = new BoardDTO().builder()
					.seq(seq)
					.title(title)
					.writer(writer)
					.email(email)
					.writedate(writedate)
					.readed(readed)
					.content(content)
					.build();
		} // if

		if( rs != null ) rs.close();
		if( pstmt != null ) pstmt.close();

		return this.vo;
	}

	// [A]
	public int delete(long seq, String pwd) throws SQLException {

		String sql = "DELETE FROM tbl_cstvsboard "
				+ " WHERE seq = ? AND pwd = ? ";
		int rowCount = 0;

		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setLong(1, seq);
		this.pstmt.setString(2, pwd);
		rowCount = this.pstmt.executeUpdate();
		if(this.pstmt != null) this.pstmt.close();   
		return rowCount;

	}

	@Override
	public int delete(int seq) throws SQLException {

		String sql ="DELETE FROM tbl_cstvsboard \r\n"
				+ "WHERE seq = ? ";

		int rowCount = 0;
		pstmt = conn.prepareStatement(sql); 
		pstmt.setInt(1, seq);
		rowCount = pstmt.executeUpdate();
		if( pstmt != null ) pstmt.close();

		// 삭제된 행이 없으면 예외 발생 
		if (rowCount == 0) {
			throw new SQLException("삭제할 데이터가 존재하지 않습니다. seq=" + seq);
		}


		return rowCount;

	}

	@Override
	public int update(BoardDTO dto) throws SQLException {

		String sql = "UPDATE tbl_cstvsboard "
				+ " SET email = ?, title = ?, content = ?, tag = ? "
				+ " WHERE seq = ? AND pwd = ? ";

		int rowCount = 0;
		pstmt = conn.prepareStatement(sql); 

		pstmt.setString(1, dto.getEmail() );
		pstmt.setString(2, dto.getTitle() );
		pstmt.setString(3, dto.getContent() );
		pstmt.setInt(4, dto.getTag() );
		pstmt.setInt(5, dto.getSeq() );
		pstmt.setString(6, dto.getPwd() );

		rowCount = pstmt.executeUpdate();
		if( pstmt != null ) pstmt.close();
		return rowCount;
	}

	@Override
	public List<BoardDTO> search(String condition, String keyword) throws SQLException {
		String sql = "SELECT seq, title, writer, email, writedate, readed \r\n"
				+ " FROM tbl_cstvsboard\r\n"
				+ " WHERE ";
		// WHERE 조건절 
		switch (condition) {
		case "t":	
			sql += " REGEXP_LIKE( title , ? , 'i') ";
			break;
		case "c":
			sql += " REGEXP_LIKE( content , ? , 'i') ";
			break;
		case "w":
			sql += " REGEXP_LIKE( writer , ? , 'i') ";
			break;
		case "tc":
			sql += " REGEXP_LIKE( title , ? , 'i') OR REGEXP_LIKE( content , ? , 'i') ";
			break;	 
		}

		sql += " ORDER BY seq DESC";

		ArrayList<BoardDTO> list = null;

		int seq;
		String title, writer, email;
		Date writedate;
		int readed;

		try {			
			pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, keyword);
			if( condition.equals("tc") ) this.pstmt.setString(2, keyword); 
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<BoardDTO>();
				do {
					// seq, title, writer, email, writedate, readed
					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");

					vo = new BoardDTO().builder()
							.seq(seq)
							.title(title)
							.writer(writer)
							.email(email)
							.writedate(writedate)
							.readed(readed)
							.build();

					list.add(vo);

				} while (rs.next());

			}

		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		} 

		return list;
	}

	@Override
	public List<BoardDTO> select(int currentPage, int numberPerPage) throws SQLException {

		String sql = "SELECT *\r\n"
				+ "FROM (\r\n"
				+ "    SELECT ROWNUM AS RNUM, A.*\r\n"
				+ "    FROM (\r\n"
				+ "        SELECT seq, title, writer, email, writedate, readed\r\n"
				+ "        FROM tbl_cstvsboard\r\n"
				+ "        ORDER BY seq DESC\r\n"
				+ "    ) A\r\n"
				+ "    WHERE ROWNUM <= ?  \r\n"   // ? end
				+ ")\r\n"
				+ "WHERE RNUM >= ?";              // ? start

		ArrayList<BoardDTO> list = null;

		int seq;
		String title, writer, email;
		Date writedate;
		int readed;

		int start = (currentPage-1)*numberPerPage + 1;
		int end = start + numberPerPage -1;		 

		try {			
			pstmt = conn.prepareStatement(sql);
			// ? end
			pstmt.setInt(1, end);
			// ? start
			pstmt.setInt(2, start);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<BoardDTO>();
				do {
					// seq, title, writer, email, writedate, readed
					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");

					vo = new BoardDTO().builder()
							.seq(seq)
							.title(title)
							.writer(writer)
							.email(email)
							.writedate(writedate)
							.readed(readed)
							.build();

					list.add(vo);

				} while (rs.next());

			}

		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		} 

		return list;
	}

	@Override
	public int getTotalPages(int numberPerPage) throws SQLException {
		String sql = "SELECT CEIL(COUNT(*)/?)"
				+ " FROM tbl_cstvsboard";              

		int totalPages = 0;	 

		try {			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, numberPerPage); 
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalPages = rs.getInt(1);
			}

		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		} 

		return totalPages;
	}

	@Override
	public List<BoardDTO> search(String condition, String keyword
			, int currentPage, int numberPerPage) {

		String sql = "SELECT *\r\n"
				+ "FROM (\r\n"
				+ "    SELECT ROWNUM AS RNUM, A.*\r\n"
				+ "    FROM (\r\n"
				+ "        SELECT seq, title, writer, email, writedate, readed\r\n"
				+ "        FROM tbl_cstvsboard\r\n"
				+ "        WHERE ";

		// WHERE 조건절 
		switch (condition) {
		case "t":	
			sql += " REGEXP_LIKE( title , ? , 'i') ";
			break;
		case "c":
			sql += " REGEXP_LIKE( content , ? , 'i') ";
			break;
		case "w":
			sql += " REGEXP_LIKE( writer , ? , 'i') ";
			break;
		case "tc":
			sql += " REGEXP_LIKE( title , ? , 'i') OR REGEXP_LIKE( content , ? , 'i') ";
			break;	 
		}

		sql += "        ORDER BY seq DESC\r\n"
				+ "    ) A\r\n"
				+ "    WHERE ROWNUM <= ?  \r\n"   // ? end
				+ ")\r\n"
				+ "WHERE RNUM >= ?";              // ? start

		System.out.println(sql);

		ArrayList<BoardDTO> list = null;

		int seq;
		String title, writer, email;
		Date writedate;
		int readed;

		int start = (currentPage-1)*numberPerPage + 1;
		int end = start + numberPerPage -1;	

		try {			
			pstmt = conn.prepareStatement(sql);

			this.pstmt.setString(1, keyword);

			if( condition.equals("tc") ) {
				this.pstmt.setString(2, keyword); 
				this.pstmt.setInt(3, end);
				this.pstmt.setInt(4, start);
			}else {
				this.pstmt.setInt(2, end);
				this.pstmt.setInt(3, start);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<BoardDTO>();
				do {
					// seq, title, writer, email, writedate, readed
					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");

					vo = new BoardDTO().builder()
							.seq(seq)
							.title(title)
							.writer(writer)
							.email(email)
							.writedate(writedate)
							.readed(readed)
							.build();

					list.add(vo);

				} while (rs.next());

			}

		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		} 

		return list;
	}
	@Override
	public int getTotalPages(int numberPerPage, String condition
			, String keyword) {

		String sql = "SELECT CEIL(COUNT(*)/?)"
				+ " FROM tbl_cstvsboard"
				+ " WHERE ";  

		// WHERE 조건절 
		switch (condition) {
		case "t":   
			sql += " REGEXP_LIKE( title , ? , 'i') ";
			break;
		case "c":
			sql += " REGEXP_LIKE( content , ? , 'i') ";
			break;
		case "w":
			sql += " REGEXP_LIKE( writer , ? , 'i') ";
			break;
		case "tc":
			sql += " REGEXP_LIKE( title , ? , 'i') OR REGEXP_LIKE( content , ? , 'i') ";
			break;    
		}

		int totalPages = 0;	 

		try {			
			pstmt = conn.prepareStatement(sql); 

			pstmt.setInt(1, numberPerPage);

			this.pstmt.setString(2, keyword); 
			if( condition.equals("tc")) 
				this.pstmt.setString(3, keyword); 

			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalPages = rs.getInt(1);
			}

		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		} 

		return totalPages;
	}
	
	@Override
	public String getOriginalPwd(int seq) throws SQLException {
		String  originalPwd = null;
		
		String sql =   "  SELECT pwd "
				+ " FROM tbl_cstVSBoard "
				+ " WHERE seq = ? "; 
		
		try {
			pstmt = conn.prepareStatement(sql);
			this.pstmt.setInt(1, seq); 
			rs = pstmt.executeQuery();
			if (rs.next()) { 
				originalPwd = rs.getString("pwd"); 
			} // if
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return originalPwd;
	}

}









