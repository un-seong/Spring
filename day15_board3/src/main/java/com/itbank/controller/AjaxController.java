package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.BoardDTO;
import com.itbank.model.Reply1DTO;
import com.itbank.service.BoardService;
import com.itbank.service.MemberService;

@RestController
public class AjaxController {
	
	@Autowired private MemberService memberService;
	@Autowired private BoardService boardService;

	@GetMapping(value="/member/dupCheck/{inputId}", produces="plain/text;charset=utf-8")
	public String dupCheck(@PathVariable("inputId") String inputId) {
		int row = memberService.dupCheck(inputId);
		String msg = row == 1 ? "이미 사용중인 ID입니다" : "사용 가능한 ID 입니다";
		msg = row + ":" + msg;
		return msg;
	}
	
	@GetMapping("/reply1/{idx}")
	public List<Reply1DTO> reply1(@PathVariable("idx") int idx) {
		List<Reply1DTO> dto = boardService.getReply1(idx);
		return dto;
	}
	
	@PostMapping("/{board_idx}")
	public int writeReply(@RequestBody Reply1DTO dto) {
		int row = boardService.writeReply(dto);
		System.out.println(dto.getBoard_idx());
		System.out.println(dto.getWriter());
		System.out.println(dto.getContent());
		return row;
	}
	
	@DeleteMapping("/{board_idx/{idx}")
	public int deleteReply(@PathVariable("idx") int idx) {
		int row = 0;
		System.out.println("삭제할 댓글 idx : " + idx);
		return row;
	}
	
}
