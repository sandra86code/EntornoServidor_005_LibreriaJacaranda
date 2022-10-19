package com.jacaranda.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.jacaranda.model.User;
import com.jacaranda.model.UserException;
import com.jacaranda.prueba.Prueba;

/**
 * Clase que interactúa con la base de datos
 * @author chisela
 */

public class DaoUser {
	
	/**
	 * Atributos para la conexión con la bbdd
	 */
	
	private Session session;
	private SessionFactory sf;
	
	/**
	 * Constructor que crea y abre la sesión
	 */
	
	public DaoUser() {
		StandardServiceRegistry sr = new StandardServiceRegistryBuilder().configure().build();
		sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
		session = sf.openSession();
	}
	
	/**
	 * Método que cierra la sesión
	 */
	public void closeSession() {
		session.close();
		sf.close();
	}
	
	/**
	 * Método que crea una List con todos los usuarios que existen en la base de datos
	 * @return List de User
	 * @throws SQLException lanza la excepción cuando no se ejecute la sentencia de la base de datos
	 * @throws UserException lanza la excepción cuando algún parámetro al crear un objeto Usuario no cumpla con
	 * los requisitos de la clase User
	 * MIRAR COMO CONSEGUIR LISTA
	 * https://stackoverflow.com/questions/14423664/hibernate-get-list-from-database 
	 */
	public List<User> getUsers() throws SQLException, UserException {
		List<User> result = session.createCriteria(User.class).list();
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
		User result = session.get(User.class, userCod);
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
		ResultSet userSet = instruccion.executeQuery("Select * from users where userCod like BINARY '" + code + "' and password like BINARY '"+ key + "';");
		
		if(userSet.next()) {
			result = true;
		}
		return result;
	}
	
}
