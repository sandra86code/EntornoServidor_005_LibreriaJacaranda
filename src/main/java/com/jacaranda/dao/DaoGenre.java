package com.jacaranda.dao;

import java.util.ArrayList;


import org.hibernate.Session;
import org.hibernate.query.Query;

import com.jacaranda.model.Genre;
import com.jacaranda.model.GenreException;

/**
 * Clase que gestiona la conexión con la tabla género de la base de datos
 * @author sandra
 *
 */
public class DaoGenre {
	
	/**
	 * Constructor vacío
	 */
	public DaoGenre() {
		super();
	}
	
	/**
	 * Método que devuelve un objeto género a partir de su PK en la base de datos
	 * @param name nombre del género
	 * @return un objeto género
	 * @throws DaoException lanza excepción si no existe un genero con ese nombre
	 */
	public Genre getGenre(String name) throws DaoException {
		Session session = ConnectionDB.getSession();
		Genre g = (Genre) session.get(Genre.class, name);
		if(g==null) {
			throw new DaoException("No existe un genero con ese nombre");
		}
		return g;
	}
	
	/**
	 * Método que devuelve la lista de objetos genero de la base de datos
	 * @return la lista de géneros
	 */
	public ArrayList<Genre> getAllGenres() {
		Session session = ConnectionDB.getSession();
		String hql = "SELECT name, description FROM GENRE g";
		Query<Genre> query = session.createNativeQuery(hql, Genre.class);
		ArrayList<Genre> genreList = (ArrayList<Genre>) query.getResultList();
		return genreList;     
	}
	
	/**
	 * Método que añade un género a la base de datos
	 * @param name nombre del género
	 * @param description descripción del género
	 * @throws DaoException lanza excepción cuando nombre y/o descripción no sean correctos o
	 * cuando el nombre del género ya exista en la base de datos (es su PK)
	 */
	public void addGenre(String name, String description) throws DaoException  {
		Session session = ConnectionDB.getSession();
		try {
			Genre g = new Genre(name, description);
			session.getTransaction().begin();
			session.save(g);
			session.getTransaction().commit();
		} catch (GenreException e1) {
			throw new DaoException(e1.getMessage());
		} catch (Exception e) {
			throw new DaoException("Ya existe un genero con ese nombre");
		}
	}
	
	/**
	 * Método que elimina un género y todos sus libros asociados en la base de datos
	 * @param name nombre del género
	 * @throws DaoException propaga excepción del getGenre
	 */
	public void deleteGenre(String name) throws DaoException {
		Session session = ConnectionDB.getSession();
		Genre g = getGenre(name); //Lanzaría excepción si no existiese ese género en la bbdd
		session.getTransaction().begin();
		session.delete(g);
		session.getTransaction().commit();
	}
	
	/**
	 * Método que actualiza la descripción del género en la base de datos
	 * @param name nombre del género
	 * @param description descripción del género
	 * @return true si se ha modificado la descripción del género, false si no (porque es igual a la que ya hay en la bbdd)
	 * @throws DaoException propaga la excepción del getGenre
	 * @throws GenreException recoge la excepción cuando la descripción no es correcta y lanza la DaoException con el mensaje de la anterior
	 */
	public boolean updateGenre(String name, String description) throws DaoException {
		boolean result = false;
		Session session = ConnectionDB.getSession();
		Genre g = getGenre(name); //Lanzaría excepción si no existiese ese género en la bbdd
		if(!g.getDescription().equalsIgnoreCase(description)) {
			try {
				g.setDescription(description); //Lanza excepción si descripción no es correcta
				session.getTransaction().begin();
				session.update(g);
				session.getTransaction().commit();
			}catch(GenreException e) {
				throw new DaoException(e.getMessage());
			}
			result = true;
		}
		return result;
	}
	
	
	
}
