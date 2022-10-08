<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jacaranda.articles.DaoBook" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cerrar sesión</title>
</head>
<body>
	<%
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){
		DaoBook newDaoBook = new DaoBook();
		try {
			newDaoBook.closeConnectionDdbb();%>
			<jsp:forward page="index.jsp"></jsp:forward><%
		}catch (Exception e){
			String message = e.getMessage();%>
			<jsp:forward page="error.jsp"><jsp:param name="msg" value="<%= message %>"/></jsp:forward><%
		}
	}else {%>
		<jsp:forward page="error.jsp?msg='No te has autenticado'"></jsp:forward><%
	}%>


</body>
</html>