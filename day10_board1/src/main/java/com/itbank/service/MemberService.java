package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {
	
	@Autowired MemberDAO dao;

	public List<MemberDTO> getlist() {
		return dao.selectList();
	}

	public int add(MemberDTO dto) {
		return dao.insert(dto);
	}

	public MemberDTO login(MemberDTO user) {
		return dao.login(user);
	}

	public MemberDTO getOnePerson(int idx) {
		return dao.selectOnePerson(idx);
	}

	public int updateOnePerson(MemberDTO dto) {
		return dao.updateOnePerson(dto);
	}

	public int deleteOnePerson(int idx) {
		return dao.deleteOnePerson(idx);
	}

	public int check(HashMap<String, Object> result) {
		return dao.check(result);
	}
	

}
