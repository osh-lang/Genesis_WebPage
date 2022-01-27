package life.seunghyun.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample")
@Log4j
public class SampleController {
	@GetMapping("all")
	public void doAll() {
		
	}
	@GetMapping("member")
	public void doMember() {
		
	}
	@GetMapping("admin")
	public void doAdmin() {
		
	}
	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
	@GetMapping("annoMember")
	public void doMember2() {
		log.info("doMember2()...");
		
	}
	@Secured("ROLE_ADMIN")
	@GetMapping("annoAdmin")
	public void doAdmin2() {
		log.info("doAdmin()....");
	}
//	@Autowired
//	private BoardService boardService;
//	
//	@GetMapping(value="getText", produces="text/plain; charset=utf-8")
//	public String getText() {
//		log.info("Mime type :: " + MediaType.TEXT_PLAIN_VALUE);
//		return "?ïà?Éê?Ñ∏?ó¨";
//	}
//	
//	@GetMapping("getSample")
//	public SampleVO getSample() {
//		return new SampleVO(112, "?ä§??", "Î°úÎìú");
//	}
//	
//	@GetMapping("listTest")
//	public List<BoardVO> getList() {
//		return boardService.getList(new Criteria());
//	}
//	
//	@GetMapping("listTest2")
//	public List<SampleVO> getList2() {
//		return IntStream.range(1, 10).mapToObj(i -> new SampleVO(i, i + "first", i + "last")).collect(Collectors.toList());
//	}
//	
//	@GetMapping(value="check", params={"height", "weight"})
//	public ResponseEntity<SampleVO> check(Double height, Double weight) {
//		SampleVO vo = new SampleVO(0, ""+height, ""+weight);
//		
//		ResponseEntity<SampleVO> result = null;
//		
//		if(height < 150) {
//			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
//		}
//		else {
//			result = ResponseEntity.status(HttpStatus.OK).body(vo);
//		}
//		return result;
//	}
//	@GetMapping("product")
//	public String[] getPath(String cat, Integer pid) {
//		return new String[] {"category : " + cat, "productid : " + pid}; 
//	}
//	@GetMapping("product/{cat}/{pid}")
//	public String[] getPath2(@PathVariable String cat, @PathVariable Integer pid) {
//		return new String[] {"category : " + cat, "productid : " + pid}; 
//	}
//	
//	@PostMapping("ticket")
//	public Ticket convert(@RequestBody Ticket ticket) {
//		log.info(ticket);
//		return ticket;
//	}
}
