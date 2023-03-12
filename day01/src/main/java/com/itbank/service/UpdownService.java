package com.itbank.service;

import java.util.Random;

import org.springframework.stereotype.Service;

@Service	// 요청/응답, DB에 상관없는 비즈니스 로직을 구현하는 부분
public class UpdownService {

	private int answer;
	private int count = 1;
	
	public void initialize() {
		Random ran = new Random();
		answer = ran.nextInt(100) +1;
	}
	
	public String getStatus(int user) {
		String status = null;
		if(answer == user) 		{
			status = "Correct";
			initialize();
		}
		else if (answer > user) {
			status = "Up";
			setCount(getCount() + 1);
		}
		else 	{
			status = "Down";
			setCount(getCount() + 1);
		}		
		return status;
	}


	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
