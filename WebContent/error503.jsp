<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" import = "beans.*"%>
<%@page isErrorPage="true" %>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Errore 503</title>
		<link rel="stylesheet" type="text/css" href="./errors.css">	
	</head>
	
<body>
<% UserBean utente = (UserBean) request.getAttribute("utente"); %>

	<div>	
	<br><br>
		<h1 class="error-code">503</h1>
		<p class="error">Il server è temporaneamente impegnato.</p>
		<p class= "error">Riprova più tardi.</p>	
		
			<form method="get" action="./home.jsp">
		 <input type="submit" value="Home"/>
	</form>
		
	</div>
	
		

</body>
</html>