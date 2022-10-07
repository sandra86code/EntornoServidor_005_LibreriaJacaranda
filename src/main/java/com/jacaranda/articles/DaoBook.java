package com.jacaranda.articles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

public class DaoBook {
	
	private Connection connection;
	private String query = "";

	public DaoBook() {
		this.connection = null;
	}
	
	private Connection openConnectionDdbb() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/libreriaJacaranda?useSSL=false","librera","librera");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	public void deleteBook(String isbn) throws SQLException {
		this.connection = openConnectionDdbb();
		Statement instruction = connection.createStatement();
		this.query = "DELETE FROM articles WHERE isbn='" + isbn +"';";
		int affectedRows = instruction.executeUpdate(query);
		if(affectedRows == 0) {
			throw new SQLException("No se ha podido eliminar el libro.");
		}
	}
	
	
	public void addBook(String isbn, String title, String author, LocalDate publishedDate, int quantity, double price) throws BookException, SQLException {
		this.connection = openConnectionDdbb();
		Book existingBook = getBook(isbn);
		
		if(existingBook == null) {
			Book book = new Book(isbn, title, author, publishedDate, quantity, price);
			Statement instruction = connection.createStatement();
			this.query = "INSERT INTO articles VALUES ('" + book.getIsbn() + "','" + book.getTitle() + "','" + book.getAuthor() + "','" + book.getPublishedDate() + "'," + book.getQuantity() + ", " + book.getPrice()+ ", " + book.getStock() + ");";
			instruction.executeUpdate(query);
		} else {
			throw new BookException("El libro ya existe en la base de datos.");
		}
	}

	
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
	

	//PREGUNTAR
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
		instruction.executeUpdate(query);
		
	}
	
	
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