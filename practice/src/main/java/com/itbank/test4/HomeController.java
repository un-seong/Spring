package com.itbank.test4;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.model.UserDAO;
import com.itbank.model.UserDTO;

@Controller
public class HomeController {
		
	@Autowired private UserDAO dao;
	
	@RequestMapping("/")
	public String home(HttpServletRequest request) {
		ArrayList<UserDTO> list1 = dao.getList();
		request.setAttribute("list", list1);
		return "home";
	}
}
