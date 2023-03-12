package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.Member5DTO;

@Repository
public interface Member5DAO {

	@Select("select * from member5")
	List<Member5DTO> getList();


}
