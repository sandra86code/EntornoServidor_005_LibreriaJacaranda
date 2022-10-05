<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.articles.DaoBook"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrado</title>
</head>
<body>
	<%
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession!=null && isSession.equals("True")){
		String isbn = request.getParameter("isbn"); 
		DaoBook daob = new DaoBook();
		daob.deleteBook(isbn);%>
		<jsp:forward page="bookPage.jsp"></jsp:forward>
	<%} else {
		%><jsp:forward page="error.jsp?msg='No te has logueado.'"></jsp:forward><%
	}%>
	
</body>
</html>