<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.articles.DaoBook"%>
<%@ page import="com.jacaranda.articles.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Book</title>
<script>
function onSubmit(){
    return false;
}

function confirmDelete() {
   	if (confirm("¿Estás seguro/a de querer borrar el libro?")) {
    	document.getElementById("deleteForm").submit();
    } else {
    	window.location='bookPage.jsp'
    }
}


</script>
</head>
<body>
	<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession!=null && isSession.equals("True")){
		DaoBook daob = new DaoBook();
		Book bookDetails = null;
		String isbn = request.getParameter("value");
		try {
			bookDetails = daob.getBook(request.getParameter("value"));
		} catch (Exception e) {
			String message = e.getMessage();
			%><jsp:forward page="error.jsp?msg='<%=message%>'"></jsp:forward><%
		}%>
		<form action="deleteBookPersist.jsp" method="post" id="deleteForm" onSubmit="return onSubmit();">
		<table>
			<tr>
				<td>ISBN</td>
				<td><input type="hidden" name="isbn" value="<%=bookDetails.getIsbn()%>"><%=bookDetails.getIsbn()%></td>
			</tr>
			<tr>
				<td>Título</td>
				<td><%=bookDetails.getTitle()%></td>
			</tr>
			<tr>
				<td>Autor</td>
				<td><%=bookDetails.getAuthor()%></td>
			</tr>
			<tr>
				<td>Fecha de publicación</td>
				<td><%=bookDetails.getPublishedDate()%></td>
			</tr>
			<tr>
				<td>Cantidad</td>
				<td><%=bookDetails.getQuantity()%></td>
			</tr>
			<tr>
				<td>Precio</td>
				<td><%=bookDetails.getPrice()%></td>
			</tr>
			<tr>
				<td>Stock</td>
				<td><%=bookDetails.getStockYN()%></td>
			</tr>
		</table>
		<button type="submit" name="deleteBook" value="deleteBook" onclick="confirmDelete()">Borrar</button>
		<button id="returnButton" class="returnButton" role="link" onclick="javascript:window.location='bookPage.jsp';">Cancelar</button>
		</form>
	<%} else {
		%><jsp:forward page="error.jsp?msg='No te has logueado.'"></jsp:forward><%
	}%>
</body>
</html>