<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import="com.jacaranda.dao.DaoGenre"%>
<%@ page import="com.jacaranda.model.Genre"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
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
			genreList = daog.getAllGenres();
		%>
			
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
				<table cellspacing="2" cellpadding="2" class="listGenres">
					<tr>
						<th>Nombre</th>
						<th>Descripción</th>
						<th colspan="3">Acciones</th>
					</tr>
			<%Iterator<Genre> it = genreList.iterator();
			while(it.hasNext()){
			    Genre g = it.next();%>
					<tr>
						<td><%=g.getName()%></td>
						<td><%=g.getDescription()%></td>
						<td><a href="bookList.jsp?value=<%=g.getName()%>">Ver libros</a></td>
						<td><a href="deleteGenre.jsp?value=<%=g.getName()%>"><img src="images/delete.png" width="30px"></a></td>
						<td><a href="updateGenre.jsp?value=<%=g.getName()%>"><img src="images/update.png" width="30px"></a></td>
					</tr>
			<%}
		
		%>
		</table>
	</div>
	</div>
	</div><%
		} catch (Exception e) {
			String message = e.getMessage();
			%><jsp:forward page="error.jsp"><jsp:param name="msg" value="<%= message %>"/></jsp:forward><%
		}
	} else {
		%><jsp:forward page="error.jsp?msg='No te has autenticado'"></jsp:forward><%
	}%>
	
</body>
</html>
