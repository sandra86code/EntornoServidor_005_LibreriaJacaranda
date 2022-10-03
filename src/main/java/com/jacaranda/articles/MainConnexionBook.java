package com.jacaranda.articles;

import java.sql.SQLException;
import java.util.ArrayList;


public class MainConnexionBook {

	public static void main(String[] args) {
		
		DaoBook daob = new DaoBook();
		ArrayList<Book> bookList = null;
		try {
			bookList = daob.getBooks();
		} catch (NumberFormatException | SQLException | BookException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		java.util.Iterator<Book> iterator = bookList.iterator();  // Iterator interface
		
		while(iterator.hasNext()) { // iterate through all the data until the last record
			
			Book bookDetails = iterator.next(); //assign individual employee record to the employee class object			%>
			
			System.out.println(bookDetails.getIsbn());
			System.out.println(bookDetails.getAuthor());
			

		}

	}

}
