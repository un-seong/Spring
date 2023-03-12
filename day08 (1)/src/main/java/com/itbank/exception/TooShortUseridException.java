package com.itbank.exception;

public class TooShortUseridException extends Exception {

	private static final long serialVersionUID = 1L;

	@Override
	public String getMessage() {
		return "ID의 길이가 너무 짧습니다(8글자 이상 입력하세요)";
	}
}
