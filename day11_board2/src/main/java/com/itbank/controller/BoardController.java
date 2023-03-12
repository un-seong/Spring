package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.BoardDTO;
import com.itbank.model.Paging;
import com.itbank.model.ReplyDTO;
import com.itbank.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired BoardService boardService;
	
	@GetMapping("/boardlist")
	public ModelAndView boardlist(Integer nowPage) {
		ModelAndView mav = new ModelAndView();
				
		if(nowPage == null) {
			nowPage = 1;
		}
		
		List<BoardDTO> list = boardService.getlist(nowPage);
		mav.addObject("list", list);
		
		mav.addObject("nowPage", nowPage);
		
		// jsp에 페이지 매기기
		int totalBoard = boardService.total();	// 전체 수
		int page = totalBoard / 10;	// 현재 페이지 수
		if(totalBoard % 10 != 0) {
			page += 1;
		}
		mav.addObject("page", page);
		
		int result = 5;
		
		int end = 1;		
		if(nowPage % result != 0) {
			end = (nowPage / result + 1) * 5;
		}		
		else {
			end = (nowPage / result) * 5;
		}
				
		int begin = end-4;
		
		if(end > page) {
			end = page;
		}
		
		mav.addObject("begin", begin);
		mav.addObject("end", end);
			
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
	
	@PostMapping("/boardwrite")
	public String boardwrite(BoardDTO dto, HttpServletRequest request) {
		dto.setIpAddr(request.getRemoteAddr());
		int row = boardService.insertWrite(dto);
		return row != 0 ? "redirect:/board/boardlist" : "board/boardwrite";
	}
	
	@GetMapping("/boardsee/{idx}")
	public ModelAndView boardsee(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("board/boardsee");
		BoardDTO board = boardService.getOneBoard(idx);
		List<ReplyDTO> reply = boardService.getReply(idx);
		mav.addObject("board", board);
		mav.addObject("reply", reply);
		return mav;
	}
	
	@PostMapping("/boardsee/{idx}")
	public String reply(ReplyDTO dto, @PathVariable("idx") int idx) {
		int row = boardService.insertReply(dto);
		return row != 0 ? "redirect:/board/boardsee/{idx}" : "redircet:/board/boardlist";
	}
		
	@GetMapping("/boarddelete/{idx}")
	public String boarddelete(@PathVariable("idx") int idx) {
		int row = boardService.delete(idx);
		return row != 0 ? "redirect:/board/boardlist" : "redirect:/board/boardlist";
	}
	
	@GetMapping("/boardupdate/{idx}")
	public ModelAndView boardupdate(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("board/boardupdate");
		BoardDTO dto = boardService.getOneBoard(idx);
		mav.addObject("dto", dto);
		return mav;	
	}
	
	@PostMapping("/boardupdate/{idx}")
	public String boardupdate(BoardDTO dto) {
		String beforeFile = boardService.selectBeforeFile(dto.getIdx());
		int row = boardService.update(dto, beforeFile);
		return row != 0 ? "redirect:/board/boardlist" : "redirect:/board/boardsee/{idx}";
	}	
	
	@GetMapping("/ilike/{replyIdx}/{idx}")
	public String ilike(@PathVariable("replyIdx") int replyIdx, @PathVariable("idx") int idx) {
		int row = boardService.ilike(replyIdx);
		return row != 0 ? "redirect:/board/boardsee/{idx}" : "redirect:/board/boardlist";
	}
	
	@GetMapping("/dislike/{replyIdx}/{idx}")
	public String dislike(@PathVariable("replyIdx") int replyIdx, @PathVariable("idx") int idx) {
		int row = boardService.dislike(replyIdx);
		return row != 0 ? "redirect:/board/boardsee/{idx}" : "redirect:/board/boardlist";
	}
	
	
}
