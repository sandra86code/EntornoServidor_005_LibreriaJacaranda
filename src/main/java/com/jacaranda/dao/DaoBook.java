package com.jacaranda.dao;


import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.jacaranda.model.Book;
import com.jacaranda.model.BookException;
import com.jacaranda.model.Genre;

/**
 * Clase que interactúa con la base de datos
 * @author sandra
 *
 */
public class DaoBook {
	
	/**
	 * Constructor vacío
	 */
	public DaoBook() {
		super();
	}
	
	/**
	 * Método que obtiene un objeto Libro de la base de datos a partir de su ISBN
	 * @param isbn el ISBN del libro
	 * @return el objeto Libro
	 * @throws DaoException lanza una excepción si el libro no existe en la base de datos
	 */
	public Book getBook(String isbn) throws DaoException {
		
		Session session = ConnectionDB.getSession();
		Book book =(Book) session.get(Book.class, isbn);
		
		if(book==null) {
			throw new DaoException("No existe un libro con ese isbn");
		}
		
		return book;
	}
	

	/**
	 * Método que borra un libro en la base de datos a partir de su ISBN
	 * @param isbn el ISBN del libro
	 * @throws DaoException lanza la excepción cuando hay un error en la base de datos
	 */
	public boolean deleteBook(String isbn) throws DaoException {
		boolean result = false; 
		Session session = ConnectionDB.getSession();
		
		try {
			Book book = getBook(isbn);
			session.getTransaction().begin();
			session.delete(book);
			session.getTransaction().commit();		
		} catch (Exception e) {
			throw new DaoException(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * Método que añade un libro a la base de datos
	 * @param isbn el ISBN del libro
	 * @param title el título del libro
	 * @param author el autor del libro
	 * @param publishedDate la fecha de publicación del libro
	 * @param quantity la cantidad de unidades del libro
	 * @param price el precio del libro
	 * @throws BookException lanza la excepción cuando alguno de los parámetros no cumplan los requisitos
	 * @throws SQLException lanza la excepción cuando no se pueda añadir el libro en la base de datos
	 * @throws DaoException lanza la excepción cuando hay un error en la base de datos
	 */
	public boolean addBook(Book newBook) throws DaoException {
		boolean result = false;
		Session session = ConnectionDB.getSession();

		try {
			session.getTransaction().begin();
			session.save(newBook);
			session.getTransaction().commit();
			result = true;
		}catch(Exception e) {
			throw new DaoException("Ya existe un libro con ese isbn");
		}
		
		return result;
	}
		
	/**
	 * Método que actualiza un libro en la base de datos
	 * @param isbn el ISBN del libro
	 * @param modifiedBook un objeto libro sin el ISBN, que usa para comparar cada campo con el libro 
	 * en la base de datos
	 * @throws BookException lanza la excepción cuando alguno de los parámetros no cumplan los requerimientos
	 * @throws SQLException lanza la excepción cuando no se puede ejecutar la actualización en la base de datos
	 * @throws DaoException lanza la excepción cuando hay un error en la base de datos
	 */
	public boolean updateBook(String isbn, Book modifiedBook) throws DaoException {
	
		boolean result = false;
		Session session = ConnectionDB.getSession();
		
		try {
			Book oldBook = getBook(isbn);
		
			if(!oldBook.getTitle().equals(modifiedBook.getTitle())) {
				oldBook.setTitle(modifiedBook.getTitle());
				result = true;
			}
			if(!oldBook.getAuthor().equals(modifiedBook.getAuthor())) {
				oldBook.setAuthor(modifiedBook.getAuthor());
				result = true;
			}
			if(!oldBook.getPublishedDate().equals(modifiedBook.getPublishedDate())) {
				oldBook.setPublishedDate(modifiedBook.getPublishedDate());
				result = true;
			}
			if(oldBook.getQuantity()!=(modifiedBook.getQuantity())) {
				oldBook.setQuantity(modifiedBook.getQuantity());
				result = true;
			}
			if(oldBook.getPrice()!=(modifiedBook.getPrice())) {
				oldBook.setPrice(modifiedBook.getPrice());
				result = true;
			}
			
			if(result) {
				session.getTransaction().begin();
				session.update(oldBook);
				session.getTransaction().commit();
			} else {
				throw new DaoException("No se han realizado modificaciones");
			}
		}catch(Exception e) {
			throw new DaoException(e.getMessage());
		}
			
		return result;
		}
	
	
	public ArrayList<Book> findBooksByGenre(String genre) {
		Session session = ConnectionDB.getSession();
		Query<Book> query = session.createQuery("SELECT b FROM com.jacaranda.model.Book b where genre='" + genre + "'");
		ArrayList<Book> genreList = (ArrayList<Book>) query.getResultList();
		return genreList;     
	}
	
	
}