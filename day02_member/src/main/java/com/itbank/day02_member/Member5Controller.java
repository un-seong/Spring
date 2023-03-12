package com.itbank.day02_member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.Member5DTO;
import com.itbank.service.MemberService;

@Controller
public class Member5Controller {

	@Autowired private MemberService ms;
	
	@GetMapping
	public ModelAndView allList() {
		ModelAndView mav = new ModelAndView();
		List<Member5DTO> list = ms.getList();
		mav.addObject("list", list);		
		return mav;
	}
	
	
}
