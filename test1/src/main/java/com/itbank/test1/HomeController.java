package com.itbank.test1;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
class HomeController {
	
	@RequestMapping("/")
	public String home(HttpServletRequest request) {
		request.setAttribute("serverTime", new Date());
		return "home";
	}
	
	@RequestMapping("/index")
	public void index(HttpServletRequest request) {
		request.setAttribute("serverTime", new Date());
	}
		
}