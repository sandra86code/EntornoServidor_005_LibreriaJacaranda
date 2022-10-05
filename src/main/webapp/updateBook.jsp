<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jacaranda.articles.DaoBook" %>
<%@ page import = "com.jacaranda.articles.Book" %>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%> 
<%@page import="java.time.LocalDate"%> 
<%@page import="java.time.format.DateTimeFormatter" %>
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
	<% //check session
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){ 
   		Map params = request.getParameterMap();
   		DaoBook daob = new DaoBook();
   		String isbn = request.getParameter("isbn");
   		//if the form has been submited
		if(params.size()>1){
			/* String isbn, String title, String author, LocalDate publishedDate, int quantity, double price */
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			//DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
			String date = request.getParameter("published_date");
			LocalDate publishedDate = LocalDate.parse(request.getParameter("published_date"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			double price = Double.parseDouble(request.getParameter("price"));
			//isbn repetido, cambiar
			Book modified = new Book(isbn, title, author, publishedDate, quantity, price);
			daob.updateBook(isbn, modified); %>
			<jsp:forward page="confirmUpdate.jsp"></jsp:forward>
		<%}else{
			
			Book book = null;
			try{
				book = daob.getBook(isbn);
			}catch(Exception e){
				
			}
		
		%>
	<section class="get-in-touch">
		<h1 class="title">Actualizar un libro</h1>
		<form class="contact-form row" action="updateBook.jsp">
			<div class="form-field col-lg-6">
				<!-- Can't be modified -->
				<input id="isbn" class="input-text js-input" type="text" name="isbn" value="<%= isbn %>" readonly>
				<label class="label" for="isbn">ISBN</label>
			</div>
			<div class="form-field col-lg-6">
				<input id="title" class="input-text js-input" type="text" name="title" value="<%= book.getTitle() %>" required>
				<label class="label" for="title">Título</label>
			</div>
			<div class="form-field col-lg-6">
				<input id="author" class="input-text js-input" type="text" name="author" value="<%= book.getAuthor() %>" required>
				<label class="label" for="author">Autor</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="date" class="input-text js-input" type="date" name="published_date" value="<%= book.getPublishedDate() %>" required>
				<label class="label" for="date">Fecha de publicación</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="price" class="input-text js-input" type="text" name="price" value="<%= book.getPrice() %>" required>
				<label class="label" for="price">Precio</label>
			</div>
			<div class="form-field col-lg-6">
				<input id="quantity" class="input-text js-input" type="number" name="quantity" value="<%= book.getQuantity() %>" required>
				<label class="label" for="quantity">Cantidad</label>
			</div>
			<div class="form-field col-lg-12">
				<input class="submit-btn" type="submit" value="Actualizar">
			</div>
		</form>
	</section>
	<%}
   	}else{%>
		<jsp:forward page="error.jsp?msg='No estás logueado'"></jsp:forward>
	<%}%>

</body>
</html>