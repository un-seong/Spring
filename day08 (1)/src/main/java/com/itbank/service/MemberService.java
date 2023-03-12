package com.itbank.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.exception.NotPasswordException;
import com.itbank.exception.TooShortUseridException;
import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {
	
	@Autowired MemberDAO memberDAO;

	public List<MemberDTO> getList() {
		return memberDAO.selectList();
	}
	

	public int add(MemberDTO dto) throws TooShortUseridException, NotPasswordException {
		// 아이디 길이가 길면 예외 발생
		if(dto.getUserid().length() < 8) {
			  throw new TooShortUseridException(); // 예외를 class 등록으로 만듦
		}
		
		// 입력 받은 나이가 0이면 예외가 발생함
		int age = Integer.parseInt(new SimpleDateFormat("yyyy").format(dto.getBirth()));
		age = 2023 - age;
		int tmp = 100 / age;
		System.out.println(tmp);
		//===========================
		
		if(wrongPassword(dto.getUserpw())) {
			throw new NotPasswordException();
		}
		
		return memberDAO.add(dto);		
		
	}
	
	private boolean wrongPassword(String userpw) {
		String filter = "abdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		if(userpw.length() < 8) {
			return true;
		}
		for(char ch : userpw.toCharArray()) {
			if(filter.contains(ch+"") == false) {
				return true;
			}
		}
		return false;
	}

}
