package com.itbank.exception;

public class NotPasswordException extends Exception {

	private static final long serialVersionUID = 1L;

	@Override
	public String getMessage() {
		return "특수문자가 포함 되거나 길이가 짧습니다";
	}
	
}
