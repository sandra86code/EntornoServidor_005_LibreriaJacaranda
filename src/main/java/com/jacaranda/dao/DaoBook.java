package com.jacaranda.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
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
			throw new DaoException("No existe un libro con ese nombre");
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
			Book b = getBook(isbn);
			session.getTransaction().begin();
			session.delete(b);
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
	public boolean addBook(String isbn, String title, String author, LocalDate publishedDate, int quantity, double price, Genre genre) throws DaoException {
		
		boolean result = false;
		Session session = ConnectionDB.getSession();
		Book book = getBook(isbn);
		if(book == null) {
			try {
				Book newBook = new Book(isbn, title, author, publishedDate, quantity, price, quantity, genre);
				session.getTransaction().begin();
				session.save(newBook);
				session.getTransaction().commit();
				result = true;
			}catch(Exception e) {
				throw new DaoException(e.getMessage());
			}
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
		Book oldBook = getBook(isbn);
		
		try {
		
			if(!oldBook.getTitle().equals(modifiedBook.getTitle())) {
				oldBook.setTitle(modifiedBook.getTitle());
			}
			if(!oldBook.getAuthor().equals(modifiedBook.getAuthor())) {
				oldBook.setAuthor(modifiedBook.getAuthor());
			}
			if(!oldBook.getPublishedDate().equals(modifiedBook.getPublishedDate())) {
				oldBook.setPublishedDate(modifiedBook.getPublishedDate());
			}
			if(oldBook.getQuantity()!=(modifiedBook.getQuantity())) {
				oldBook.setQuantity(modifiedBook.getQuantity());
			}
			if(oldBook.getPrice()!=(modifiedBook.getPrice())) {
				oldBook.setPrice(modifiedBook.getPrice());
			}
		
			session.getTransaction().begin();
			session.update(oldBook);
			session.getTransaction().commit();
			}catch(Exception e) {
				throw new DaoException(e.getMessage());
			}
		return result;
		}
	
	
	public ArrayList<Book> findBooksByGenre(String genre) {
		Session session = ConnectionDB.getSession();
		String hql = "SELECT isbn, title, author, published_date, quantity, price, stock FROM BOOK b WHERE genre='" + genre + "';";
		Query query = session.createNativeQuery(hql, Book.class);
		ArrayList<Book> genreList = (ArrayList<Book>) query.getResultList();
		return genreList;     
	}
	
	
}