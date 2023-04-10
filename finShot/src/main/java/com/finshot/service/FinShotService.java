package com.finshot.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finshot.model.FinShotDTO;
import com.finshot.repository.FinShotDAO;

@Service
public class FinShotService {
	
	@Autowired FinShotDAO dao;
	
	public List<FinShotDTO> getList() {
		return dao.selectAllList();
	}

	public int addEmployee(FinShotDTO dto) {
		dto.setEmp_phone(dto.getEmp_phone().substring(0, 3)+"-"+dto.getEmp_phone().substring(3, 7)+"-"+dto.getEmp_phone().substring(7, 11));
		return dao.insertEmployee(dto);
	}

	public FinShotDTO selectOne(int emp_idx) {
		return dao.selectOne(emp_idx);
	}

	public int updateEmp(FinShotDTO dto, int origin_idx) {
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("emp_idx", dto.getEmp_idx());
		hash.put("emp_name", dto.getEmp_name());
		hash.put("emp_phone", dto.getEmp_phone());
		hash.put("emp_position", dto.getEmp_position());
		hash.put("emp_email", dto.getEmp_email());
		hash.put("origin_idx", origin_idx);
		return dao.updateEmp(hash);
	}

	public int deleteEmp(int emp_idx) {
		return dao.deleteEmp(emp_idx);
	}

	public List<FinShotDTO> search(HashMap<String, Object> map) {
		return dao.search(map);
	}

	public List<FinShotDTO> ListAll() {
		return dao.downloadListAll();
	}

	

}
