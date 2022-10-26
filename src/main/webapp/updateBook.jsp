<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="com.jacaranda.dao.DaoBook"%>
<%@ page import="com.jacaranda.model.Book"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%> 
<%@page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/forms.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>LJ - Actualizar libro</title>
<script>

	function TDate() {
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();
		if (dd < 10) {
			dd = '0' + dd;
		}
		if (mm < 10) {
			mm = '0' + mm;
		}

		today = yyyy + '-' + mm + '-' + dd;
		document.getElementById("published_date").setAttribute("max", today);
	}

	function onSubmit() {
		return false;
	}

	function confirmUpdate(genre) {

		if (confirm("¡ATENCIÓN! Estás a punto de actualizar el libro. ¿Estás seguro/a de que quieres continuar?")) {

			var f = document.getElementById("updateBookForm");

			f.submit();
		} else {
			history.back();
		}
	}
</script>
</head>
<body>
	<% //check session
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){ 
   		%>
   		<jsp:useBean id="daob" class="com.jacaranda.dao.DaoBook" scope="session"/>
   		<jsp:useBean id="book" class="com.jacaranda.model.Book" scope="session"/>
   		<%
   		String genre = request.getParameter("genre");
   		String isbn = request.getParameter("value");
   		
		
   		try {
   			Book bookDetails = daob.getBook(isbn);
   			book.setIsbn(bookDetails.getIsbn());
   			book.setTitle(bookDetails.getTitle());
   			book.setAuthor(bookDetails.getAuthor());
   			book.setPublishedDate(bookDetails.getPublishedDate());
   			book.setPrice(bookDetails.getPrice());
   			book.setQuantity(bookDetails.getQuantity());
   			book.setStock(bookDetails.getQuantity());
   			%>
   			
   			<section class="get-in-touch">
			<h1 class="title">Actualizar un libro</h1>
			<form class="contact-form row" action="updateBookPersist.jsp?genre=<%=genre%>&isbn=<jsp:getProperty name="book" property="isbn"/>" id="updateBookForm" method="post" onSubmit="return onSubmit();">
				
				<div class="form-field col-lg-6">
					<!-- Can't be modified -->
					<input id="isbn" class="input-text js-input" type="text" name="isbn" value="<jsp:getProperty name="book" property="isbn"/>" readonly>
					<label class="label" for="isbn">ISBN</label>
				</div>
				<div class="form-field col-lg-6">
					<input id="title" class="input-text js-input" type="text" name="title" value="<jsp:getProperty name="book" property="title"/>" placeholder="Nombre del libro" required>
				
					<label class="label" for="title">Título</label>
				</div>
				<div class="form-field col-lg-6">
					<input id="author" class="input-text js-input" type="text" name="author" value="<jsp:getProperty name="book" property="author"/>" placeholder="Nombre del autor" required>
					<label class="label" for="author">Autor</label>
				</div>
				<div class="form-field col-lg-6 ">
					<input id="date" class="input-text js-input" type="date" name="published_date" value="<jsp:getProperty name="book" property="publishedDate"/>" min='1899-01-01' max='2000-13-13' onclick="TDate()" required>
					<label class="label" for="date">Fecha de publicación</label>
				</div>
				<div class="form-field col-lg-6 ">
					<input id="price" class="input-text js-input" type="text" name="price" value="<jsp:getProperty name="book" property="price"/>" placeholder="Ejemplo: 5" required>
					<label class="label" for="price">Precio</label>
				</div>
				<div class="form-field col-lg-6">
					<input id="quantity" class="input-text js-input" type="number" name="quantity" value="<jsp:getProperty name="book" property="quantity"/>" placeholder="Ejemplo: 1.99" required>
					<label class="label" for="quantity">Cantidad</label>
				</div>
				<div class="form-field col-lg-12">
					<button class="submit-btn" type="submit" name="updateGenre" value=updateBook" onclick="javascript:confirmUpdate()">Actualizar</button>
					<button class="back-btn" id="returnButton" class="returnButton" role="link" onclick="javascript:window.location='bookList.jsp?genre=<%=genre%>';">Cancelar</button>
				</div>
			</form>
		</section>
   			
   			
   		<%}catch(Exception e) {
   			String message = e.getMessage();%>
   			<jsp:forward page="errorBackToTable.jsp"><jsp:param name="error" value="<%= message %>"/><jsp:param name="genre" value="<%= genre %>"/></jsp:forward>
   			<%
   		}%>

	
		
			
	<%}else{%>
		<jsp:forward page="error.jsp?msg='No te has autenticado'"></jsp:forward>
	<%}%>

</body>
</html>