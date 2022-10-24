package com.jacaranda.dao;

import java.util.ArrayList;


import org.hibernate.Session;
import org.hibernate.query.Query;

import com.jacaranda.model.Genre;
import com.jacaranda.model.GenreException;

public class DaoGenre {
	
	
	public DaoGenre() {
		super();
	}
	
	//Funcionando
	public Genre getGenre(String name) throws DaoException {
		Session session = ConnectionDB.getSession();
		Genre g = (Genre) session.get(Genre.class, name);
		if(g==null) {
			throw new DaoException("No existe un genero con ese nombre");
		}
		return g;
	}
	
	//Funcionando
	public ArrayList<Genre> getAllGenres() {
		Session session = ConnectionDB.getSession();
		String hql = "SELECT g FROM GENRE g";
		Query<Genre> query = session.createNativeQuery(hql, Genre.class);
		ArrayList<Genre> genreList = (ArrayList<Genre>) query.getResultList();
		return genreList;     
	}
	
	//Funcionando
	public boolean addGenre(String name, String description) throws DaoException {
		boolean result = false;
		Session session = ConnectionDB.getSession();
		try {
			Genre g = new Genre(name, description);
			session.getTransaction().begin();
			session.save(g);
			session.getTransaction().commit();
			result = true;
		}catch(Exception e) {
			throw new DaoException(e.getMessage());
		}
		return result;
	}
	
	//Funcionando
	public boolean deleteGenre(String name) throws DaoException {
		boolean result = false;
		Session session = ConnectionDB.getSession();
		try {
			Genre g = getGenre(name);
			session.getTransaction().begin();
			session.delete(g);
			session.getTransaction().commit();
		}catch(Exception e) {
			throw new DaoException(e.getMessage());
		}
		return result;
	}

	public boolean updateGenre(String name, String description) throws DaoException, GenreException {
		boolean result = false;
		Session session = ConnectionDB.getSession();
		Genre g = getGenre(name);
		if(!g.getDescription().equalsIgnoreCase(description)) {
			g.setDescription(description);
			try {
				session.getTransaction().begin();
				session.update(g);
				session.getTransaction().commit();
			}catch(Exception e) {
				throw new DaoException(e.getMessage());
			}
		}
		return result;
	}
	
	
	
}
