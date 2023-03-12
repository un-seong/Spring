package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.HomeplusDTO;

@Repository
public interface HomeplusDAO {

	List<HomeplusDTO> selectList();

	HomeplusDTO selectDetail(int idx);

	int insert(HomeplusDTO dto);

	int update(HomeplusDTO dto);

	int update1(HomeplusDTO dto);

	int delete(int idx);

	List<HomeplusDTO> selectListAsc();

	List<HomeplusDTO> selectListDesc();


}
