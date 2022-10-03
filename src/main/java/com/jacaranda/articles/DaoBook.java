package com.jacaranda.articles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;

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
	
	public String showTable() throws NumberFormatException, SQLException, BookException {
		StringBuilder message = new StringBuilder();
		ArrayList<Book> bookList = getBooks();
		Iterator<Book> iterator = bookList.iterator();  // Iterator interface
		
		while(iterator.hasNext()) { // iterate through all the data until the last record
			
			Book bookDetails = iterator.next(); 
			char stock = 'N';
			if(bookDetails.getStock()==1) {
				stock = 'S';
			}
			message.append("<tr>\n"
					+ "\t<td>" + bookDetails.getIsbn() + "</td>\n"
					+ "\t<td>" + bookDetails.getTitle() + "</td>\n"
					+ "\t<td>" + bookDetails.getAuthor() + "</td>\n"
					+ "\t<td>" + bookDetails.getPublishedDate() + "</td>\n"
					+ "\t<td>" + bookDetails.getQuantity() + "</td>\n"
					+ "\t<td>" + bookDetails.getPrice() + "</td>\n"
					+ "\t<td>" + stock + "</td>\n"
					+ "\t<td><a href=\"deleteBook.jsp\"><img src=\"images/delete.png\" id=\"<%=bookDetails.getIsbn()%>\" width=\"30px\"></a></td>\n"
					+ "\t<td><a href=\"updateBook.jsp\"><img src=\"images/update.png\" id=\"<%=bookDetails.getIsbn()%>\" width=\"30px\"></a></td>\n"
					+ "</tr>\n");
		}
		
		return message.toString();
	}
	
	public String showBook(String isbn) throws SQLException {
		Book bookItem = getBook(isbn);
		char stock = 'N';
		if(bookItem.getStock()==1) {
			stock = 'S';
		}
		
		String message = "<tr>\n"
				+ "\t<td>ISBN</td>\n"
				+ "\t<td>" + bookItem.getIsbn() + "</td>\n"
				+ "</tr>\n<tr>\n"
				+ "\t<td>Título</td>\n"
				+ "\t<td>" + bookItem.getTitle() + "</td>\n"
				+ "</tr>\n<tr>\n"
				+ "\t<td>Autor</td>\n"
				+ "\t<td>" + bookItem.getAuthor() + "</td>\n"
				+ "</tr>\n<tr>\n"
				+ "\t<td>Fecha de publicación</td>\n"
				+ "\t<td>" + bookItem.getPublishedDate() + "</td>\n"
				+ "</tr>\n<tr>\n"
				+ "\t<td>Cantidad</td>\n"
				+ "\t<td>" + bookItem.getQuantity() + "</td>\n"
				+ "</tr>\n<tr>\n"
				+ "\t<td>Precio</td>\n"
				+ "\t<td>" + bookItem.getPrice() + "</td>\n"
				+ "</tr>\n<tr>\n"
				+ "\t<td>Stock</td>\n"
				+ "\t<td>" + stock + "</td>\n"
				+ "</tr>\n";
		
		return message;
	}
	
}