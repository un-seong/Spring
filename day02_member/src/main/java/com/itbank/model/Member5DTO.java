package com.itbank.model;

import java.sql.Date;

//	    idx         number      default member5_seq.nextval primary key,
//	    userid      varchar2(100)   unique not null,
//	    userpw      varchar2(155)   not null,
//	    username    varchar2(100)   not null,
//	    birth       date            not null,
//	    gender      varchar2(20)    check(gender in ('남성', '여성'))
	
public class Member5DTO {

	private int idx;
	private String userid;
	private String userpw;
	private String username;
	private Date birth;
	private String gender;
	
	
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
