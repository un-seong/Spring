package com.itbank.service;

import java.io.File;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.BoardDTO;
import com.itbank.model.Reply1DTO;
import com.itbank.model.ReplyDTO;
import com.itbank.repository.BoardDAO;


@Service
public class BoardService {
	
	@Autowired BoardDAO boardDAO;
	
	private final String save = "D:\\upload_23_01_23";
	
	public BoardService() {
		File dir = new File(save);
		if(dir.exists() == false) {
			dir.mkdir();
		}
	}
	
		
	public List<BoardDTO> getlist(Integer nowPage) {
		int offset = (nowPage-1) * 10;
		return boardDAO.selectlist(offset);
	}
	

	public int insertWrite(BoardDTO dto) {		
		if(dto.getFile().getOriginalFilename() != "") {
			dto.setUploadFile(dto.getFile().getOriginalFilename());
			File dest = new File(save, dto.getFile().getOriginalFilename());
			System.out.println(dest);
			try {
				dto.getFile().transferTo(dest);
				int row = boardDAO.insertWrite(dto);
				return row;
			} catch (IOException e) {
				System.out.println("입력 에러 : " +e);
			}
		}
		else {
			dto.setUploadFile("");
			int row = boardDAO.insertWrite(dto);
			return row;
		}
		return 0;
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

	public int update(BoardDTO dto, String beforeFile) {
		System.out.println("수정 할 이미지 : " + dto.getFile().getOriginalFilename());
		
		if(dto.getFile().getOriginalFilename() != "") {
			dto.setUploadFile(dto.getFile().getOriginalFilename());
			File dest = new File(save, dto.getFile().getOriginalFilename());
			System.out.println(dest);
			try {
				dto.getFile().transferTo(dest);
				int row = boardDAO.update(dto);
				return row;
			
			} catch (IOException e) {
				System.out.println("업데이트 에러 : " +e);
			}
		}
		else {
			dto.setUploadFile(beforeFile);
			int row = boardDAO.update(dto);
			return row;
		}
		return 0;
	}

	public int getBoardCount() {
		return boardDAO.selectBoardCount();
	}

	public int getTitleCount() {
		return boardDAO.selectTitleCount();
	}


	public int total() {
		return boardDAO.total();
	}


	public String selectBeforeFile(int idx) {
		return boardDAO.selectBefoeFile(idx);
	}


	public int insertReply(ReplyDTO dto) {
		return boardDAO.insertReply(dto);
	}


	public List<ReplyDTO> getReply(int idx) {
		return boardDAO.selectReply(idx);
	}


	public int ilike(int replyIdx) {
		return boardDAO.updateIlike(replyIdx);
	}


	public int dislike(int replyIdx) {
		return boardDAO.updateDislike(replyIdx);
	}


	public List<Reply1DTO> getReply1(int idx) {
		System.out.println(idx);
		return boardDAO.selectBoardReply(idx);
	}


	public int writeReply(Reply1DTO dto) {
		return boardDAO.insertReply1(dto);
	}


	

}
