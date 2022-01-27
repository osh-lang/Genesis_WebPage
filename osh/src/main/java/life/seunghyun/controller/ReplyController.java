package life.seunghyun.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import life.seunghyun.domain.Criteria;
import life.seunghyun.domain.ReplyPageDTO;
import life.seunghyun.domain.ReplyVO;
import life.seunghyun.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class ReplyController {
	private ReplyService service;
	
	// ?���?
	@PostMapping("new")
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info(vo);
		int insertCount = service.register(vo);
		log.info("insertCount :: " + insertCount);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 조회
	@GetMapping("{rno}")
	public ResponseEntity<ReplyVO> get(@PathVariable Long rno){
		log.info(rno);
		return new ResponseEntity<ReplyVO>(service.get(rno), HttpStatus.OK);
	}
	// ?��?��
	@RequestMapping(value = "{rno}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("rno") Long rno, @RequestBody ReplyVO vo) {
		log.info(vo);
		vo.setRno(rno);
		int updateCount = service.modify(vo);
		log.info("insertCount :: " + updateCount);
		return updateCount == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// ?��?��
	@DeleteMapping("{rno}")
	public ResponseEntity<String> remove(@PathVariable Long rno){
		log.info(rno);
		int removeCount = service.remove(rno);
		log.info("insertCount :: " + removeCount);
		return removeCount == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// ?��?���?(목록)
	@GetMapping("pages/{page}/{bno}")
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable int page, @PathVariable long bno) {
		log.info("getlist");
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	// ?��?���?(?��보기)
	@GetMapping({"more/{bno}", "more/{bno}/{rno}"})
	public ResponseEntity<List<ReplyVO>> getListMore(@PathVariable Long bno, @PathVariable Optional<Long> rno) {
		log.info("getListMore");
		return new ResponseEntity<>(service.getListMore(rno.isPresent() ? rno.get() : null, bno), HttpStatus.OK);
	}
}
