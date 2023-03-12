package com.itbank.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.HomeplusDTO;
import com.itbank.service.HomeplusService;

@Controller
public class HomeplusController {

	@Autowired HomeplusService hs;
		
	@GetMapping("/allList")
	public ModelAndView allList() {
		ModelAndView mav = new ModelAndView();
		List<HomeplusDTO> list = hs.getList();		
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/detail/{idx}")
	public ModelAndView detail(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("detail");
		HomeplusDTO dto = hs.getDetail(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/insert")
	public void insert() {}
	
	@PostMapping("/insert")
	public ModelAndView insert(HomeplusDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/allList");
		int row = hs.uploadDTO(dto);
		System.out.println(row);
		return mav;
	}
	
	@GetMapping("/update/{idx}")
	public ModelAndView update(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("update");
		HomeplusDTO dto = hs.getDetail(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/update/{idx}")
	public ModelAndView update(HomeplusDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/allList");
		hs.updateDTO(dto);
		return mav;	
	}
	
	@GetMapping("/updatesome/{idx}")
	public ModelAndView updatesome(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("updatesome");
		HomeplusDTO dto = hs.getDetail(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("updatesome/{idx}")
	public ModelAndView updatesome(HomeplusDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/allList");
		hs.update1DTO(dto);
		return mav;
	}
	
	@GetMapping("/delete/{idx}")
	public ModelAndView delete(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("redirect:/allList");
		hs.delete(idx);
		return mav;
	}
	
	@GetMapping("/listAsc")
	public ModelAndView listasc() {
		ModelAndView mav = new ModelAndView("listAsc");
		List<HomeplusDTO> list = hs.getListAsc();		
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/listDesc")
	public ModelAndView listdesc() {
		ModelAndView mav = new ModelAndView("listDesc");
		List<HomeplusDTO> list = hs.getListDesc();		
		mav.addObject("list", list);
		return mav;
	}
	
	
}

