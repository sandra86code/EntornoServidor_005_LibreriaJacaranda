package com.jacaranda.dao;


import java.sql.SQLException;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.jacaranda.model.User;
import com.jacaranda.model.UserException;

/**
 * Clase que interactúa con la base de datos
 * @author chisela
 */

public class DaoUser {
	
	/**
	 * Atributos estáticos para la conexión con la bbdd
	 */
	private static StandardServiceRegistry sr = new StandardServiceRegistryBuilder().configure().build();
	private static SessionFactory sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
	
	/**
	 * Atributo para la sesión
	 */
	private Session session;
	
	/**
	 * Constructor vacío
	 */
	public DaoUser() {
		
	}
	
	/**
	 * Método que crea una List con todos los usuarios que existen en la base de datos
	 * @return List de User
	 * @throws UserException lanza la excepción cuando algún parámetro al crear un objeto Usuario no cumpla con
	 * los requisitos de la clase User
	 */
	public List<User> getUsers() throws UserException {
		session = DaoUser.sf.openSession();
		List<User> users = session.createQuery("from users", User.class).getResultList();
		session.close();
		return users;
	}
	
	/**
	 * Método que obtiene un objeto User de la base de datos a partir de su código de usuario
	 * @param userCod código de usuario
	 * @return User cuyo userCod sea el mismo que se ha pasado por parámetro
	 * @throws DaoException lanza la excepción cuando no exista dicho usuario en la base de datos
	 */
	public User getUser(String userCod) throws UserException, DaoException {
		session = DaoUser.sf.openSession();
		User result = session.get(User.class, userCod);
		session.close();
		if(result == null) {
			throw new DaoException("No se ha encontrado el usuario en la base de datos");
		}
		return result;
	}
	
	/**
	 * Método para validar el login, comprueba si el usuario y contraseña son correctos
	 * @param code código de usuario
	 * @param key contraseña 
	 * @return boolean true si coincide, exception si no 
	 * @throws NoResultException si no se encuentran los datos en la bbdd
	 */
	public boolean userIsValid(String code, String key) throws NoResultException {
		boolean result = false;
		session = DaoUser.sf.openSession();
		Query query = session.createSQLQuery("Select * from users where userCod like BINARY '" + code + "' and password like BINARY '" + key + "' ;");
		if(query.getSingleResult() != null) {
			result = true;
		}
		session.close();
		return result;
	}
	
}
