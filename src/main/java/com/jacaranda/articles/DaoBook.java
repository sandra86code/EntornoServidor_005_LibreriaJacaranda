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
		Book book = new Book(isbn, title, author, publishedDate, quantity, price);
		Statement instruction = connection.createStatement();
		this.query = "INSERT INTO articles VALUES ('" + book.getIsbn() + "','" + book.getTitle() + "','" + book.getAuthor() 
			+ "','" + book.getPublishedDate() + "','" + book.getQuantity() + "','" + book.getStock() + "';";
		instruction.executeUpdate(query);
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
	public void updateBook(String isbn, String title, String author, LocalDate publishedDate, int quantity, double price) throws BookException, SQLException {
		this.connection = openConnectionDdbb();
		Book book = getBook(isbn);
		Statement instruction = connection.createStatement();
		if(!book.getTitle().equals(title) && !title.equals("")) {
			this.query = "UPDATE articles SET title = '" + book.getTitle() + "' WHERE isbn ='" + isbn + "';";
		}
		if(!book.getAuthor().equals(author) && !author.equals("")) {
			this.query = "UPDATE articles SET author = '" + book.getAuthor() + "' WHERE isbn ='" + isbn + "';";
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