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
<% HttpSession sesion = request.getSession();
String isSesion = (String) sesion.getAttribute("login");
String userSesion = (String) sesion.getAttribute("user");
if(isSesion != null && userSesion !=null && isSesion.equals("True")){
	//mostrar página
}else{%>
	<jsp:forward page="error.jsp?msg='No has iniciado sesión'"></jsp:forward>
	<!-- Añadir botón para redireccionar a iniciar sesión -->
<%}
%>
<a href="login.jsp">Cerrar sesión</a>
</body>
</html>