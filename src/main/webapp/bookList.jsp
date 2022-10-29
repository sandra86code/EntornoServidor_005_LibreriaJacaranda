<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import="com.jacaranda.dao.DaoBook"%>
<%@ page import="com.jacaranda.model.Book"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Listado de libros</title>
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
		String genre = request.getParameter("genre");
		String user = userSession;
		DaoBook daob = new DaoBook();
		ArrayList<Book> bookList = null;
		try {
			bookList = daob.findBooksByGenre(genre);
		} catch (Exception e) {
			String message = e.getMessage();
			%><jsp:forward page="error.jsp"><jsp:param name="msg" value="<%= message %>"/></jsp:forward><%
		}%>
			
			<div id="headingTitle">
				<h1>LISTADO DE LIBROS DEL GÉNERO <%=genre.toUpperCase()%> LA LIBRERIA JACARANDÁ</h1>
			</div>
			<!-- adding userName on main page -->
			<div id="activeUser">
				<h3>Usuario: <%= user %></h3>
			</div>
			<div id="buttons"  class="buttonsBook">
				<a href="closeSession.jsp" class="closeSession">Cerrar sesión</a>
				<a href="genreList.jsp" class="backGenre">Volver a Géneros</a>
				<a href="addBook.jsp?genre=<%=genre%>" class="addBook">Añadir libro</a>
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
		<%if(bookList!=null) {
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
					
						<td><a href="deleteBook.jsp?value=<%=bookDetails.getIsbn()%>&genre=<%=genre%>"><img src="images/delete.png" width="30px"></a></td>
						<td><a href="updateBook.jsp?value=<%=bookDetails.getIsbn()%>&genre=<%=genre%>"><img src="images/update.png" width="30px"></a></td>
					</tr>
				<%
			}
		}
		
		%>
		</table>
	</div>
	</div>
	</div>
	<%} else {
		%><jsp:forward page="error.jsp?msg='No te has autenticado'"></jsp:forward><%
	}%>
	
</body>
</html>
