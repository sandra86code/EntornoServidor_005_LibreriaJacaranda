<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.articles.DaoBook"%>
<%@ page import="com.jacaranda.articles.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Libro actualizado</title>
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
		El libro se ha actualizado, estos son los datos actualizados: 
		<table>
			<tr>
				<td>ISBN</td>
				<td><%=bookDetails.getIsbn()%></td>
			</tr>
			<tr>
				<td>Título</td>
				<td><%=bookDetails.getTitle()%></td>
			</tr>
			<tr>
				<td>Autor</td>
				<td><%=bookDetails.getAuthor()%></td>
			</tr>
			<tr>
				<td>Fecha de publicación</td>
				<td><%=bookDetails.getPublishedDate()%></td>
			</tr>
			<tr>
				<td>Cantidad</td>
				<td><%=bookDetails.getQuantity()%></td>
			</tr>
			<tr>
				<td>Precio</td>
				<td><%=bookDetails.getPrice()%></td>
			</tr>
			<tr>
				<td>Stock</td>
				<td><%=bookDetails.getStockYN()%></td>
			</tr>
		</table>
		<a href="bookPage.jsp">Volver al listado</a>
<%} else {
		%><jsp:forward page="error.jsp?msg='No te has logueado.'"></jsp:forward><%
	}%>
</body>
</html>