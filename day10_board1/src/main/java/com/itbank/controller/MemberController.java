package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired MemberService memberService;
	
	@GetMapping("/userlist")
	public ModelAndView userlist() {
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberService.getlist();
		mav.addObject("list", list);
		return mav;		
	}
	
	@GetMapping("/signup")
	public void signup() {}
	
	@PostMapping("/signup")
	public ModelAndView signup(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/userlist");
		int row = memberService.add(dto);
		System.out.println(row != 0 ? "가입 성공" : "가입 실패");
		return mav;
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(MemberDTO user, HttpSession session, String url) {
		MemberDTO loginComplete = memberService.login(user);
		if(loginComplete == null) {
			return "redirect:/error";
		}
		session.setAttribute("loginComplete", loginComplete);
		return "redirect:" + (url == null? "/" : url);
	}
	
	

//	@PostMapping("/login")
//	public String login(MemberDTO user, HttpSession session, String url) {
//		System.out.println("로그인 후 이동할 주소 : " + url);
//		
//		MemberDTO loginComplete = memberService.login(user);
//		session.setAttribute("loginComplete", loginComplete);
//		return loginComplete == null ? "redirect:/login" : "redirect:" + url;
//	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		return "redirect:/login";
	}
		
	@GetMapping("/mypage/{idx}") 
		public ModelAndView mypage(@PathVariable("idx") int idx) {
			ModelAndView mav = new ModelAndView("mypage");
			MemberDTO dto = memberService.getOnePerson(idx);
			mav.addObject("dto", dto);
			return mav;
	}
	
	@GetMapping("/modify/{idx}")
		public ModelAndView modify(@PathVariable("idx") int idx) {
			ModelAndView mav = new ModelAndView("modify");
			MemberDTO dto = memberService.getOnePerson(idx);
			mav.addObject("dto", dto);
			return mav;
	}
	
	@PostMapping("/modify/{idx}")
		public String modify(MemberDTO dto, HttpSession session) {
			int row = memberService.updateOnePerson(dto);
			MemberDTO loginComplete = memberService.login(dto);
			session.setAttribute("loginComplete", loginComplete);
			return row != 0 ? "redirect:/userlist" : "redirect:/";
	}
	
	@GetMapping("/withdrawal/{idx}")
	public String withdrawal() {
		return "withdrawal";
	}
	
	@PostMapping("/withdrawal/{idx}")
	public String withdrawal(@RequestParam HashMap<String, Object> result, String userpw, @PathVariable("idx") int idx, HttpSession session) {
		result.put("userpw", userpw );
		result.put("idx", idx );
		
		int row = memberService.check(result);
		if(row != 0) {
			session.invalidate();
			return "redirect:/userlist";
		}
		else {			
			return "redirect:/error";
		}
		
	}
	
	@GetMapping("/error")
	public void error() {}	
	
// 	바로 삭제 하기!	
//	@PostMapping("/withdrawal/{idx}")
//		public String withdrawal(@PathVariable("idx") int idx, HttpSession session) {
//			int row = memberService.deleteOnePerson(idx);
//			session.invalidate();
//			return row != 0 ? "redirect:/" : "redirect:/";
//	}
		
}
