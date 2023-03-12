package com.itbank.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.BoardDTO;
import com.itbank.model.Reply1DTO;
import com.itbank.model.ReplyDTO;

@Repository
public interface BoardDAO {

	List<BoardDTO> selectlist(int offset);

	int insertWrite(BoardDTO dto);

	List<BoardDTO> search(String title);

	BoardDTO selectOneBoard(int idx);

	int delete(int idx);

	int update(BoardDTO dto);

	void updateCount(int idx);

	int selectBoardCount();

	int selectTitleCount();

	int total();

	String selectBefoeFile(int idx);

	int insertReply(ReplyDTO dto);

	List<ReplyDTO> selectReply(int idx);

	int updateIlike(int replyIdx);

	int updateDislike(int replyIdx);

	List<Reply1DTO> selectBoardReply(int idx);

	int insertReply1(Reply1DTO dto);


}
