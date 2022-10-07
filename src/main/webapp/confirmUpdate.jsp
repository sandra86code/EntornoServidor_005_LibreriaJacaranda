<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.articles.DaoBook"%>
<%@ page import="com.jacaranda.articles.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Libro actualizado</title>
<link href="css/showData.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession!=null && isSession.equals("True")){
		DaoBook daob = new DaoBook();
		Book bookDetails = null;
		String isbn = request.getParameter("isbn");
		try {
			bookDetails = daob.getBook(isbn);
		} catch (Exception e) {
			String message = e.getMessage();
			%><jsp:forward page="error.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward><%
		}%>
		<section class="get-in-touch">
		<h1 class="title">Datos actualizados</h1>
		<form class="contact-form row" method="post">
		<table>
			<tr class="form-field col-md-6">
				<td class="labelTable">ISBN</td>
				<td class="table"><%=bookDetails.getIsbn()%></td>
			</tr>
			<tr class="form-field col-md-6">
				<td class="labelTable">Título</td>
				<td class="table"><%=bookDetails.getTitle()%></td>
			</tr>
			<tr class="form-field col-md-6">
				<td class="labelTable">Autor</td>
				<td class="table"><%=bookDetails.getAuthor()%></td>
			</tr>
			<tr class="form-field col-md-6">
				<td class="labelTable">Fecha de publicación</td>
				<td class="table"><%=bookDetails.getPublishedDate()%></td>
			</tr>
			<tr class="form-field col-md-6">
				<td class="labelTable">Cantidad</td>
				<td class="table"><%=bookDetails.getQuantity()%></td>
			</tr>
			<tr class="form-field col-md-6">
				<td class="labelTable">Precio</td>
				<td class="table"><%=bookDetails.getPrice()%></td>
			</tr>
			<tr class="form-field col-md-6">
				<td class="labelTable">Stock</td>
				<td class="table"><%=bookDetails.getStockYN()%></td>
			</tr>
		</table>
		<a href="bookPage.jsp" class="back-btn">Volver al listado</a>
		</form>
		</section>
<%} else {
		%><jsp:forward page="error.jsp?msg='No te has autenticado.'"></jsp:forward><%
	}%>
</body>
</html>