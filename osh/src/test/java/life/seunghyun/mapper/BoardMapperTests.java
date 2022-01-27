package life.seunghyun.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import life.seunghyun.domain.BoardVO;
import life.seunghyun.domain.Criteria;
import life.seunghyun.mapper.BoardMapper;
import lombok.extern.log4j.Log4j;

	
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Autowired
	private BoardMapper mapper;
	private Object service;
	
	@Test
	public void testGetTotalList() {
		log.info(mapper.getTotalCount(new Criteria()));
	}
	@Test
	public void testGetList() {
		mapper.getList().forEach(log::info);

	}
	@Test
	public void testGetListWithPaging() {
		mapper.getListWithPaging(new Criteria(5,20)).forEach(log::info);

	}
	
	@Test
	public void testInsert() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("단위 테스트 작성 제목111");
		boardVO.setContent("단위 테스트 작성 내용222");
		boardVO.setWriter("newbie");
		
		mapper.insert(boardVO);
		log.info(boardVO);
	}
	@Test
	public void tsetUpdate() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("수정된 단위 테스트 작성 제목333");
		boardVO.setContent("수정된 단위 테스트 작성 내용444");
		boardVO.setWriter("newbie");
		boardVO.setBno(5L);
		
		log.info(mapper.update(boardVO));
	}
	@Test
	public void testInsertSelectKey() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("단위 테스트 작성 제목333");
		boardVO.setContent("단위 테스트 작성 내용444");
		boardVO.setWriter("newbie");
		
		mapper.insert(boardVO);
		log.info(boardVO);
	}
	
	
	@Test
	public void testRead() {
//		log.info(mapper.read(1L));
		log.info(mapper.read(393403L));
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete(3L));
	}
	
	@Test
	public void testGetTotalCount() {
		Criteria criteria = new Criteria();
		criteria.setType("TCW");
		criteria.setKeyword("service");
		log.info(mapper.getTotalCount(criteria));
	}
	
	@Test
	public void testSearch() {
		Criteria criteria = new Criteria();
		criteria.setType("TCW");
//		criteria.setKeyword("UNION NULL, NULL, NULL, NULL, NULL, NULL SELECT * FROM TBL_BOARD --");
		criteria.setKeyword("service");
		mapper.getListWithPaging(criteria);
	}

}
