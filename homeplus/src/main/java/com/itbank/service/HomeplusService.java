package com.itbank.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.HomeplusDTO;
import com.itbank.repository.HomeplusDAO;

@Service
public class HomeplusService {
	
	private final String saveDirectory ="D:\\upload_homeplus";
	
	public HomeplusService() {
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdir();
		}
	}
	
	@Autowired HomeplusDAO dao;

	public List<HomeplusDTO> getList() {
		return dao.selectList();
	}

	public HomeplusDTO getDetail(int idx) {
		return dao.selectDetail(idx);
	}

	public int uploadDTO(HomeplusDTO dto) {
		File dest = new File(saveDirectory, dto.getRegistDate()+"_"+dto.getCategory()+"_"+dto.getThumbNailFile().getOriginalFilename());
		File dest1 = new File(saveDirectory, dto.getRegistDate()+"_"+dto.getCategory()+"_"+dto.getReviewFile().getOriginalFilename());
		try {
			dto.getThumbNailFile().transferTo(dest);
			dto.setThumbNail(dto.getRegistDate()+"_"+dto.getCategory()+"_"+dto.getThumbNailFile().getOriginalFilename());
			
			dto.getReviewFile().transferTo(dest1);
			dto.setReviewImage(dto.getRegistDate()+"_"+dto.getCategory()+"_"+dto.getReviewFile().getOriginalFilename());
			dao.insert(dto);
			return 1;
			
		} catch (Exception e) {	}
		
		return 0;
		
	}

	public int updateDTO(HomeplusDTO dto) {
		uploadDTO(dto);
		return dao.update(dto);
	}

	public int update1DTO(HomeplusDTO dto) {
		return dao.update1(dto);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public List<HomeplusDTO> getListAsc() {
		return dao.selectListAsc();
	}

	public List<HomeplusDTO> getListDesc() {
		return dao.selectListDesc();
	}




	


	
	
}
