package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.UserDTO;

@Repository
public interface UserDAO {

	
	List<UserDTO> selectListAll();

	int insert(UserDTO user);

	
	UserDTO login(String result);

}
