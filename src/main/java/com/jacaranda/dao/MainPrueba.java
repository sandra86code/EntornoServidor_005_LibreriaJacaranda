package com.jacaranda.dao;

public class MainPrueba {


	public static void main(String[] args) {
		String code = "ChiselaC";
		String key = "adm1";
		DaoUser du = new DaoUser();
		System.out.println(du.userIsValid(code, key));
	}

}
