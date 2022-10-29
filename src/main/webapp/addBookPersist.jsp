<%@page import="com.jacaranda.model.Genre"%>
<%@page import="com.jacaranda.dao.DaoGenre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="com.jacaranda.dao.DaoBook"%>
<%@ page import="com.jacaranda.model.Book"%>
<%@page import="java.time.LocalDate"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Añadir libro</title>
</head>
<body>

<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){
		%>
		<jsp:useBean id="daob" class="com.jacaranda.dao.DaoBook" scope="session"/>
		<%
		
		String newIsbn = request.getParameter("isbn");
		String newTitle = request.getParameter("title");
		String newAuthor = request.getParameter("author");
		String newPublishedDate = request.getParameter("published_date");
		int newQuantity = Integer.parseInt(request.getParameter("quantity"));
		double newPrice = Double.parseDouble(request.getParameter("price"));
		String genre = request.getParameter("genre");
		
		DaoGenre newDaoGenre = new DaoGenre();
		
		try {
			Genre newGenre = newDaoGenre.getGenre(genre);
			daob.addBook(newIsbn, newTitle, newAuthor, LocalDate.parse(newPublishedDate), newQuantity, newPrice, newGenre);%>
			<jsp:forward page="bookList.jsp"><jsp:param name="genre" value="<%= genre %>"/></jsp:forward>
		<%} catch (Exception e){
				String message = e.getMessage();%>
			<jsp:forward page="errorBackToTable.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward>
		<%}
			


	} else {%>
	<jsp:forward
		page="error.jsp?msg='No te has autenticado'"></jsp:forward>
	<%}%>


</body>
</html>