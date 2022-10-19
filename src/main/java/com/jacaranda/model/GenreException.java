package com.jacaranda.model;

public class GenreException extends Exception {

	public GenreException() {
	}

	public GenreException(String message) {
		super(message);
	}

	public GenreException(Throwable cause) {
		super(cause);
	}

	public GenreException(String message, Throwable cause) {
		super(message, cause);
	}

	public GenreException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
