<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.dao.DaoBook"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="com.jacaranda.model.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Libro actualizado</title>
<link href="css/showData.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession!=null && isSession.equals("True")){
		
   		String genre = request.getParameter("genre");
   		String date = request.getParameter("published_date");
   		
   		%>
   		<jsp:useBean id="daob" class="com.jacaranda.dao.DaoBook" scope="session"/>
   		<jsp:useBean id="book" class="com.jacaranda.model.Book" scope="session"/>
   		<jsp:setProperty property="*" name="book"/>
		<%	
		try {
			boolean result = daob.updateBook(book.getIsbn(), book, LocalDate.parse(date));
			if(!result) {
				%><jsp:forward page="errorBackToTable.jsp"><jsp:param name="error" value="No has realizado ningun cambio en el libro"/>
				<jsp:param name="genre" value="<%= genre %>"/></jsp:forward><%
			}else {%>
	
   				
		   		<section class="get-in-touch">
				<h1 class="title">Datos actualizados</h1>
				<form class="contact-form row" method="post">
				<table>
					<tr class="form-field col-md-6">
						<td class="labelTable">ISBN</td>
						<td class="table"><jsp:getProperty name="book" property="isbn"/></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Título</td>
						<td class="table"><jsp:getProperty name="book" property="title"/></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Autor</td>
						<td class="table"><jsp:getProperty name="book" property="author"/></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Fecha de publicación</td>
						<td class="table"><%=date%></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Precio</td>
						<td class="table"><jsp:getProperty name="book" property="price"/></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Cantidad</td>
						<td class="table"><jsp:getProperty name="book" property="quantity"/></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Stock</td>
						<td class="table"><jsp:getProperty name="book" property="stock"/></td>
					</tr>
				</table>
				<a href="bookList.jsp?genre=<%=genre %>" class="back-btn">Volver al listado</a>
				</form>
				</section><%
			}
		} catch (Exception e) {
			String message = e.getMessage();%>
			<jsp:forward page="errorBackToTable.jsp"><jsp:param name="error" value="<%= message %>"/>
			<jsp:param name="genre" value="<%= genre %>"/></jsp:forward><%
		}
	} else {
		%><jsp:forward page="error.jsp?msg='No te has autenticado.'"></jsp:forward><%
	}%>
</body>
</html>