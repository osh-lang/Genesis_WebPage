package life.seunghyun.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import life.seunghyun.domain.BoardVO;
import life.seunghyun.domain.Criteria;
import life.seunghyun.service.BoardService;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	@Autowired
	private BoardService service;
	@Test
	public void testExist() {
		assertNotNull(service);
		log.info(service);
	}
	@Test
	public void testRegister() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("단위 테스트 작성 제목 in Service");
		boardVO.setContent("단위 테스트 작성 내용 in Service");
		boardVO.setWriter("newbie");
		
		service.register(boardVO);
		log.info("생성된 게시글의 번호: " + boardVO.getBno());
	}
	@Test
	public void testGetList() {
		service.getList(new Criteria()).forEach(log::info);
	}
	@Test
	public void tsetModify() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("수정된 단위 테스트 작성 in Service");
		boardVO.setContent("수정된 단위 테스트 작성 in Service");
		boardVO.setWriter("newbie");
		boardVO.setBno(5L);
		
		log.info(service.modify(boardVO));
	}
	
	
	@Test
	public void testRead() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		log.info(service.remove(3L));
	}
}
