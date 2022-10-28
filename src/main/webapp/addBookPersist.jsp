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
	<jsp:useBean id="newBook" class="com.jacaranda.model.Book"/>
<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){ %>
	
		<jsp:setProperty name="newBook" property="isbn" param="isbn"/>
		<jsp:setProperty name="newBook" property="title" param="title"/>
		<jsp:setProperty name="newBook" property="author" param="author"/>
		<jsp:setProperty name="newBook" property="publishedDate" param="${LocalDate.parse(request.getParameter('published_date')"/>
		<jsp:setProperty name="newBook" property="quantity" param="quantity"/>
		<jsp:setProperty name="newBook" property="price" param="price"/>
		<jsp:setProperty name="newBook" property="genre" param="genre"/>
	
	<%	if(newBook.getIsbn() == null || newBook.getIsbn().isEmpty() || newBook.getTitle() == null || newBook.getTitle().isEmpty() || newBook.getAuthor() == null || newBook.getAuthor().isEmpty() ||
		newBook.getPublishedDate() == null || newBook.getPublishedDate().toString().isEmpty() || newBook.getQuantity() < 0 || newBook.getPrice() < 0 ||
		 newBook.getGenre() == null){%>
			<jsp:forward page="error.jsp?msg='Los campos no son correctos'"></jsp:forward>
		<% } else {
			DaoBook daob = new DaoBook();
			
			try {
				daob.addBook(newBook);%>
				<jsp:forward page="bookList.jsp"><jsp:param name="value" value="<%= newBook.getGenre() %>"/></jsp:forward>
				
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