package com.jacaranda.articles;

public class DaoBookException extends Exception {

	public DaoBookException() {
		super();
	}

	public DaoBookException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public DaoBookException(String message, Throwable cause) {
		super(message, cause);
	}

	public DaoBookException(String message) {
		super(message);
	}

	public DaoBookException(Throwable cause) {
		super(cause);
	}
	
}
