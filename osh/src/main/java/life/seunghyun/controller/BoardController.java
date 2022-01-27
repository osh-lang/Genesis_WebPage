package life.seunghyun.controller;

import java.io.File;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import life.seunghyun.domain.AttachFileDTO;
import life.seunghyun.domain.BoardAttachVO;
import life.seunghyun.domain.BoardVO;
import life.seunghyun.domain.Criteria;
import life.seunghyun.domain.PageDTO;
import life.seunghyun.mapper.BoardAttachMapper;
import life.seunghyun.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	@GetMapping("index")
	public void index(Criteria cri, Model model) {
		log.info("index....");
	}
	
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		log.info("list....");
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}

	@GetMapping({"get","modify"})
	public void get(@RequestParam Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get or modify....");
		model.addAttribute("board", service.get(bno));
		model.addAttribute("cri", cri);
	}

	@GetMapping("register")
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("register")
	public String register(BoardVO boardVO, RedirectAttributes rttr) {
		log.info("register.....");
		log.info(boardVO);
		boardVO.getAttachList().forEach(log::info);
		service.register(boardVO);
		log.info(boardVO);
		rttr.addFlashAttribute("result", boardVO.getBno());

		return "redirect:/board/list";
	}

	@PostMapping("modify")
	public String modify(BoardVO boardVO,  @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify.....");
		log.info(boardVO);
		boardVO.getAttachList().forEach(log::info);
		if (service.modify(boardVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}

	@PostMapping("remove")
	public String remove(@RequestParam Long bno,  @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove.....");
		
		List<BoardAttachVO> list = service.getAttachList(bno);
		
		if (service.remove(bno)) {
			deleteFiles(list);
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}
	@ResponseBody
	@GetMapping("getAttachList")
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("getAttachList..." + bno);
		return service.getAttachList(bno);
	}
	
	public void deleteFiles(List<BoardAttachVO> attachList) {
		log.info("deleteFiles.........");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			new File(UploadController.UPLOAD_PATH, attach.getDownPath()).delete();
			if(attach.isImage()) {
				new File(UploadController.UPLOAD_PATH, attach.getThumbPath()).delete();
			}
		});
	}
}
