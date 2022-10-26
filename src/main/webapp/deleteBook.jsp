<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.dao.DaoBook"%>
<%@ page import="com.jacaranda.model.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Eliminar libro</title>
<link href="css/showData.css" rel="stylesheet" id="bootstrap-css">
<script>
function onSubmit(){
    return false;
}

function confirmDelete(genre) {
   	if (confirm("¿Estás seguro/a de querer borrar el libro?")) {
    	document.getElementById("deleteForm").submit();
    } else {
    	window.location='bookList.jsp?genre=' + genre;
    }
}


</script>
</head>
<body>

<jsp:useBean id="daoBook" class="com.jacaranda.dao.DaoBook" scope="session" />
<jsp:useBean id="book" class="com.jacaranda.model.Book" scope="session" />
<jsp:useBean id="genre" class="com.jacaranda.model.Genre" scope="session" />

	<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession!=null && isSession.equals("True")){ 
		String isbn = request.getParameter("value");
	
		try {
			
			Book bookDetails = daoBook.getBook(isbn);
			book.setIsbn(bookDetails.getIsbn());
			book.setTitle(bookDetails.getTitle());
			book.setAuthor(bookDetails.getAuthor());
			book.setQuantity(bookDetails.getQuantity());
			book.setPrice(bookDetails.getPrice());
			book.setStock(bookDetails.getQuantity());
			book.setPublishedDate(bookDetails.getPublishedDate());
			
			genre.setName(bookDetails.getGenre().getName());
			
		} catch (Exception e) {
			String message = e.getMessage();
			%>
			
			<jsp:forward page="error.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward>
			
			
	<% } %>
		
		
		<section class="get-in-touch">
		<h1 class="title">Borrar libro</h1>
		
		<form class="contact-form row" action="deleteBookPersist.jsp" method="post" id="deleteForm" onSubmit="return onSubmit();">
				<table>
					<tr class="form-field col-md-6">
						<td class="labelTable"><jsp:getProperty property="isbn" name="book"/></td>
						<td class="table"><input type="hidden" name="isbn" value='<jsp:getProperty property="isbn" name="book"/>'></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Título</td>
						<td class="table"><jsp:getProperty property="title" name="book"/></td>
					</tr>
					<tr class="form-field col-md-6"> 
						<td class="labelTable">Autor</td>
						<td class="table"><jsp:getProperty property="author" name="book"/></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Fecha de publicación</td>
						<td class="table"><jsp:getProperty property="publishedDate" name="book"/></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Cantidad</td>
						<td class="table"><jsp:getProperty property="quantity" name="book"/></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Precio</td>
						<td class="table"><jsp:getProperty property="price" name="book"/> </td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Stock</td>
						<td class="table"><jsp:getProperty property="stockYN" name="book"/> </td>
					</tr>
				</table>

			<div class="form-field col-lg-12">
				<button class="submit-btn" type="submit" name="deleteBook" value="deleteBook" onclick="confirmDelete('<%= genre.getName() %>')">Borrar</button>
				<button class="back-btn" id="returnButton" class="returnButton" role="link" onclick="javascript:window.location='bookList.jsp?genre=<%= genre.getName() %>';">Cancelar</button>
			</div>
		</form>
		</section>
	<%} else {
		%><jsp:forward page="error.jsp?msg='No te has autenticado.'"></jsp:forward><%
	}%>

</body>
</html>