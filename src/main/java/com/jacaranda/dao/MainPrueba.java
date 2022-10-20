package com.jacaranda.dao;

public class MainPrueba {


	public static void main(String[] args) {
		String code = "ChiselaC";
		String key = "adm1";
		DaoUser du = new DaoUser();
		
		try {
			boolean b = du.userIsValid(code, key);
			System.out.println(b);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

}
