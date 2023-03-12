package com.itbank.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.TestService;

@Controller

public class TestController {

	@Autowired TestService testService;
	
	@GetMapping("/ex01")
	public ModelAndView ex01() {
		ModelAndView mav = new ModelAndView();
		
		String result = testService.getVersion();
		mav.addObject("result", result);		
		return mav;	
	}
	
	@GetMapping("/ex02")
	public ModelAndView ex02() {
		ModelAndView mav = new ModelAndView();
		Date result = testService.getDate();
		mav.addObject("result", result);
		return mav;	
	}
	
	@GetMapping("/ex03")
	public ModelAndView ex03() {
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> dto = testService.getMember();
		mav.addObject("dto", dto);		
		return mav;	
	}
	
}
