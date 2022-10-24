<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="com.jacaranda.dao.DaoBook"%>
<%@ page import="com.jacaranda.model.Book"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%> 
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
document.getElementById("date").setAttribute("max", today);
}
</script>
</head>
<body>
	<% //check session
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){ 
   		Map params = request.getParameterMap();
   		DaoBook daob = new DaoBook();
   		
   		
   		//if the form has been submited
		if(params.size()>1){
			//save the values
			String isbn = request.getParameter("isbn");
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			LocalDate publishedDate = LocalDate.parse(request.getParameter("published_date"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			double price = Double.parseDouble(request.getParameter("price"));
			
			
			//create a book without isbn and use the java update function
			Book modified = new Book(title, author, publishedDate, quantity, price);
			try {
				daob.updateBook(isbn, modified); 
				%><jsp:forward page="confirmUpdate.jsp"><jsp:param name="isbn" value="<%= isbn %>"/></jsp:forward><%
			}catch(Exception e) {
				String message = e.getMessage();
				%><jsp:forward page="errorBackToTable.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward><%
			}
		}else{
			String isbn = request.getParameter("value");
			Book book = null;
			try{
				book = daob.getBook(isbn);
				String genre = book.getGenre().getName(); %>
			
				<section class="get-in-touch">
					<h1 class="title">Actualizar un libro</h1>
					<form class="contact-form row" action="updateBook.jsp">
						<div class="form-field col-lg-6">
							<!-- Can't be modified -->
							<input id="isbn" class="input-text js-input" type="text" name="isbn" value="<%= isbn %>" placeholder="XXXXXXXXXX - Ejemplo: 0123456789" readonly>
							<label class="label" for="isbn">ISBN</label>
						</div>
						<div class="form-field col-lg-6">
							<input id="title" class="input-text js-input" type="text" name="title" value="<%= book.getTitle() %>" placeholder="Nombre del libro" required>
							<label class="label" for="title">Título</label>
						</div>
						<div class="form-field col-lg-6">
							<input id="author" class="input-text js-input" type="text" name="author" value="<%= book.getAuthor() %>" placeholder="Nombre del autor" required>
							<label class="label" for="author">Autor</label>
						</div>
						<div class="form-field col-lg-6 ">
							<input id="date" class="input-text js-input" type="date" name="published_date" value="<%= book.getPublishedDate() %>" min='1899-01-01' max='2000-13-13' onclick="TDate()" required>
							<label class="label" for="date">Fecha de publicación</label>
						</div>
						<div class="form-field col-lg-6 ">
							<input id="price" class="input-text js-input" type="text" name="price" value="<%= book.getPrice() %>" placeholder="Ejemplo: 5" required>
							<label class="label" for="price">Precio</label>
						</div>
						<div class="form-field col-lg-6">
							<input id="quantity" class="input-text js-input" type="number" name="quantity" value="<%= book.getQuantity() %>" placeholder="Ejemplo: 1.99" required>
							<label class="label" for="quantity">Cantidad</label>
						</div>
						<div class="form-field col-lg-12">
							<button class="submit-btn" type="submit">Actualizar</button>
							<a href="bookList.jsp?value=<%= genre %>" class="back-btn">Cancelar</a>
						</div>
					</form>
				</section>
			<%
			}catch(Exception e){
				String message = e.getMessage();%>
				<jsp:forward page="errorBackToTable.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward><%
			}
		}
   	}else{%>
		<jsp:forward page="error.jsp?msg='No te has autenticado'"></jsp:forward>
	<%}%>

</body>
</html>