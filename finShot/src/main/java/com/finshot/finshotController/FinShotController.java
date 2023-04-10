package com.finshot.finshotController;

import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.SQLSyntaxErrorException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finshot.model.FinShotDTO;
import com.finshot.service.FinShotService;

@Controller
public class FinShotController {
	
	@Autowired FinShotService service;

	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		List<FinShotDTO> dto = service.getList();
		
		for(int i = 0; i < dto.size(); i++) {
			if(Integer.parseInt(dto.get(i).getEmp_idx()) <= 9) {
				dto.get(i).setEmp_idx("00"+dto.get(i).getEmp_idx());
			}else if(Integer.parseInt(dto.get(i).getEmp_idx()) >= 10 && Integer.parseInt(dto.get(i).getEmp_idx()) < 100) {
				dto.get(i).setEmp_idx("0"+dto.get(i).getEmp_idx());
			}else {
				dto.get(i).getEmp_idx();
			}
		}
		
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("add")
	public void add() {}
	
	
	@PostMapping("/add")
	public ModelAndView add(FinShotDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int row = service.addEmployee(dto);
		
		mav.setViewName("result");
		if(row == 0) {
			mav.addObject("result", "중복된 번호가 존재 합니다.");
			mav.addObject("address", "add");
			return mav;
		}
		else {
			mav.addObject("result", "추가되었습니다.");
			mav.addObject("address", "/");
			return mav;
		}
		
	}
	
	@GetMapping("modify/{emp_idx}")
	public ModelAndView modify(@PathVariable("emp_idx") int emp_idx ) {
		ModelAndView mav = new ModelAndView("modify");
		FinShotDTO dto = service.selectOne(emp_idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("modify/{origin_idx}")
	public ModelAndView modify1(@PathVariable("origin_idx") int origin_idx, FinShotDTO dto) {
		ModelAndView mav = new ModelAndView();
		int row = service.updateEmp(dto, origin_idx);
		if(row > 0) {
			mav.setViewName("result");
			mav.addObject("result", "성공했습니다.");
			return mav;
		}
		else {
			mav.setViewName("result");
			mav.addObject("result", "정보를 정확하게 입력하여 주세요");
			return mav;
		}
	}
	
	@GetMapping("delete/{emp_idx}")
	public ModelAndView delete(@PathVariable("emp_idx") int emp_idx) {
		ModelAndView mav = new ModelAndView();
		int row = service.deleteEmp(emp_idx);
		if(row > 0) {
			mav.setViewName("result");
			mav.addObject("result", "성공했습니다.");
			return mav;
		}
		return mav;
	}
		
	@GetMapping("search")
	public ModelAndView search(@RequestParam HashMap<String, String> param) {
		ModelAndView mav = new ModelAndView("home");
		System.out.println(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for (String value : param.values()) { 
				String paramValue = value;
				map.put("paramValue", paramValue);
			}
		
		for (String key : param.keySet()) { 
				String paramKey = key;
				map.put("paramKey", paramKey);
			}
				
		List<FinShotDTO> dto = service.search(map);
		
		for(int i = 0; i < dto.size(); i++) {
			if(Integer.parseInt(dto.get(i).getEmp_idx()) <= 9) {
				dto.get(i).setEmp_idx("00"+dto.get(i).getEmp_idx());
			}else if(Integer.parseInt(dto.get(i).getEmp_idx()) >= 10 && Integer.parseInt(dto.get(i).getEmp_idx()) < 100) {
				dto.get(i).setEmp_idx("0"+dto.get(i).getEmp_idx());
			}else {
				dto.get(i).getEmp_idx();
			}
		}
		
		if(dto.size() < 1) {
			mav.setViewName("result");
			mav.addObject("result", "찾으시는 결과가 없습니다.");
			return mav;
		}else {
			mav.addObject("dto", dto);
			return mav;
		}
				
	}
			
	
	@ResponseBody
	@GetMapping(value = "download")
	public ResponseEntity<String> download() {
		List<FinShotDTO> dto = service.ListAll();
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/csv; charset=MS949");
		header.add("Content-Disposition", "attachment; filename=\""+"finshot_employee.csv"+"\"");
				
		return new ResponseEntity<String>(setContent(dto), header, HttpStatus.CREATED);
	}
	
	public String setContent(List<FinShotDTO> user) {
		String data = "";
		
		for (int i=0; i<user.size(); i++) {
			data += user.get(i).getEmp_idx() + ",";
			data += user.get(i).getEmp_name() + ",";
			data += user.get(i).getEmp_phone() + ",";
			data += user.get(i).getEmp_position() + ",";
			data += user.get(i).getEmp_email() + "\n";
		}
		
		return data;
	}
	
	@Scheduled
	public void doSchedule() {
		System.out.println("스케쥴 스타트");
	}
	
	
	
	@ExceptionHandler({SQLIntegrityConstraintViolationException.class})
	   public ModelAndView databaseError() {
		 	ModelAndView mav = new ModelAndView("result");
		 	mav.addObject("result", "이미 존재하는 번호 입니다. 번호를 확인해주세요");
		 	return mav;
	}
	 
	 @ExceptionHandler({SQLSyntaxErrorException.class})
	   public ModelAndView inputError() {
		 	ModelAndView mav = new ModelAndView("result");
		 	mav.addObject("result", "올바른 입력을 부탁드립니다.");
		 	return mav;
	}
	
}
