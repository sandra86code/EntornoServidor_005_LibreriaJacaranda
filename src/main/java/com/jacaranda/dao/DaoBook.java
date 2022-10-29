package com.jacaranda.dao;

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
	 * @throws DaoException lanza la excepción cuando hay un error en la base de datos y propaga
	 * la excepción del método getBook
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
			session.getTransaction().rollback();
			throw new DaoException(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * Método que añade un libro a la base de datos
	 * @param newBook un objeto Book
	 * @param genre un objeto Genre
	 * @throws DaoException lanza la excepción cuando hay un error en la inserción y propaga la excepción del constructor
	 * de libro si hay algún error en su creación
	 */
	public boolean addBook(Book newBook, Genre genre) throws DaoException {
		boolean result = false;
		Session session = ConnectionDB.getSession();
		try {
			newBook.setGenre(genre);
			session.getTransaction().begin();
			session.save(newBook);
			session.getTransaction().commit();
			result = true;
		}catch(BookException e1) {
			session.getTransaction().rollback();
			throw new DaoException(e1.getMessage());
		}catch(Exception e) {
			session.getTransaction().rollback();
			throw new DaoException("Ya existe un libro con ese isbn");
			
		}
		
		return result;
	}
		
	/**
	 * Método que actualiza un libro en la base de datos
	 * @param isbn el ISBN del libro
	 * @param modifiedBook un objeto libro sin el ISBN, que usa para comparar cada campo con el libro 
	 * en la base de datos
	 * @param date objeto de tipo Localdate
	 * @throws DaoException lanza la excepción cuando hay un error al actualizar el libro en la base de datos,
	 * propaga la excepción del método getBook y propaga la excepción de los setters de la clase Book
	 */
	public boolean updateBook(String isbn, Book modifiedBook, LocalDate date) throws DaoException {
	
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
			if(!oldBook.getPublishedDate().equals(date)) {
				oldBook.setPublishedDate(date);
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
			} 
		}catch(Exception e) {
			session.getTransaction().rollback();
			throw new DaoException(e.getMessage());
		}
			
		return result;
		}
	
	/**
	 * Método que recupera todos los libros de un género
	 * @param genre el género del libro
	 * @return la lista de libros de ese género
	 */
	public ArrayList<Book> findBooksByGenre(String genre) {
		Session session = ConnectionDB.getSession();
		Query<Book> query = session.createQuery("SELECT b FROM com.jacaranda.model.Book b where genre='" + genre + "'");
		ArrayList<Book> genreList = (ArrayList<Book>) query.getResultList();
		return genreList;     
	}
	
	
}