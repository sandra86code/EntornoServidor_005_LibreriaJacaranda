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
	<%String isbn = request.getParameter("isbn"); 
	DaoBook daob = new DaoBook();
	daob.deleteBook(isbn);%>
	<jsp:forward page="bookPage.jsp"></jsp:forward>
</body>
</html>