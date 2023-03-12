package com.itbank.model;

import java.sql.Date;

//	IDX     NOT NULL NUMBER         
//	TITLE   NOT NULL VARCHAR2(1000) 
//	CONTENT NOT NULL VARCHAR2(3000) 
//	TODAY            DATE           
//	WRITER  NOT NULL VARCHAR2(100)  

public class BoardDTO {

	private int idx;
	private String title;
	private String content;
	private Date today;
	private String writer;
	private int count;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getToday() {
		return today;
	}
	public void setToday(Date today) {
		this.today = today;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
		
	
}
