package com.jacaranda.users;

import java.util.Objects;

public class User {
	
	private String userCod;
	private String password;
	
	
	public User() {
	}
	
	public User(String userCod, String password) throws UserException {
		if(userCod.length()>20) {
			throw new UserException("El código de usuario es demadiado largo");
		}else if(password.length()>10){
			throw new UserException("La contraseña es demasiado larga");
		}else {
			this.userCod = userCod;
			this.password = password;	
		}
	}
	
	public String getUserCod() {
		return userCod;
	}

	public void setUserCod(String userCod) {
		this.userCod = userCod;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	//Dos usuarios serán iguales si tienen el mismo código de usuario
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
