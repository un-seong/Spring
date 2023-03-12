package com.itbank.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.itbank.repository.TestDAO;

@Service
public class TestService {

	@Autowired TestDAO dao;

	public String getVersion() {
		return dao.selectVersion();
	}

	public Date getDate() {
		return dao.selectSysDate();
	}

	public List<HashMap<String, Object>> getMember() {
		return dao.selectMemberList();
	}

	
}
