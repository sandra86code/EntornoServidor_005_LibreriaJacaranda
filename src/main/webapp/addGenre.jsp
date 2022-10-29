<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Añadir género</title>
<link href="css/forms.css" rel="stylesheet" id="bootstrap-css">
<script>
function onSubmit(){
    return false;
}

function confirmUpdate() {
   	if (confirm("¿Estás seguro/a de querer añadir este género?")) {
    	document.getElementById("addGenreForm").submit();
    } else {
    	window.location='genreList.jsp';
    }
}
</script>
</head>

<body>

<% HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){%>
		
	<section class="get-in-touch">
		<h1 class="title">Añadir género</h1>
		<form class="contact-form row" id="addGenreForm" action="addGenrePersist.jsp" method="post" onSubmit="return onSubmit();">
			<div class="form-field col-lg-6">
				<input id="name" class="input-text js-input" type="text" name="name" maxlength="50" minlength="1" placeholder="Nombre del género literario" required>
				<label class="label" for="name">Nombre</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="description" class="input-text js-input" type="text" name="description" maxlength="50" minlength="1" placeholder="Descripción del género" required>
				<label class="label" for="description">Descripción</label>
			</div>
			<div class="form-field col-lg-12">
				<button class="submit-btn" type="submit" name="addGenre" onclick="confirmUpdate()">Añadir</button>
				<button class="back-btn" id="returnButton" class="returnButton" role="link" onclick="javascript:window.location='genreList.jsp';">Cancelar</button>
			</div>
		</form>	
	</section>
	
<%}else {%>
	<jsp:forward
		page="error.jsp?msg='No te has autenticado'"></jsp:forward>
<%}%>

</body>
</html>