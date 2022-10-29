package com.jacaranda.dao;

import java.util.List;

import org.hibernate.Session;

import com.jacaranda.model.Genre;
import com.jacaranda.model.User;
import com.jacaranda.model.UserException;

/**
 * Clase que interactúa con la base de datos
 * @author chisela
 */

public class DaoUser {
	
	
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
		Session session = ConnectionDB.getSession();
		List<User> users = session.createQuery("from USERS", User.class).getResultList();
		//session.close();
		return users;
	}
	
	/**
	 * Método que obtiene un objeto User de la base de datos a partir de su código de usuario
	 * @param userCod código de usuario
	 * @return User cuyo userCod sea el mismo que se ha pasado por parámetro
	 * @throws DaoException lanza la excepción cuando no exista dicho usuario en la base de datos
	 */
	public User getUser(String userCod) throws UserException, DaoException {
		Session session = ConnectionDB.getSession();
		User result = (User)session.get(User.class, userCod);
//		session.close();
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
	 * @throws DaoException 
	 * @throws UserException 
	 */
	public boolean userIsValid(String code, String key) throws UserException {
		boolean result = false;
		try {
			User u = getUser(code);
			if(u.getPassword().equals(key)) {
				result = true;
			}
		}catch(DaoException e) {
			
		}
		//session.close();
		return result;
	}
	
}
