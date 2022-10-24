package com.jacaranda.dao;

import com.jacaranda.model.UserException;

public class MainPrueba {


	public static void main(String[] args) {
		String code = "ChiselaC";
		String key = "adM1";
		DaoUser du = new DaoUser();
		
		try {
			boolean b = du.userIsValid(code, key);
			System.out.println(b);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
//		try {
//			du.getUser(code);
//		} catch (UserException | DaoException e) {
//			System.out.println(e.getMessage());
//		}
		
//		try {
//			du.getUsers();
//		} catch (UserException e) {
//			System.out.println(e.getMessage());
//		}
	}

}
