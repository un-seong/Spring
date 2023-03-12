package com.itbank.model;

//	IDX     NOT NULL NUMBER        
//	WRITER  NOT NULL VARCHAR2(100) 
//	MEMO    NOT NULL VARCHAR2(255) 
//	ILIKE            NUMBER        
//	DISLIKE          NUMBER     

public class ReplyDTO {
	
	private int replyIdx;
	private int idx;			// 글의 번호
	private String writer;		// 글쓴이
	private String memo;
	private int ilike;
	private int dislike;
	
		
	public int getReplyIdx() {
		return replyIdx;
	}
	public void setReplyIdx(int replyIdx) {
		this.replyIdx = replyIdx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getIlike() {
		return ilike;
	}
	public void setIlike(int ilike) {
		this.ilike = ilike;
	}
	public int getDislike() {
		return dislike;
	}
	public void setDislike(int dislike) {
		this.dislike = dislike;
	}
	
}
