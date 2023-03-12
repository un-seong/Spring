package com.itbank.model;

import java.sql.Date;

//	IDX      NOT NULL NUMBER        
//	USERID   NOT NULL VARCHAR2(100) 
//	USERPW   NOT NULL VARCHAR2(255) 
//	USERNICK NOT NULL VARCHAR2(100) 
//	BIRTH             DATE          
//	PHONE    NOT NULL NUMBER        
//	MEMO     NOT NULL VARCHAR2(255) 
//	HASH     NOT NULL VARCHAR2(255) 

public class UserDTO {

	private int idx;
	private String userid;
	private String userpw;
	private String usernick;
	private Date birth;
	private int phone;
	private String memo;
	private String hash;

	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsernick() {
		return usernick;
	}
	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	
	
	
	
}
