<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.articles.DaoBook"%>
<%@ page import="com.jacaranda.articles.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Eliminar libro</title>
<link href="css/forms.css" rel="stylesheet" id="bootstrap-css">
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
			%><jsp:forward page="error.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward><%
		}%>
		<section class="get-in-touch">
		<h1 class="title">Borrar libro</h1>
		
		<form class="contact-form row" action="deleteBookPersist.jsp" method="post" id="deleteForm" onSubmit="return onSubmit();">
				<table>
					<tr class="form-field col-md-6">
						<td class="labelTable">ISBN</td>
						<td class="table"><input type="hidden" name="isbn" value="<%=bookDetails.getIsbn()%>"><%=bookDetails.getIsbn()%></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Título</td>
						<td class="table"><%=bookDetails.getTitle()%></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Autor</td>
						<td class="table"><%=bookDetails.getAuthor()%></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Fecha de publicación</td>
						<td class="table"><%=bookDetails.getPublishedDate()%></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Cantidad</td>
						<td class="table"><%=bookDetails.getQuantity()%></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Precio</td>
						<td class="table"><%=bookDetails.getPrice()%></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Stock</td>
						<td class="table"><%=bookDetails.getStockYN()%></td>
					</tr>
				</table>

			<div class="form-field col-lg-12">
				<button class="submit-btn" type="submit" name="deleteBook" value="deleteBook" onclick="confirmDelete()">Borrar</button>
				<button class="back-btn" id="returnButton" class="returnButton" role="link" onclick="javascript:window.location='bookPage.jsp';">Cancelar</button>
			</div>
		</form>
		</section>
	<%} else {
		%><jsp:forward page="error.jsp?msg='No te has autenticado.'"></jsp:forward><%
	}%>

</body>
</html>