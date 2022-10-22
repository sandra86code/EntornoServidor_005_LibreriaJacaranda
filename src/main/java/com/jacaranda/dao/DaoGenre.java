package com.jacaranda.dao;

import java.util.ArrayList;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import com.jacaranda.model.Genre;
import com.jacaranda.model.GenreException;

public class DaoGenre {
	
	private static StandardServiceRegistry sr = new StandardServiceRegistryBuilder().configure().build();
	private static SessionFactory sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
	private Session session;
	
	
	public DaoGenre() {
		super();
	}
	
	
	public Genre findGenre(String name) throws DaoException {
		Genre g = (Genre) session.get(Genre.class,name);
		if(g==null) {
			throw new DaoException("No existe un genero con ese nombre");
		}
		return g;
	}
	
	public ArrayList<Genre> findAllGenres() {
		this.session = DaoGenre.sf.openSession();
		String hql = "SELECT name, description FROM GENRE g";
		Query query = session.createNativeQuery(hql, Genre.class);
		ArrayList<Genre> genreList = (ArrayList<Genre>) query.getResultList();
		return genreList;     
	}
	
	public boolean addGenre(String name, String description) throws DaoException, GenreException {
		boolean result = false;
		Genre g = new Genre(name, description);
		try {
			this.session = DaoGenre.sf.openSession();
			this.session.getTransaction().begin();
			this.session.save(g);
			this.session.getTransaction().commit();
			
			result = true;
		}catch(Exception e) {
			throw new DaoException("Error en la insercion del genero");
		}
		return result;
	}
	
	public boolean deleteGenre(String name) throws DaoException {
		boolean result = false;
		Genre g = findGenre(name);
		try {
			this.session = DaoGenre.sf.openSession();
			this.session.getTransaction().begin();
			session.delete(g);
			this.session.getTransaction().commit();
			this.session.close();
		}catch(Exception e) {
			throw new DaoException(e.getMessage());
		}
		return result;
	}

	public boolean updateGenre(String name, String description) throws DaoException, GenreException {
		boolean result = false;
		Genre g = findGenre(name);
		if(!g.getDescription().equalsIgnoreCase(description)) {
			g.setDescription(description);
			try {
				this.session = DaoGenre.sf.openSession();
				this.session.getTransaction().begin();
				session.update(g);
				this.session.getTransaction().commit();
				this.session.close();
			}catch(Exception e) {
				throw new DaoException("Error en la actualizacion del genero");
			}
		}
		return result;
	}
	
	
	
}
