package life.seunghyun.service;

import java.util.List;

import life.seunghyun.domain.Criteria;
import life.seunghyun.domain.ReplyPageDTO;
import life.seunghyun.domain.ReplyVO;

public interface ReplyService {
	int register(ReplyVO vo);
	
	ReplyVO get(Long rno);
	
	int modify(ReplyVO vo);
	
	int remove(Long rno);
	
	List<ReplyVO> getList(Criteria cri, Long bno);
	
	ReplyPageDTO getListPage(Criteria cri, Long bno);
	
	List<ReplyVO> getListMore(Long rno, Long bno);
	
}
