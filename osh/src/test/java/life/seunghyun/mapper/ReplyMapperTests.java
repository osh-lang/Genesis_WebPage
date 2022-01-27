package life.seunghyun.mapper;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import life.seunghyun.domain.Criteria;
import life.seunghyun.domain.ReplyVO;
import life.seunghyun.mapper.ReplyMapper;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	@Autowired
	private ReplyMapper replyMapper;
	
	@Test
	public void testExist() {
		log.info(replyMapper);
	}
	@Test
	public void testInsert() {
		IntStream.range(1, 21).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			vo.setBno(393325L);
			vo.setReply("junit에서 작성한 댓글 :: " + i);
			vo.setReplyer(i + "번째 댓글러");
			
			replyMapper.insert(vo);
		});
	}
	@Test
	public void testInsert2() {
			Map<String, Object> vo = new HashMap<String, Object>();
			vo.put("bno", 393325L);
			vo.put("reply", "맵으로 작성한 댓글");
			vo.put("replyer", "맵작성자");
			replyMapper.insert2(vo);
	}
		
	@Test
	public void testGetList() {
		replyMapper.getListWithPaging(new Criteria(2, 10), 393325L).forEach(log::info);
	}
	@Test
	public void testGetList2() {
		replyMapper.getListWithPaging(new Criteria(), 393325L).forEach(log::info);
	}
	@Test
	public void testGetListShowMore() {
		replyMapper.getListWithShowMore(13L, 393325L).forEach(log::info);
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(393325L);
		vo.setReply("junit에서 수정한 댓글");
		vo.setReplyer("댓글러");
		vo.setRno(6L);
		log.info(replyMapper.update(vo));
	}
	@Test
	public void testRead() {
		log.info(replyMapper.read(6L));
	}
	@Test
	public void testDelete() {
		log.info(replyMapper.delete(3L));
	}
	
	
}
