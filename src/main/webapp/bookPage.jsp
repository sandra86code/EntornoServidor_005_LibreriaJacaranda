<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.jacaranda.articles.DaoBook"%>
<%@ page import="com.jacaranda.articles.Book"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book database</title>
<link rel="stylesheet" type="text/css" href="css/bookPage.css">
</head>
<body>
	<div id="container">
		<div id="contentBox">
			
	<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession!=null && isSession.equals("True")){
		DaoBook daob = new DaoBook();
		ArrayList<Book> bookList = null;
		try {
			bookList = daob.getBooks();
		} catch (Exception e) {
			String message = e.getMessage();
			%><jsp:forward page="error.jsp?msg='<%=message%>'"></jsp:forward><%
		}%>
			
			<div id="headingTitle">
				<h1>LISTADO DE LIBROS DE LA LIBRERIA JACARANDÁ</h1>
			</div>
			
			<div id="buttons">
				<a href="login.jsp" class="closeSession">Cerrar sesión</a>
				<a href="addBook.jsp" class="addBook">Añadir libro</a>
			</div>
		
			<div id="table">		
				<table cellspacing="2" cellpadding="2">
					<tr>
						<th>ISBN</th>
						<th>Título</th>
						<th>Autor</th>
						<th>Fecha de publicación</th>
						<th>Cantidad</th>
						<th>Precio</th>
						<th>Stock</th>
						<th colspan="2">Acciones</th>
					</tr>
		<% 
		Iterator<Book> iterator = bookList.iterator();  
			
		while(iterator.hasNext()) { // iterate through all the data until the last record
			
			Book bookDetails = iterator.next(); 
			String isbn = bookDetails.getIsbn();
			%>
				<tr>
					<td><%=bookDetails.getIsbn()%></td>
					<td><%=bookDetails.getTitle()%></td>
					<td><%=bookDetails.getAuthor()%></td>
					<td><%=bookDetails.getPublishedDate()%></td>
					<td><%=bookDetails.getQuantity()%></td>
					<td><%=bookDetails.getPrice()%></td>
					<td><%=bookDetails.getStockYN()%></td>
				
					<td><a href="deleteBook.jsp?value=<%=bookDetails.getIsbn()%>"><img src="images/delete.png" width="30px"></a></td>
					<td><a href="updateBook.jsp?value=<%=bookDetails.getIsbn()%>"><img src="images/update.png" width="30px"></a></td>
				</tr>
			<%
		}
		
		%>
		</table>
	</div>
	</div>
	</div>
	<%} else {
		%><jsp:forward page="error.jsp?msg='No te has logueado.'"></jsp:forward><%
	}%>
	
</body>
</html>