package com.jacaranda.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jacaranda.model.User;
import com.jacaranda.model.UserException;

/*
 * Clase que interactúa con la base de datos
 * @author chisela
 */

public class DaoUser {
	
	/*
	 * Atributo estático para la conexión con la bbdd, inicializado aquí porque la clase no se va a instanciar
	 */
	
	private static Connection connection = openConnectionDdbb();
	
	/**
	 * Constructor vacío
	 */
	
	public DaoUser() {
		
	}
	
	/**
	 * Método que abre la conexión a la base de datos
	 * @return el objeto Connection
	 */
	private static Connection openConnectionDdbb() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/libreriaJacaranda?useSSL=false","librera","librera");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	/**
	 * Método que cierra la conexión con la base de datos
	 */
	public void closeConnectionDdbb() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Método que crea una List con todos los usuarios que existen en la base de datos
	 * @return List de User
	 * @throws SQLException lanza la excepción cuando no se ejecute la sentencia de la base de datos
	 * @throws UserException lanza la excepción cuando algún parámetro al crear un objeto Usuario no cumpla con
	 * los requisitos de la clase User
	 */
	public List<User> getUsers() throws SQLException, UserException {
		List<User> result = new ArrayList<User>();
		Statement instruccion = connection.createStatement();
		ResultSet usersSet = instruccion.executeQuery("Select * from users;");
		while(usersSet.next()) {
			User u = new User(usersSet.getString("userCod"), usersSet.getString("password"));
			result.add(u);
		}
		return result;
	}
	
	/**
	 * Método que obtiene un objeto User de la base de datos a partir de su código de usuario
	 * @param userCod código de usuario
	 * @return User cuyo userCod sea el mismo que se ha pasado por parámetro
	 * @throws SQLException lanza la excepción cuando no exista dicho usuario en la base de datos
	 */
	public User getUser(String userCod) throws UserException, SQLException {
		User result = null;
		Statement instruccion = connection.createStatement();
		ResultSet userSet = instruccion.executeQuery("Select * from users where userCod like '" + userCod + "';");
		
		while(userSet.next()) {
			result = new User(userSet.getString("userCod"), userSet.getString("password"));		
		}
		return result;
	}
	
	/**
	 * Método para validar el login, comprueba si el usuario y contraseña son correctos
	 * @param code código de usuario
	 * @param key contraseña 
	 * @return boolean true si coincide, false si no coincide
	 * @throws SQLException maneja los errores que pueda dar la bbdd
	 */
	public static boolean userIsValid(String code, String key) throws SQLException {
		boolean result = false;
		Statement instruccion = connection.createStatement();
		ResultSet userSet = instruccion.executeQuery("Select * from USERS where userCod like BINARY '" + code + "' and password like BINARY '"+ key + "';");
		
		if(userSet.next()) {
			result = true;
		}
		return result;
	}
	
}
