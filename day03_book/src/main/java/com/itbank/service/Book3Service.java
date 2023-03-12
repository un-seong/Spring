package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.Book3DTO;
import com.itbank.repository.Book3DAO;

@Service
public class Book3Service {

	@Autowired Book3DAO dao;

	public List<Book3DTO> getList() {
		return dao.selectList();
	}

	public List<Book3DTO> getBook(String name) {
		return dao.selectBook(name);
	}	

	public int add(Book3DTO dto) {
		return dao.insert(dto);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public Book3DTO searchOne(String name) {
		return dao.searchOne(name);
	}

	public Book3DTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int update(Book3DTO user) {
		return dao.update(user);		
	}

	public List<Book3DTO> mSearch(int price) {
		return dao.mSearch(price);
	}


	

	

	


	




	
}
