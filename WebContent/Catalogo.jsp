<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*" import="beans.*"
	import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="catalogo.css" rel="stylesheet" type="text/css">
<title>Catalogo prodotti</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="pasticceria">
		<span class="titolo">La Pasticceria</span>
	</div>

	<% ArrayList<ProdottoBean> ListaProdotti = (ArrayList<ProdottoBean>) request.getAttribute("prodotti");
	if(ListaProdotti == null) {
		response.sendRedirect("./CreaCatalogo");	
		return;
	}
	%>
	<div class="container">
  	<%
  				for(ProdottoBean prodotto : ListaProdotti)
  				{
  					%>
		<div class="card">
			<a href="CreaCatalogo?action=details&id=<%=prodotto.getNome()%>"><img class="image" src="./immagini/<%= prodotto.getPathImage().get(0)  %>"></a>
			<div class="dettagli-card">
				<div class="nome"><%= prodotto.getNome() %></div>
				<p>&euro; <%= String.format("%.02f", prodotto.getPrezzo())%></p>
				<a href="GestioneCarrello?action=aggiungi&id=<%=prodotto.getNome()%>">Aggiungi al carrello</a>
			</div>
		</div>
		
		

	<%}%>
	</div>



	<%  UserBean utente = (UserBean) request.getAttribute("utente"); 
	
		if(utente == null)
		{
			utente = (UserBean) request.getSession(true).getAttribute("utente");
		}
	
		if(utente.getAdmin())
		{
			HttpSession sessione = request.getSession(true);
			sessione.setAttribute("utente", utente);
		%>

	<h2>Inserisci</h2>
	<form action="AdminServlet" method="post">
		<input type="hidden" name="operazione" value="inserire"> <label
			for="nome">Nome:</label><br> <input name="nome" type="text"
			maxlength="20" required placeholder="inserire nome..."><br>

		<label for="categoria">Categoria:</label><br>
		<textarea name="categoria" maxlength="100" rows="3"
			placeholder="inserire categoria..."></textarea>
		<br> <label for="tipo">Tipo:</label><br>
		<textarea name="tipo" maxlength="100" rows="3"
			placeholder="inserire tipo..."></textarea>
		<br> <label for="descrizione">Descrizione:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3" required
			placeholder="inserire descrizione..."></textarea>
		<br> <label for="immagine">Immagine:</label><br>
		<textarea name="immagine" maxlength="100" rows="3" required
			placeholder="inserire nome immagine..."></textarea>
		<br> <br> <label for="prezzo">Prezzo:</label><br> <input
			name="prezzo" type="number" min="0" value="0" required><br>

		<br> <label for="IVA">IVA:</label><br> <input name="IVA"
			type="number" min="0" value="10" required><br> <br>
		<label for="peso">Peso:</label><br> <input name="peso"
			type="number" min="0" value="10" required><br> <label
			for="quantita">Quantità:</label><br> <input name="quantita"
			type="number" min="1" value="1" required><br> <input
			type="submit" value="Aggiungi"><input type="reset"
			value="Reset">

	</form>

	<h2>Rimuovi Elemento</h2>
	<form action="AdminServlet" method="post">
		<input type="hidden" name="operazione" value="rimuovi"> <label
			for="nome">Nome:</label><br> <input name="nome" type="text"
			maxlength="20" required placeholder="inserire nome..."><br>

		<input type="submit" value="Rimuovi"><input type="reset"
			value="Reset">

	</form>

	<h2>Aggiorna prodotto</h2>
	<form action="AdminServlet" method="post">
		<input type="hidden" name="operazione" value="aggiorna"> <label
			for="nome">Nome:</label><br> <input name="nome" type="text"
			maxlength="20" required placeholder="inserire nome..."><br>

		<label for="categoria">Categoria:</label><br>
		<textarea name="categoria" maxlength="100" rows="3"
			placeholder="inserire categoria..."></textarea>

		<label for="tipo">Tipo:</label><br>
		<textarea name="tipo" maxlength="100" rows="3"
			placeholder="inserire tipo..."></textarea>

		<label for="descrizione">Descrizione:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3"
			placeholder="inserire descrizione..."></textarea>

		<label for="immagine">Immagine:</label><br>
		<textarea name="immagine" maxlength="100" rows="3"
			placeholder="inserire nome immagine..."></textarea>


		<br> <label for="prezzo">Prezzo:</label><br> <input
			name="prezzo" type="number" min="0" value="0"><br> <br>
		<label for="IVA">IVA:</label><br> <input name="IVA" type="number"
			min="0" value="10"><br> <br> <label for="peso">Peso:</label><br>
		<input name="peso" type="number" min="0" value="10"><br>

		<label for="quantita">Quantità:</label><br> <input
			name="quantita" type="number" min="1" value="1"><br> <input
			type="submit" value="Aggiorna"><input type="reset"
			value="Reset">
	</form>

	<% } %>

	<form action="LogoutServlet" method="get">
		<input type="submit" value="Logout" />
	</form>
	<h1>Carrello</h1>
	<p>
		<a href="GestioneCarrello?action=svuota">svuota</a>
	</p>
	<p>
		<a href="GestioneCarrello?action=acquista">acquista</a>
	</p>
	<% HttpSession sessione = request.getSession();
	
		Carrello cart = (Carrello) sessione.getAttribute("Carrello");
		
		if(cart == null)
		{%>
	<p>Carrello vuoto</p>

	<%}
		else
		{
		
			for(ProdottoBean prodotto : cart.getProducts().keySet())
			{%>

	<h1><%= prodotto.getNome() %>
		X
		<%= cart.getProducts().get(prodotto) %>
		<a href="GestioneCarrello?action=rimuovi&id=<%=prodotto.getNome()%>">
			rimuovi</a>
	</h1>

	<%}
		%>


	<%}
			%>






</body>
</html>