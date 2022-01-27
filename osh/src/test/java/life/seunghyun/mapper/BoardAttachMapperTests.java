package life.seunghyun.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import life.seunghyun.mapper.BoardAttachMapper;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardAttachMapperTests {
	@Autowired
	private BoardAttachMapper attachMapper;
	
	@Test
	public void test() {
		log.info(attachMapper);
	}
	
	@Test
	public void testFindBy() {
		long bno = 393415;
		attachMapper.findBy(bno).forEach(log::info);
	}
	
	@Test
	public void testDeleteAllComplete() {
		attachMapper.deleteAllComplete();
	}
}
