<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jacaranda.users.DaoUser" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comprobar datos usuario</title>
</head>
<body>
	<%String user = request.getParameter("user");
	String password = request.getParameter("password");
	
	if(DaoUser.userIsValid(user, password)){
		HttpSession sesion = request.getSession();
		session.setAttribute("login", "True");
		session.setAttribute("user", user);%>
		<jsp:forward page="bookPage.jsp"></jsp:forward>
	<%}else{%>
		<jsp:forward page="error.jsp?msg='El usuario o la contraseña no son correctos'"></jsp:forward>
	<%}%>
</body>
</html>