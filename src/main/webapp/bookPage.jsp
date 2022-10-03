<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.jacaranda.articles.DaoBook"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book database</title>
<link rel="stylesheet" type="text/css" href="css/bookPage.css">
</head>
<body>
	<div id="container">
		<div id="tableBox">
			
	<% 
	/* HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){ */
		DaoBook daob = new DaoBook();
		String message = "";
		try {
			message = daob.showTable();
		} catch (Exception e) {
		
		}%>
			
		<a href="login.jsp" class="closeSession">Cerrar sesión</a>
		
		<div id="content">
		<h1>LISTADO DE LIBROS DE LA LIBRERIA JACARANDÁ</h1>
		
		<a href="addBook.jsp" class="addBook">Añadir libro</a>
		
		<table cellspacing="2" cellpadding="2">

		<tr>
			<th>ISBN</th>
			<th>Título</th>
			<th>Autor</th>
			<th>Fecha de publicación</th>
			<th>Cantidad</th>
			<th>Precio</th>
			<th>Stock</th>
			
		</tr>
		<%=message%>

		</table>
		</div>
		</div>
	</div>

</body>
</html>