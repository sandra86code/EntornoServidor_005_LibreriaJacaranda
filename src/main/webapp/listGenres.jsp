<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import="com.jacaranda.dao.DaoGenre"%>
<%@ page import="com.jacaranda.model.Genre"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Listado de libros</title>
<link rel="stylesheet" type="text/css" href="css/bookPage.css">
</head>
<body>
	<div id="container">
		<div id="contentBox">
			
	<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession!=null && isSession.equals("True")){
		String user = userSession;
		DaoGenre daog = new DaoGenre();
		ArrayList<Genre> genreList = null;
		try {
			genreList = daog.findAllGenres();
		} catch (Exception e) {
			String message = e.getMessage();
			%><jsp:forward page="error.jsp"><jsp:param name="msg" value="<%= message %>"/></jsp:forward><%
		}%>
			
			<div id="headingTitle">
				<h1>LISTADO DE GÉNEROS DE LA LIBRERIA JACARANDÁ</h1>
			</div>
			<!-- adding userName on main page -->
			<div id="activeUser">
				<h3>Usuario: <%= user %></h3>
			</div>
			<div id="buttons">
				<a href="closeSession.jsp" class="closeSession">Cerrar sesión</a>
				<a href="addGenre.jsp" class="addBook">Añadir Género</a>
			</div>
		
			<div id="table">		
				<table cellspacing="2" cellpadding="2">
					<tr>
						<th>Nombre</th>
						<th>Descripción</th>
						<th colspan="2">Acciones</th>
					</tr>
		<% 
		Iterator<Genre> iterator = genreList.iterator();  
			
		while(iterator.hasNext()) { // iterate through all the data until the last record
			
			Genre genreDetails = iterator.next(); 
			String name = genreDetails.getName();
			%>
				<tr>
					<td><%=name%></td>
					<td><%=genreDetails.getDescription()%></td>
					<td><a href="deleteGenre.jsp?value=<%=name%>"><img src="images/delete.png" width="30px"></a></td>
					<td><a href="updateGenre.jsp?value=<%=name%>"><img src="images/update.png" width="30px"></a></td>
				</tr>
			<%
		}
		
		%>
		</table>
	</div>
	</div>
	</div>
	<%} else {
		%><jsp:forward page="error.jsp?msg='No te has autenticado'"></jsp:forward><%
	}%>
	
</body>
</html>
