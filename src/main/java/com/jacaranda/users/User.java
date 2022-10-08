package com.jacaranda.users;
import java.util.Objects;

/**
 * @author Nadia
 * Esta clase crea un usuario
 */
public class User {
	
	private String userCod;
	private String password;
	
	
	/**
	 * Constructor vacío
	 */
	public User() {
	}
	
	
	/**
	 * Constructor con ambos parámetros
	 * @param userCod el código del usuario
	 * @param password la contraseña del usuario
	 * @throws UserException se lanza si los campos no cumplen los requerimientos de los setters
	 */
	public User(String userCod, String password) throws UserException {
		setUserCod(userCod);
		setPassword(password);
	}
	
	public String getUserCod() {
		return userCod;
	}

	/**
	 * Método que comprueba que el usuario no esté vacío o solo contenga espacios en blanco
	 * @param userCod usuario
	 * @throws UserException lanza la excepción cuando el usuario está vacío o solo contiene espacios en blanco o cuando 
	 * excede la longitud establecidad
	 */
	public void setUserCod(String userCod) throws UserException {	
		if(userCod == null || userCod.isBlank()) {
			throw new UserException("El usuario no puede ser nulo");
			} else if(userCod.length()>20) {
			throw new UserException("El usuario es demadiado largo");
			} else {
				this.userCod = userCod;
			}
	}

	public String getPassword() {
		return password;
	}

	
	/**
	 * Método que comprueba que la clave no esté vacía o solo contenga espacios en blanco
	 * @param password clave de acceso
	 * @throws UserException lanza la excepción cuando la clave está vacía o solo contiene espacios en blanco o cuando 
	 * excede la longitud establecidad
	 */
	public void setPassword(String password) throws UserException {
		if(password == null || password.isBlank()) {
			throw new UserException("La clave no puede ser nula");
		}else if(password.length()>10){
		throw new UserException("La clave es demasiado larga");
		} else {
			this.password = password;
		}
	}
	
	//Two users will be equals if they have the same userCod
	@Override
	public int hashCode() {
		return Objects.hash(userCod);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return Objects.equals(userCod, other.userCod);
	}

	@Override
	public String toString() {
		return "User [userCod=" + userCod + ", password=" + password + "]";
	}
	
}
