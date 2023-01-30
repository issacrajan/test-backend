package com.issac.react.exception;

public class RecordAlreadyExists extends RuntimeException {

	private static final long serialVersionUID = 1L;
	public RecordAlreadyExists(String str){
		super(str);
	}
}
