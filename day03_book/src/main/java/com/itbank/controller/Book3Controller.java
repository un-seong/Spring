package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.Book3DTO;
import com.itbank.service.Book3Service;

@Controller
public class Book3Controller {

	@Autowired Book3Service bs;
		
	@GetMapping("/allList")
	public ModelAndView allList() {
		ModelAndView mav = new ModelAndView();
		List<Book3DTO> list = bs.getList();
		mav.addObject("list", list);		
		return mav;
	}
	
	@PostMapping("/allList") 
	public ModelAndView getOne(String name) {
		ModelAndView mav = new ModelAndView();
		List<Book3DTO> dto = bs.getBook(name);
		mav.addObject("list", dto);
		return mav;
	}
	
	@GetMapping("/searchOne")
	public void search1() {}
	
	@PostMapping("/searchOne")
	public ModelAndView search1(String name) {
		ModelAndView mav = new ModelAndView();
		Book3DTO listOne = bs.searchOne(name);
		mav.addObject("listOne", listOne);
		return mav;
	}
		
	@GetMapping("/add")
	public void add() {}
	
	@PostMapping("/add")
	public String add(Book3DTO dto) {
		int row = bs.add(dto);
		System.out.println(row != 0 ? "추가 성공" : "추가 실패");
		return "redirect:/allList";
	}
		
	@GetMapping("/delete")
	public ModelAndView delete() {
		ModelAndView mav = new ModelAndView("/delete");
		List<Book3DTO> list = bs.getList();
		mav.addObject("list", list);		
		return mav;
	}
	
	@PostMapping("/delete")
	public String delete(int idx) {
		int row = bs.delete(idx);
		System.out.println(row != 0 ? "추가 성공" : "추가 실패");
		return "redirect:/allList";
	}
	
	@GetMapping("/update")
	public ModelAndView update(int idx) {
		ModelAndView mav = new ModelAndView("/update");
		Book3DTO ob1 = bs.selectOne(idx);
		mav.addObject("dto", ob1);
		return mav;
	}
	
	@PostMapping("/update")
	public String update(Book3DTO user) {
		int row = bs.update(user);
		System.out.println(row != 0 ? "수정 성공" : "수정 실패");
		return "redirect:/allList";
	}
	
	@GetMapping("/moneySearch")
	public void mSearch() {}
	
	@PostMapping("/moneySearch")
	public ModelAndView mSearch1(int price) {
		ModelAndView mav = new ModelAndView("/allList");
		List<Book3DTO> list = bs.mSearch(price);
		mav.addObject("list", list);
		return mav;
	}
	
}
