<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jacaranda.articles.DaoBook" %>
<%@ page import = "com.jacaranda.articles.Book" %>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/update.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>LJ - Actualizar libro</title>
</head>
<body>
	<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){ 
		DaoBook daob = new DaoBook();
		String isbn = request.getParameter("update");
		try{
			daob.getBook(isbn);
		}catch(Exception e){
			
		}
		%>
	<section class="get-in-touch">
		<h1 class="title">Actualizar un libro</h1>
		<form class="contact-form row" action="updateBook.jsp">
			<div class="form-field col-lg-6">
				<!-- Que no se pueda modificar -->
				<input id="isbn" class="input-text js-input" type="text" value="<%= isbn %>" readonly>
				<label class="label" for="isbn">ISBN</label>
			</div>
			<div class="form-field col-lg-6">
				<input id="title" class="input-text js-input" type="text" required>
				<label class="label" for="title">Título</label>
			</div>
			<div class="form-field col-lg-6">
				<input id="author" class="input-text js-input" type="text" required>
				<label class="label" for="author">Autor</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="date" class="input-text js-input" type="date" required>
				<label class="label" for="date">Fecha de publicación</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="price" class="input-text js-input" type="text" required>
				<label class="label" for="price">Precio</label>
			</div>
			<div class="form-field col-lg-6">
				<input id="quantity" class="input-text js-input" type="number" required>
				<label class="label" for="quantity">Cantidad</label>
			</div>
			<div class="form-field col-lg-12">
				<input class="submit-btn" type="submit" value="Submit">
			</div>
		</form>
	</section>
	<%try {
		//llamarse a si mismo y actualizar datos
		/* 
		String isbn, String title, String author, LocalDate publishedDate, int quantity, double price */
		daob.updateBook(isbn);
	} catch (Exception e) {

	}
	}else{%>
		<jsp:forward page="error.jsp?msg='No estás logueado'"></jsp:forward>
	<%}%>

</body>
</html>