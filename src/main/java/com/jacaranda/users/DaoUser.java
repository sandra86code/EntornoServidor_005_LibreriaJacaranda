package com.jacaranda.users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoUser {
	
	public DaoUser() {
		
	}
	
	private static Connection accessDDBB() {
		Connection conexion = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/libreriaJacaranda?useSSL=false","librera","librera");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conexion;
	}
	
	public List<User> getUsers() throws SQLException, UserException {
		List<User> result = new ArrayList<User>();
		Connection conexion = accessDDBB();
		Statement instruccion = conexion.createStatement();
		ResultSet users = instruccion.executeQuery("Select * from users;");
		while(users.next()) {
			User nuevo = new User(users.getString("userCod"), users.getString("pasword"));
			result.add(nuevo);
		}
		return result;
	}
	
	public User getUser(String userCod) throws UserException, DaoUserException, SQLException {
		User result = null;
		Connection conexion = accessDDBB();
		Statement instruccion = conexion.createStatement();
		ResultSet users = instruccion.executeQuery("Select * from users where userCod like '" + userCod + "';");
		
		if(users.next()) {
			result = new User(users.getString("userCod"), users.getString("pasword"));		
		}else {
			throw new DaoUserException("No se ha encontrado el usuario");
		}
		return result;
	}
	
	public static boolean userIsValid(String code, String key) throws SQLException {
		boolean result = false;
		
		Connection conexion = accessDDBB();
		Statement instruccion = conexion.createStatement();
		ResultSet users = instruccion.executeQuery("Select * from users where userCod like BINARY '" + code + "' and pasword like BINARY '"+ key + "';");
		
		if(users.next()) {
			result = true;
		}
		return result;
	}
	
}
