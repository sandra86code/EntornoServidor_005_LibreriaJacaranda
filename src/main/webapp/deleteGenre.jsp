<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.dao.DaoGenre"%>
<%@ page import="com.jacaranda.model.Genre"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Eliminar género</title>
<link href="css/showData.css" rel="stylesheet" id="bootstrap-css">
<script>
function onSubmit(){
    return false;
}

function confirmDelete() {
   	if (confirm("¡ATENCIÓN! Estás a punto de borrar no solo este género, sino todos los libros asociados a él. ¿Estás seguro/a de querer borrarlo?")) {
    	document.getElementById("deleteForm").submit();
    } else {
    	window.location='listGenres.jsp';
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
		DaoGenre daog = new DaoGenre();
		Genre genreDetails = null;
		String genero = request.getParameter("value");
		try {
			genreDetails = daog.findGenre(genero);
		} catch (Exception e) {
			String message = e.getMessage();
			%><jsp:forward page="error.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward><%
		}%>
		<section class="get-in-touch">
		<h1 class="title">Borrar género "<%=genero%>"</h1>
		
		<form class="contact-form row" action="deleteGenrePersist.jsp" method="post" id="deleteForm" onSubmit="return onSubmit();">
				<table>
					<tr class="form-field col-md-6">
						<td class="labelTable">Nombre</td>
						<td class="table"><input type="hidden" name="name" value="<%=genreDetails.getName()%>"><%=genreDetails.getName()%></td>
					</tr>
					<tr class="form-field col-md-6">
						<td class="labelTable">Descripción</td>
						<td class="table"><input type="hidden" name="description" value="<%=genreDetails.getDescription()%>"><%=genreDetails.getDescription()%></td>
					</tr>
				</table>

			<div class="form-field col-lg-12">
				<button class="submit-btn" type="submit" name="deleteBook" value=deleteGenre" onclick="confirmDelete()">Borrar</button>
				<button class="back-btn" id="returnButton" class="returnButton" role="link" onclick="javascript:window.location='listGenres.jsp';">Cancelar</button>
			</div>
		</form>
		</section>
	<%} else {
		%><jsp:forward page="error.jsp?msg='No te has autenticado.'"></jsp:forward><%
	}%>

</body>
</html>