package com.jacaranda.users;

import java.sql.SQLException;

public class MainConnexionUser {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String codigo1= "ChiselaC";
		String codigo2 ="Chisela";
		String contrasena1= "adm1";
		String contrasena2 = "adm3";
		
		DaoUser nuevo = new DaoUser();
		
		
		try {
			System.out.println(nuevo.userIsValid(codigo1, contrasena1));
			System.out.println(nuevo.userIsValid(codigo1, contrasena2));
			System.out.println(nuevo.userIsValid(codigo2, contrasena1));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		
	}

	
	
	
			
	
}
