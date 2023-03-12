package com.itbank.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired MemberService memberService;
	
	@Value("classpath:agreement/agreement.txt")	// 자원의 값을 자동으로 찾아준다
	private Resource agreement;
	
	@GetMapping("/userlist")
	public ModelAndView userlist() {
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberService.getlist();
		mav.addObject("list", list);
		return mav;		
	}
	
	@GetMapping("/signup")
	public ModelAndView signup(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();

		File f = agreement.getFile();
		Scanner sc = new Scanner(f);
		String agreement = "";
		while(sc.hasNextLine()) {
			agreement += sc.nextLine();
		}
		sc.close();
		
		mav.addObject("agreement", agreement);
		return mav;
		
	}
	
	@PostMapping("/signup")
	public ModelAndView signup(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/member/userlist");
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
			return "redirect:/member/error";
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
		return "redirect:/member/login";
	}
		
	@GetMapping("/mypage/{idx}") 
		public ModelAndView mypage(@PathVariable("idx") int idx) {
			ModelAndView mav = new ModelAndView("member/mypage");
			MemberDTO dto = memberService.getOnePerson(idx);
			mav.addObject("dto", dto);
			return mav;
	}
	
	@GetMapping("/modify/{idx}")
		public ModelAndView modify(@PathVariable("idx") int idx) {
			ModelAndView mav = new ModelAndView("member/modify");
			MemberDTO dto = memberService.getOnePerson(idx);
			mav.addObject("dto", dto);
			return mav;
	}
	
	@PostMapping("/modify/{idx}")
		public String modify(MemberDTO dto, HttpSession session) {
			int row = memberService.updateOnePerson(dto);
			MemberDTO loginComplete = memberService.login(dto);
			session.setAttribute("loginComplete", loginComplete);
			return row != 0 ? "redirect:/member/userlist" : "redirect:/";
	}
	
	@GetMapping("/withdrawal/{idx}")
	public String withdrawal() {
		return "member/withdrawal";
	}
	
	@PostMapping("/withdrawal/{idx}")
	public String withdrawal(@RequestParam HashMap<String, Object> result, String userpw, @PathVariable("idx") int idx, HttpSession session) {
		result.put("userpw", userpw );
		result.put("idx", idx );
		
		int row = memberService.check(result);
		if(row != 0) {
			session.invalidate();
			return "redirect:/member/userlist";
		}
		else {			
			return "redirect:/member/error";
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
