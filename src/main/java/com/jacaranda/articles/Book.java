/**
 * 
 */
package com.jacaranda.articles;

import java.time.LocalDate;
import java.util.Objects;

/**
 * @author sandra
 *
 */
public class Book {
	
	private String isbn;
	private String title;
	private String author;
	private LocalDate publishedDate;
	private int quantity;
	private double price;
	private boolean stock;
	
	
	/**
	 * 
	 */
	public Book() {
		
	}


	public Book(String isbn, String title, String author, LocalDate publishedDate, int quantity, double price) throws BookException {
		super();
		this.setIsbn(isbn);
		this.setTitle(title);
		this.setAuthor(author);
		this.setPublishedDate(publishedDate);
		this.setQuantity(quantity);
		this.setPrice(price);
		this.setStock(quantity);
	}
	
	

	public Book(String isbn, String title, String author, LocalDate publishedDate, int quantity, double price,
			int stock) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.author = author;
		this.publishedDate = publishedDate;
		this.quantity = quantity;
		this.price = price;
		if(stock==0) {
			this.stock = false;
		}else {
			this.stock = true;
		}
	}


	public Book(String isbn) {
		super();
		this.isbn = isbn;
	}


	public String getIsbn() {
		return isbn;
	}


	public String getTitle() {
		return title;
	}


	public String getAuthor() {
		return author;
	}


	public LocalDate getPublishedDate() {
		return publishedDate;
	}


	public int getQuantity() {
		return quantity;
	}


	public double getPrice() {
		return price;
	}


	public int getStock() {
		int result = 0;
		if(stock) {
			result = 1;
		}
		return result;
	}

	public char getStockYN() {
		char stockLetter = 'N';
		if(this.stock) {
			stockLetter = 'S';
		}
		return stockLetter;
	}
	
	private void setIsbn(String isbn) throws BookException {
		String expression = "\'[1-9\']\'[0-9\']{9}";
		if(isbn.matches(expression)) {
			this.isbn = isbn;
		}else {
			throw new BookException("ISBN incorrecto.");
		}
	}


	private void setPublishedDate(LocalDate publishedDate) throws BookException {
		if(publishedDate.isBefore(LocalDate.now())) {
			this.publishedDate = publishedDate;
		}else {
			throw new BookException("Fecha incorrecta.");
		}
	}


	private void setQuantity(int quantity) throws BookException {
		if(quantity>=0) {
			this.quantity = quantity;
		}else {
			throw new BookException("Cantidad incorrecta.");
		}
	}


	private void setPrice(double price) throws BookException {
		if(price>0.0) {
			this.price = price;
		}else {
			throw new BookException("Precio incorrecto.");
		}
	}
	
	private void setTitle(String title) throws BookException {
		if(title.isBlank() || title.isEmpty()) {
			throw new BookException("El título no puede estar vacío.");
		}else {
			this.title = title;
		}
	}
	

	private void setAuthor(String author) throws BookException {
		if(author.isBlank() || author.isEmpty()) {
			throw new BookException("El autor no puede estar vacío.");
		}else {
			this.author = author;
		}
	}
	
	public void setStock(int quantity) throws BookException {
		if((this.quantity>0)) {
			this.stock = true;
		}else if(this.quantity==0){
			this.stock = false;
		}else {
			throw new BookException("Cantidad incorrecta.");
		}
	}


	@Override
	public int hashCode() {
		return Objects.hash(isbn);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		return Objects.equals(isbn, other.isbn);
	}


	@Override
	public String toString() {
		return "Book [isbn=" + isbn + ", title=" + title + ", author=" + author + ", publishedDate=" + publishedDate
				+ ", quantity=" + quantity + ", price=" + price + ", stock=" + stock + "]";
	}

	
}
