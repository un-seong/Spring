package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.MemberDTO;

@Repository
public interface MemberDAO {

	
	List<MemberDTO> selectList();
	
	int insert(MemberDTO dto);

	MemberDTO login(MemberDTO user);

	MemberDTO selectOnePerson(int idx);

	int updateOnePerson(MemberDTO dto);

	int deleteOnePerson(int idx);

	int check(HashMap<String, Object> result);

	int selectUseridCount(String inputId);

}
