package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

//		전체목록	
// 	 /list?pageNum=2&amount=10 (get)  -> /board/list.jsp 
							// 액션한 뒤 여기로 이동
	@GetMapping("/list")
	public void list(Model model,Criteria cri) {
		log.info("list 요청");
		model.addAttribute("list",service.getList(cri));
//		model.addAttribute("count",service.count()); //게시글 총 갯수 나오게
		model.addAttribute("pageMaker",new PageDTO(cri,123L));
		
	}
	
	//등록하기위한 화면요청
	@GetMapping("/register")
	public void register() {
		
	}
	
	//등록 /register(post방식) -> 요청 /board/list
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		log.info("글 등록 요청");
		service.register(vo);
		rttr.addFlashAttribute("bno", vo.getBno()); // 입력된 글 번호 전송  (Impl에 있는 글등록시 글번호알기)
		//addFlashAttribute는 내부적으로 세션을 처리함(get으로 처리안됨)으로 데이터를 한번만 전송하게 된다 
//		return "/home"; 
		return "redirect:/board/list"; //주의 : /board/list.jsp가 아니라 새로운 url요청이다.
	}
	//조회 /get?bno=13(get) -> 요청 /board/get.jsp, modify(post) -> 요청 /board/list
	@GetMapping({"/get","/modify"})
	public void get(Long bno,Model model) {
		model.addAttribute("board", service.get(bno));
	}
	
	//삭제 /remove(post) -> 요청 /board/list
	@PostMapping("/remove")
	public String remove(Long bno, RedirectAttributes rttr) {
		if(service.remove(bno))
		rttr.addFlashAttribute("state","remove");
		return "redirect:/board/list";
	}
	

	
	//수정 /modify(post) -> 요청 /board/list
	@PostMapping("/modify")
	public String modify(BoardVO vo, RedirectAttributes rttr) {
		if(service.modify(vo))
			rttr.addAttribute("state", "modify");
		return "redirect:/board/list";
	}
	
//-----------------------------------------------------------
	
	//퀴즈 count
	@GetMapping("count")
	public void count(Model model) {
		//총 글 갯수 가져오는 서비스
		model.addAttribute("count", service.count());
	}
	
}
