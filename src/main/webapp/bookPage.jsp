<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.jacaranda.articles.DaoBook"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book database</title>
<link rel="stylesheet" type="text/css" href="bookPage.css">
</head>
<body>
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
			
		<a href="login.jsp">Cerrar sesión</a>
		<h1>Listado de libros de la Librería JACARANDÁ</h1>
		
		<a href="addBook.jsp"><img src="images/add.png" width="30px"></a>
		
		<table cellspacing="2" cellpadding="2">

		<tr>
			<th>ISBN</th>
			<th>Título</th>
			<th>Autor</th>
			<th>Fecha de publicación</th>
			<th>Cantidad</th>
			<th>Precio</th>
			<th>Stock</th>
			<th></th>
			<th></th>
		</tr>
		<%=message%>

		</table>
		<%-- %>
		
	<%}else{%>
		<jsp:forward page="error.jsp?msg='No has iniciado sesión'"></jsp:forward>
		<!-- Añadir botón para redireccionar a iniciar sesión -->
	<%}
	%> --%>

</body>
</html>