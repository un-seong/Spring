package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.HashComponent;
import com.itbank.model.UserDTO;
import com.itbank.service.UserService;

@Controller
@SessionAttributes("loginComplete")
public class UserController {
	
	@Autowired UserService us;
	
	@Autowired private HashComponent hc;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<UserDTO> list = us.getList();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/insert")
	public void insert() {}
			
	@PostMapping
	public String insert(UserDTO user) {
		String result = hc.getHash(user.getUserpw());
		user.setUserpw(result);
		int row = us.insert(user);
		System.out.println(row != 0 ? "추가 성공" : "추가 실패");
		return "home";
	}
	
	@GetMapping("/login")
	public void login() {}

	@PostMapping("/login")
	public String login(UserDTO user) {
		String result = hc.getHash(user.getUserpw());
		user.setUserpw(result);
		UserDTO loginComplete = us.login(result);
		System.out.println(loginComplete == null ? "로그인 실패" : "로그인성공");
		System.out.println(loginComplete);
		System.out.println(loginComplete.getUserid());
		System.out.println(loginComplete.getUsernick());
		return loginComplete == null ? "login" : "home";
	}	
}
