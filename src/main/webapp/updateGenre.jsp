<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="com.jacaranda.dao.DaoGenre"%>
<%@ page import="com.jacaranda.model.Genre"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/forms.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>LJ - Actualizar género</title>
<script>
function onSubmit(){
    return false;
}

function confirmUpdate() {
   	if (confirm("¡ATENCIÓN! Estás a punto de actualizar el género. ¿Estás seguro/a de que quieres continuar?")) {
    	document.getElementById("updateGenreForm").submit();
    } else {
    	window.location='listGenres.jsp';
    }
}


</script>
</head>
<body>
	<% //check session
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){ 
		DaoGenre daog = new DaoGenre();
		Genre genreDetails = null;
		String genero = request.getParameter("genre");
		try {
			genreDetails = daog.getGenre(genero);
		} catch (Exception e) {
			String message = e.getMessage();
			%><jsp:forward page="errorBackToGenreTable.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward><%
		}%>
		<section class="get-in-touch">
			<h1 class="title">Actualizar género "<%=genero%>"</h1>
			<form class="contact-form row" id="updateGenreForm" action="updateGenrePersist.jsp" method="post" onSubmit="return onSubmit();">
				<div class="form-field col-lg-6">
					<!-- Can't be modified -->
					<input id="isbn" class="input-text js-input" type="text" name="name" value="<%= genero %>" placeholder="Nombre del género literario" readonly>
					<label class="label" for="isbn">Nombre</label>
				</div>
				<div class="form-field col-lg-6">
					<input id="title" class="input-text js-input" type="text" name="description" value="<%=genreDetails.getDescription()%>" placeholder="Descripción del género" required>
					<label class="label" for="title">Descripción</label>
				</div>
				<div class="form-field col-lg-12">
					<button class="submit-btn" type="submit" name="updateGenre" value=updateGenre" onclick="confirmUpdate()">Actualizar</button>
					<button class="back-btn" id="returnButton" class="returnButton" role="link" onclick="javascript:window.location='listGenres.jsp';">Cancelar</button>
				</div>
			</form>
		</section>
		<%} else {
		%><jsp:forward page="error.jsp?msg='No te has autenticado.'"></jsp:forward><%
	}%>

</body>
</html>