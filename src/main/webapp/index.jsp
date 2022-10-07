<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJ - Login</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<% session.invalidate(); %>
	<div id="container">
		<div id="loginBox">
			<form id="loginForm" action="checkLogin.jsp" method="post">
				<div id="loginIcon">
					<img src="images/userIcon.png">
				</div>
			
			 	<div>
					<label class="loginLabel" for="userName">Usuario</label>
					<input type="text" maxlength="20" placeholder="Introduce tu nombre de usuario" name="user" required>
				</div>
				
				<div>
					<label class="loginLabel" for="userPassword">Contraseña</label>
					<input type="password" maxlength="10" placeholder="Introduce tu contraseña" name="password" required>
				</div>
				<div>
					<button id="loginButton" class="loginButton">Login</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>