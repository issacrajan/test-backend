package com.issac.react.exception;

public class InvalidInputException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	public InvalidInputException(String str){
		super(str);
	}
}
