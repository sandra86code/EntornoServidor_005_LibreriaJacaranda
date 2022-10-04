<%@page import="com.jacaranda.articles.DaoBook"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<form class="contact-form row" action="addBook.jsp" method="post">
			<div class="form-field col-lg-6">
				<input id="isbn" class="input-text js-input" type="text" required>
				<label class="label" for="isbn">ISBN</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="title" class="input-text js-input" type="text" required>
				<label class="label" for="title">Título</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="author" class="input-text js-input" type="text" required>
				<label class="label" for="author">Autor</label>
			</div>
			<div class="form-field col-lg-6">
				<input id="quantity" class="input-text js-input" type="number"
					required> <label class="label" for="quantity">Cantidad</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="price" class="input-text js-input" type="number" required>
				<label class="label" for="price">Precio</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="published_date" class="input-text js-input" type="text"
					required> <label class="label" for="published_date">Fecha
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


	<%
//recuperar parametros del formulario y llamar al daobook para hacer el insert 
//controlar cualquier errores

		String empty = "";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
									
		String newIsbn = request.getParameter("isbn");
		String newTitle = request.getParameter("title");
		String newAuthor = request.getParameter("author");
		String newPublished_date = request.getParameter("published_date");
		int newQuantity = Integer.parseInt(request.getParameter("quantity"));
		double newPrice = Double.parseDouble(request.getParameter("price"));
		
		
		if(newIsbn == null || empty.equals(newIsbn) || newTitle == null || empty.equals(newTitle) || newAuthor == null || empty.equals(newAuthor) ||
		newPublished_date == null || empty.equals(newPublished_date) || newQuantity < 0 || newPrice < 0){%>
			<jsp:forward
				page="error.jsp?msg='Los campos no son correctos.'"></jsp:forward>
		<% } else {
			LocalDate date = LocalDate.parse(newPublished_date, formatter);
			
			DaoBook newDaoBook = new DaoBook();
			
		/* 	try {
				newDaoBook.addBook(newIsbn, newTitle, newAuthor, date, newQuantity, newPrice);
			} catch (DaoBookException e){
				
			} */
			
		}%>

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