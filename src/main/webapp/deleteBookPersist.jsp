<%@page import="com.jacaranda.model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.dao.DaoBook"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Libro borrado</title>
</head>
<body>
	<%
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession!=null && isSession.equals("True")){%>
		<jsp:useBean id="daoBook" class="com.jacaranda.dao.DaoBook" scope="session" />
		<jsp:useBean id="book" class="com.jacaranda.model.Book" scope="session" />
		
		<% try {
			String genre = book.getGenre().getName();
			daoBook.deleteBook(book.getIsbn());
			%>
			<jsp:forward page="bookList.jsp"><jsp:param value="<%= genre %>" name="value"/></jsp:forward>
		<%
		}catch (Exception e) {
			String message = e.getMessage();
			%>
			<jsp:forward page="errorBackToTable.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward>
			<%
		}
	} else {
		%><jsp:forward page="error.jsp?msg='No te has autenticado.'"></jsp:forward><%
	}%>
	
</body>
</html>