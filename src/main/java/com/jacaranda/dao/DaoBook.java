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
	
	private static StandardServiceRegistry sr = new StandardServiceRegistryBuilder().configure().build();
	private static SessionFactory sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
	private Session session;

	/**
	 * Constructor vacío
	 */
	public DaoBook() {
		super();
	}
	
	public ArrayList<Book> findBooksByGenre(String genre) {
		this.session = DaoBook.sf.openSession();
		String hql = "SELECT isbn, title, author, published_date, quantity, price, stock FROM BOOK b WHERE genre='" + genre + "';";
		Query query = session.createNativeQuery(hql, Book.class);
		ArrayList<Book> genreList = (ArrayList<Book>) query.getResultList();
		return genreList;     
	}
	
	/**
	 * Método que borra un libro en la base de datos a partir de su ISBN
	 * @param isbn el ISBN del libro
	 * @throws SQLException lanza excepción cuando no se haya podido eliminar el libro
	 * @throws DaoException lanza la excepción cuando hay un error en la base de datos
	 */
	public void deleteBook(String isbn) throws SQLException, DaoException {
		
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
	public void addBook(String isbn, String title, String author, LocalDate publishedDate, int quantity, double price) throws BookException, SQLException, DaoException {
		
	}

	/**
	 * Método que obtiene un objeto Libro de la base de datos a partir de su ISBN
	 * @param isbn el ISBN del libro
	 * @return el objeto Libro
	 * @throws SQLException lanza la excepción cuando no exista dicho libro en la base de datos
	 * @throws DaoException lanza la excepción cuando hay un error en la base de datos
	 */
	public Book getBook(String isbn) throws SQLException, DaoException {
		
		Book bookItem = null;
		
		return bookItem;
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
	public void updateBook(String isbn, Book modifiedBook) throws BookException, SQLException, DaoException {
//		this.connection = openConnectionDdbb();
		Book oldBook = getBook(isbn);
//		Statement instruction = connection.createStatement();
		
		String updateQuery = "UPDATE articles SET ";
		String changesQuery = "";
		String whereQuery = " WHERE isbn = '" + isbn + "';";
		String totalQuery = null;
		
		if(!oldBook.getTitle().equals(modifiedBook.getTitle())) {
			changesQuery += "title = '" + modifiedBook.getTitle() + "', ";
		}
		if(!oldBook.getAuthor().equals(modifiedBook.getAuthor())) {
			changesQuery += "author = '" + modifiedBook.getAuthor() + "', ";
		}
		if(!oldBook.getPublishedDate().equals(modifiedBook.getPublishedDate())) {
			changesQuery += "published_date = '" + modifiedBook.getPublishedDate() + "', ";
		}
		if(oldBook.getQuantity()!=(modifiedBook.getQuantity())) {
			changesQuery += "quantity = " + modifiedBook.getQuantity() + ", stock= " + modifiedBook.getStock() +  ", ";
		}
		if(oldBook.getPrice()!=(modifiedBook.getPrice())) {
			changesQuery += "price = " + modifiedBook.getPrice() + ", ";
		}
		if(changesQuery.equals("")) {
			throw new SQLException("No se han realizado modificaciones");
		}else {
			changesQuery = changesQuery.substring(0, changesQuery.length() -2);
			totalQuery = updateQuery + changesQuery + whereQuery;
//			instruction.executeUpdate(totalQuery);
		}		
		
	}
	

	
	
}