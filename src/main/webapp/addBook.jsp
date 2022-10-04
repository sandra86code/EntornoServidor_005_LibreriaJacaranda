<%@page import="java.sql.SQLException"%>
<%@page import="com.jacaranda.articles.BookException"%>
<%@page import="com.jacaranda.articles.DaoBook"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario para añadir libro</title>
<link href="css/addBook.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>

	<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){%>

	<section class="get-in-touch">
		<h1 class="title">Añadir libro</h1>
		<form class="contact-form row" action="addBookPersist.jsp" method="post">
			<div class="form-field col-lg-6">
				<input id="isbn" class="input-text js-input" type="text"  name ="isbn" required>
				<label class="label" for="isbn">ISBN</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="title" class="input-text js-input" type="text" name="title" required>
				<label class="label" for="title">Título</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="author" class="input-text js-input" type="text" name="author" required>
				<label class="label" for="author">Autor</label>
			</div>
			<div class="form-field col-lg-6">
				<input id="quantity" class="input-text js-input" type="number" name="quantity" required> 
				<label class="label" for="quantity">Cantidad</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="price" class="input-text js-input" name="price" type="number" step="any" required>
				<label class="label" for="price">Precio</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="published_date" class="input-text js-input" name="published_date" type="text" required> 
				<label class="label" for="published_date">Fecha
					de publicación (dd/mm/aaaa)</label>
			</div>
			<div class="form-field col-lg-12">
				<input class="submit-btn" type="submit" value="Añadir">
			</div>
			<div class="form-field col-lg-12">
				<input class="back-btn" type="submit" onclick="history.back()"
					value="Cancelar">
			</div>
		</form>
	</section>

	<%}else {%>
	<jsp:forward
		page="error.jsp?msg='Debes iniciar sesión para realizar cualquier cambio.'"></jsp:forward>
<%}%>

</body>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</html>