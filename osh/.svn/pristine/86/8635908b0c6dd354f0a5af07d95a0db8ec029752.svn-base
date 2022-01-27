package life.seunghyun.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import life.seunghyun.domain.BoardAttachVO;
import life.seunghyun.domain.BoardVO;
import life.seunghyun.domain.Criteria;
import life.seunghyun.mapper.BoardAttachMapper;
import life.seunghyun.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServieceImpl implements BoardService{
	private BoardMapper boardMapper;
	private BoardAttachMapper boardAttachMapper;
	
	@Override
	@Transactional
	public void register(BoardVO boardVO) {
		log.info("register..." + boardVO);
		boardMapper.insertSelectKey(boardVO);
		boardVO.getAttachList().forEach(a -> {
			a.setBno(boardVO.getBno());
			boardAttachMapper.insert(a);
		});
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return boardMapper.read(bno);
	}

	@Override
	@Transactional
	public boolean modify(BoardVO boardVO) {
		// TODO Auto-generated method stub
		log.info("modify .........." + boardVO);
		boardAttachMapper.deleteAll(boardVO.getBno());
		boardVO.getAttachList().forEach(a -> {
			a.setBno(boardVO.getBno());
			boardAttachMapper.insert(a);
		});
		return boardMapper.update(boardVO) > 0;
	}

	@Override
	@Transactional
	public boolean remove(Long bno) {
		boardAttachMapper.deleteAll(bno);
		return boardMapper.delete(bno) > 0;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
	      log.info("getList...");
	      return boardMapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
	      return boardMapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("getAttachList..." + bno);
		return boardAttachMapper.findBy(bno);
	}
	
	
}
