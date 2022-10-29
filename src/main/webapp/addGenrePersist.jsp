<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="com.jacaranda.dao.DaoGenre"%>
<%@ page import="com.jacaranda.model.Genre"%>
<%@ page import="com.jacaranda.dao.DaoException"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Añadiendo género</title>
</head>
<body>

<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){
									
		String newName = request.getParameter("name");
		String newDescription= request.getParameter("description");
		
		if(newName == null || newDescription == null){%>
			<jsp:forward
				page="errorBackToGenreTable.jsp?msg='Los campos no son correctos'"></jsp:forward>
		<% } else {
			
			DaoGenre dg = new DaoGenre();
			
			try {
				dg.addGenre(newName, newDescription);%>
				<jsp:forward page="genreList.jsp"></jsp:forward>
				
			<%} catch (Exception e){
				String message = e.getMessage();%>
				<jsp:forward page="errorBackToGenreTable.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward>
			<%}
			
		}

	} else {%>
	<jsp:forward
		page="error.jsp?msg='No te has autenticado'"></jsp:forward>
	<%}%>


</body>
</html>