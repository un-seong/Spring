package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.UserDTO;
import com.itbank.repository.UserDAO;

@Service
public class UserService {

	@Autowired UserDAO udao;
	
	public List<UserDTO> getList() {
		return udao.selectListAll();
	}

	public int insert(UserDTO user) {
		return udao.insert(user);
	}

	public UserDTO login(String result) {
		return udao.login(result);
	}

	

}
