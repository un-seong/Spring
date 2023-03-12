package com.itbank.controll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.BoardDTO;
import com.itbank.service.BoardService;

@RestController
public class AjaxController {
	
	@Autowired BoardService boardService;

	@GetMapping("/getBoardList/{offset}")
	public List<BoardDTO> getBoardList(@PathVariable("offset") int offset) {
		List<BoardDTO> list = boardService.getBoardList(offset); 
		return list;
		
	}
	
}
