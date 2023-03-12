package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.BoardDTO;
import com.itbank.service.BoardService;

@Controller
public class BoardController {

	@Autowired BoardService boardService;
	
	@GetMapping("/boardlist")
	public ModelAndView boardlist() {
		ModelAndView mav = new ModelAndView();
		List<BoardDTO> list = boardService.getlist();
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/boardlist")
	public ModelAndView boardlist(String title) {
		ModelAndView mav = new ModelAndView();
		List<BoardDTO> list = boardService.search(title);
		mav.addObject("list", list);
		return mav;
	}
	
	
	@GetMapping("/boardwrite")
	public void boardwrite() {}
	
	@PostMapping("boardwrite")
	public String boardwrite(BoardDTO dto) {
		int row = boardService.insertWrite(dto);
		return row != 0 ? "redirect:/boardlist" : "boardwrite";
	}
	
	@GetMapping("/boardsee/{idx}")
	public ModelAndView boardsee(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("boardsee");
		BoardDTO board = boardService.getOneBoard(idx);
		mav.addObject("board", board);
		return mav;
	}
	
	@GetMapping("/boarddelete/{idx}")
	public String boarddelete(@PathVariable("idx") int idx) {
		int row = boardService.delete(idx);
		return row != 0 ? "redirect:/boardlist" : "redirect:/boardlist";
	}
	
	@GetMapping("/boardupdate/{idx}")
	public ModelAndView boardupdate(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("boardupdate");
		BoardDTO dto = boardService.getOneBoard(idx);
		mav.addObject("dto", dto);
		return mav;	
	}
	
	@PostMapping("boardupdate/{idx}")
	public String boardupdate(BoardDTO dto) {
		int row = boardService.update(dto);
		return row != 0 ? "redirect:/boardlist" : "redirect:/boardsee/{idx}";
	}
	
	
	
	
	
	
}
