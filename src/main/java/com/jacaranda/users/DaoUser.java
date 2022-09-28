package com.jacaranda.users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;

public class DaoUser {
	
	private HashMap users;

	public DaoUser() {
		// TODO Auto-generated constructor stub
		
	}
	private Connection accesoBBDD() {
		Connection conexion = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/libreriaJacaranda?useSSL=false","librera","librera");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conexion;
	}
	public HashMap getUsers() throws SQLException {
		HashMap result = null;
		Connection conexion = accesoBBDD();
		Statement instruccion = conexion.createStatement();
		ResultSet users = instruccion.executeQuery("Select * from users;");
//		ResultSet passwords = instruccion.executeQuery("Select pasword from users;");
//		Iterator<ResultSet> usersIt = users.iterator();
		while(users.next()) {
			result.put(users.getString("userCod"), users.getString("pasword"));
		}
		return result;
	}
	public User getUser(String userCod) throws UserException, DaoUserException {
		User result = null;
		if(users.containsKey(userCod)) {
			String password = users.get(userCod).toString();
			result = new User(userCod, password);
		}else {
			throw new DaoUserException("No se ha encontrado el usuario");
		}
		return result;
	}

}
