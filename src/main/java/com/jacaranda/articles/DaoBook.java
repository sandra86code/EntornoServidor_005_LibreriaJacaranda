package com.jacaranda.articles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 * Clase que interactúa con la base de datos
 * @author sandra
 *
 */
public class DaoBook {
	
	private Connection connection;
	private String query = "";

	/**
	 * Constructor vacío
	 */
	public DaoBook() {
		super();
	}
	
	/**
	 * Método que abre la conexión a la base de datos
	 * @return el objeto Connection
	 */
	private Connection openConnectionDdbb() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/libreriaJacaranda?useSSL=false","librera","librera");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	/**
	 * Método que cierra la conexión con la base de datos
	 */
	public void closeConnectionDdbb() {
		try {
			this.connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Método que borra un libro en la base de datos a partir de su ISBN
	 * @param isbn el ISBN del libro
	 * @throws SQLException lanza excepción cuando no se haya podido eliminar el libro
	 */
	public void deleteBook(String isbn) throws SQLException {
		this.connection = openConnectionDdbb();
		Statement instruction = connection.createStatement();
		this.query = "DELETE FROM articles WHERE isbn='" + isbn +"';";
		int affectedRows = instruction.executeUpdate(query);
		if(affectedRows == 0) {
			throw new SQLException("No se ha podido eliminar el libro");
		}
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
	 */
	public void addBook(String isbn, String title, String author, LocalDate publishedDate, int quantity, double price) throws BookException, SQLException {
		this.connection = openConnectionDdbb();
		Book existingBook = getBook(isbn);
		
		if(existingBook == null) {
			Book book = new Book(isbn, title, author, publishedDate, quantity, price);
			Statement instruction = connection.createStatement();
			this.query = "INSERT INTO articles VALUES ('" + book.getIsbn() + "','" + book.getTitle() + "','" + book.getAuthor() + "','" + book.getPublishedDate() + "'," + book.getQuantity() + ", " + book.getPrice()+ ", " + book.getStock() + ");";
			instruction.executeUpdate(query);
		} else {
			throw new BookException("El libro ya existe en la base de datos");
		}
	}

	/**
	 * Método que obtiene un objeto Libro de la base de datos a partir de su ISBN
	 * @param isbn el ISBN del libro
	 * @return el objeto Libro
	 * @throws SQLException lanza la excepción cuando no exista dicho libro en la base de datos
	 */
	public Book getBook(String isbn) throws SQLException {
		this.connection = openConnectionDdbb();
		Statement instruction = connection.createStatement();
		ResultSet bookSet = instruction.executeQuery("Select * from articles WHERE isbn ='" + isbn + "';");
		Book bookItem = null;
		while(bookSet.next()) {
			bookItem = new Book(bookSet.getString("isbn"), bookSet.getString("title"), bookSet.getString("author"), 
					LocalDate.parse(bookSet.getString("published_date")), Integer.parseInt(bookSet.getString("quantity")), 
					Double.parseDouble(bookSet.getString("price")), Integer.parseInt(bookSet.getString("stock")));
		}
		return bookItem;
	}
	

	/**
	 * Método que actualiza un libro en la base de datos
	 * @param isbn el ISBN del libro
	 * @param modifiedBook un objeto libro sin el ISBN, que usa para comparar cada campo con el libro 
	 * en la base de datos
	 * @throws BookException lanza la excepción cuando alguno de los parámetros no cumplan los requerimientos
	 * @throws SQLException lanza la excepción cuando no se puede ejecutar la actualización en la base de datos
	 */
	public void updateBook(String isbn, Book modifiedBook) throws BookException, SQLException {
		this.connection = openConnectionDdbb();
		Book oldBook = getBook(isbn);
		Statement instruction = connection.createStatement();
		
		if(!oldBook.getTitle().equals(modifiedBook.getTitle())) {
			this.query = "UPDATE articles SET title = '" + modifiedBook.getTitle() + "' WHERE isbn ='" + isbn + "';";
		}
		if(!oldBook.getAuthor().equals(modifiedBook.getAuthor())) {
			this.query = "UPDATE articles SET author = '" + modifiedBook.getAuthor() + "' WHERE isbn ='" + isbn + "';";
		}
		if(!oldBook.getPublishedDate().equals(modifiedBook.getPublishedDate())) {
			this.query = "UPDATE articles SET published_date = '" + modifiedBook.getPublishedDate() + "' WHERE isbn ='" + isbn + "';";
		}
		if(oldBook.getQuantity()!=(modifiedBook.getQuantity())) {
			this.query = "UPDATE articles SET quantity = '" + modifiedBook.getQuantity() + "', stock= '" + modifiedBook.getStock() + "' WHERE isbn ='" + isbn + "';";
		}
		if(oldBook.getPrice()!=(modifiedBook.getPrice())) {
			this.query = "UPDATE articles SET price = '" + modifiedBook.getPrice() + "' WHERE isbn ='" + isbn + "';";
		}
		if(query!="") {
			instruction.executeUpdate(query);
		}else {
			throw new SQLException("No se han realizado modificaciones");
		}
		
		
	}
	
	/**
	 * Método que crea un ArrayList con todos los libros que existan en la base de datos
	 * @return el arraylist
	 * @throws SQLException lanza la excepción cuando no se ejecute la sentencia con la base de datos
	 * @throws NumberFormatException lanza la excepción cuando la fecha de publicación no sea correcta
	 * @throws BookException lanza la excepción cuando algún parámetro al crear un objeto Libro no cumpla con
	 * los requisitos de la clase Book
	 */
	public ArrayList<Book> getBooks() throws SQLException, NumberFormatException, BookException {
		this.connection = openConnectionDdbb();
		Statement instruction = connection.createStatement();
		ResultSet bookSet = instruction.executeQuery("Select * from articles;");
		ArrayList<Book> bookList = new ArrayList<>();
		while(bookSet.next()) {
			Book bookItem = new Book(bookSet.getString("isbn"), bookSet.getString("title"), bookSet.getString("author"), 
					LocalDate.parse(bookSet.getString("published_date")), Integer.parseInt(bookSet.getString("quantity")), 
					Double.parseDouble(bookSet.getString("price")), Integer.parseInt(bookSet.getString("stock")));
			
			bookList.add(bookItem);
		}
		return bookList;
	}
	
	
}