package life.seunghyun.service;

import java.util.List;

import life.seunghyun.domain.BoardAttachVO;
import life.seunghyun.domain.BoardVO;
import life.seunghyun.domain.Criteria;

public interface BoardService {
	void register(BoardVO boardVO); // 글등록
	
	BoardVO get(Long bno); // 상세 조회
	
	boolean modify(BoardVO boardVO); // 글 수정
	
	boolean remove(Long bno); // 글 삭제 
	
//	List<BoardVO> getList(); // 목록 조회
	List<BoardVO> getList(Criteria cri); // 페이징 처리가 된 목록 조회
	
	int getTotal(Criteria cri);
	
	List<BoardAttachVO> getAttachList(Long bno);

}
