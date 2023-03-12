package com.itbank.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.BoardDTO;
import com.itbank.repository.BoardDAO;

@Service
public class BoardService {
	
	@Autowired BoardDAO boardDAO;
		
	public List<BoardDTO> getlist() {
		return boardDAO.selectlist();
	}

	public int insertWrite(BoardDTO dto) {
		return boardDAO.insertWrite(dto);
	}

	public List<BoardDTO> search(String title) {
		return boardDAO.search(title);
	}

	public BoardDTO getOneBoard(int idx) {
		boardDAO.updateCount(idx);
		return boardDAO.selectOneBoard(idx);
	}

	public int delete(int idx) {
		return boardDAO.delete(idx);
	}

	public int update(BoardDTO dto) {
		return boardDAO.update(dto);
	}

}
