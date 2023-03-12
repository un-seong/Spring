package com.itbank.model;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


@Controller
public class UserDAO {

	
	ArrayList<UserDTO> list = new ArrayList<UserDTO>();
	
	@Autowired
	public UserDAO() {
		UserDTO ob1 = new UserDTO("정운성", 35);
		UserDTO ob2 = new UserDTO("김도현", 25);
		UserDTO ob3 = new UserDTO("윤종구", 29);
		
		list.add(ob1);
		list.add(ob2);
		list.add(ob3);
	}

	public ArrayList<UserDTO> getList() {
		return list;
	}

	public void setList(ArrayList<UserDTO> list) {
		this.list = list;
	}

	
	
	
	
}
