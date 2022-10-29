<%@page import="com.jacaranda.model.Genre"%>
<%@page import="com.jacaranda.dao.DaoGenre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="com.jacaranda.dao.DaoBook"%>
<%@ page import="com.jacaranda.model.Book"%>
<%@ page import="com.jacaranda.model.Genre"%>
<%@page import="java.time.LocalDate"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Añadir libro</title>
</head>
<body>
	<jsp:useBean id="newBook" class="com.jacaranda.model.Book"/>
	<jsp:useBean id="daog" class="com.jacaranda.dao.DaoGenre" scope="session"/>
<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){ 
		
		Genre genre = daog.getGenre(request.getParameter("genre"));
		LocalDate date = LocalDate.parse(request.getParameter("published_date"));%>
	
		<jsp:setProperty name="newBook" property="isbn" param="isbn"/>
		<jsp:setProperty name="newBook" property="title" param="title"/>
		<jsp:setProperty name="newBook" property="author" param="author"/>
		<jsp:setProperty name="newBook" property="publishedDate" value="<%=date%>"/>
		<jsp:setProperty name="newBook" property="quantity" param="quantity"/>
		<jsp:setProperty name="newBook" property="price" param="price"/>
	
	<%	if(newBook.getIsbn() == null || newBook.getIsbn().isEmpty() || newBook.getTitle() == null || newBook.getTitle().isEmpty() || newBook.getAuthor() == null || newBook.getAuthor().isEmpty() ||
		newBook.getPublishedDate() == null || newBook.getPublishedDate().toString().isEmpty() || newBook.getQuantity() < 0 || newBook.getPrice() < 0){%>
			<jsp:forward page="errorBackToTable.jsp?error='Los campos no son correctos'">
				<jsp:param name="genre" value="<%= genre.getName() %>"/>
			</jsp:forward>
		<% } else {
			DaoBook daob = new DaoBook();
			
			try {
				daob.addBook(newBook, genre);%>
				<jsp:forward page="bookList.jsp"><jsp:param name="value" value="<%= newBook.getGenre().getName() %>"/></jsp:forward>
				
			<%} catch (Exception e){
					String message = e.getMessage();%>
				<jsp:forward page="errorBackToTable.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward>
			<%}
			
		}

	} else {%>
	<jsp:forward
		page="error.jsp?msg='No te has autenticado'"></jsp:forward>
	<%}%>


</body>
</html>