package com.itbank.model;

public class UserDTO {

	private String userName;
	private int userAge;
	
	public UserDTO() {
		// TODO Auto-generated constructor stub
	}

	public UserDTO(String userName, int userAge) {
		this.userName = userName;
		this.userAge = userAge;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserAge() {
		return userAge;
	}

	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	
	
	
	
}
