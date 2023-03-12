package com.itbank.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.BoardDTO;

@Repository
public interface BoardDAO {

	List<BoardDTO> selectlist();

	int insertWrite(BoardDTO dto);

	List<BoardDTO> search(String title);

	BoardDTO selectOneBoard(int idx);

	int delete(int idx);

	int update(BoardDTO dto);

	void updateCount(int idx);

}
