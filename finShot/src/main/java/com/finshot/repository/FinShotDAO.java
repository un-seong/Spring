package com.finshot.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.finshot.model.FinShotDTO;

@Repository
public interface FinShotDAO {

	List<FinShotDTO> selectAllList();

	int insertEmployee(FinShotDTO dto);

	FinShotDTO selectOne(int emp_idx);

	int updateEmp(HashMap<String, Object> hash);

	int deleteEmp(int emp_idx);

	List<FinShotDTO> search(HashMap<String, Object> map);

	List<FinShotDTO> downloadListAll();


}
