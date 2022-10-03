<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book database</title>
<link rel="stylesheet" type="text/css" href="bookPage.css">
</head>
<body>
	<% HttpSession session = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){
/* 		ArrayList bookList = DaoBook */
		%>
		<h1>Listado de libros de la Librería JACARANDÁ</h1>
		
		
	<%}else{%>
		<jsp:forward page="error.jsp?msg='No has iniciado sesión'"></jsp:forward>
		<!-- Añadir botón para redireccionar a iniciar sesión -->
	<%}
	%>
<a href="login.jsp">Cerrar sesión</a>
</body>
</html>