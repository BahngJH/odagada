package com.spring.odagada.common.exception;

public class BoardException extends RuntimeException{

	private static final long serialVersionUID = 3721183474469099280L;
	public BoardException() {
		super();
	}
	public BoardException(String msg) {
		super(msg);
	}

}
