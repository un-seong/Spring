package com.itbank.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.Member5DTO;
import com.itbank.repository.Member5DAO;

@Service
public class MemberService {

	@Autowired Member5DAO dao;

	public List<Member5DTO> getList() {
		return dao.getList();
	}
	
	

}
