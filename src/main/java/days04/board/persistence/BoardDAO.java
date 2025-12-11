package days04.board.persistence;

import java.sql.SQLException;
import java.util.List;

import days04.board.domain.BoardDTO;

public interface BoardDAO {

	// 1. 게시글 목록 조회 + 페이징 처리 X
	List<BoardDTO> select() throws SQLException;
	
	// 1-2. 게시글 목록 조회 + 페이징 처리 O
	// 매개변수 : 현재 페이지 변호 
	//			한 페이지에 출력할 게시글 수
	List<BoardDTO> select(int currentPage, int numberPerPage) throws SQLException;
	
	// 2. 게시글 작성(새 글쓰기)
	int insert(BoardDTO dto) throws SQLException;

	// 3. 조회수 증가
	int increaseReaded(int seq) throws SQLException;

	// 3-2. 게시글 상세 보기
	BoardDTO view(int seq) throws SQLException;

	// 4. 게시글 삭제
	int delete(int seq) throws SQLException;

	// 5. 게시글 수정
	int update(BoardDTO dto) throws SQLException;

	// 6. 게시글 검색
	List<BoardDTO> search(String condition, String keyword) throws SQLException;
	
	// 6-2. 페이징 처러 O
	List<BoardDTO> search(String condition, String keyword, int currentPage, int numberPerPage);

	// 7. 총 페이지 수 반환
	int getTotalPages(int numberPerPage) throws SQLException;

	// 7-2. 검색 + 총 페이지수 반환
	int getTotalPages(int numberPerPage, String condition, String keyword) throws SQLException;

	
	
}
