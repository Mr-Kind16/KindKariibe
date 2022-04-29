<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pagina amministratore</title>
</head>
<body>


	<h2 align="center">Prodotti in vendita</h2>

	<table>
		<tr>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Descrizione</th>
		</tr>

		<% ArrayList<ProdottoBean> ListaProdotti = (ArrayList<ProdottoBean>) request.getAttribute("prodotti");
  				for(ProdottoBean prodotto : ListaProdotti)
  				{
  				%>
		<tr>
			<td><%= prodotto.getNome() %></td>
			<td><%= prodotto.getPrezzo() %></td>
			<td><%= prodotto.getDescrizione() %></td>
		</tr>
		<%}%>
	</table>

	<br>

	<h2>Inserisci</h2>
	<form action="inserire" method="post">
		<input type="hidden" name="action" value="insert"> <label
			for="nome">Nome:</label><br> <input name="nome" type="text"
			maxlength="20" required placeholder="inserire nome..."><br>

		<label for="descrizione">Descrizione:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3" required
			placeholder="inserire descrizione..."></textarea>
		<br> <label for="prezzo">Prezzo:</label><br> <input
			name="prezzo" type="number" min="0" value="0" required><br>

		<label for="quantita">Quantità:</label><br> <input
			name="quantita" type="number" min="1" value="1" required><br>

		<input type="submit" value="Aggiungi"><input type="reset"
			value="Reset">

	</form>

	<h2>Rimuovi elemento</h2>
	<form action="rimuovi" method="post">
		<input type="hidden" name="action" value="insert"> <label
			for="nome">Nome:</label><br> <input name="nome" type="text"
			maxlength="20" required placeholder="inserire nome..."><br>

		<input type="submit" value="Rimuovi"><input type="reset"
			value="Reset">

	</form>

	<h2>Aggiorna prodotto</h2>
	<form action="inserire" method="post">
		<input type="hidden" name="action" value="insert"> <label
			for="nome">Nome:</label><br> <input name="nome" type="text"
			maxlength="20" required placeholder="inserire nome..."><br>

		<label for="descrizione">Descrizione:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3" required
			placeholder="inserire descrizione..."></textarea>
		<br> <label for="prezzo">Prezzo:</label><br> <input
			name="prezzo" type="number" min="0" value="0" required><br>

		<label for="quantita">Quantità:</label><br> <input
			name="quantita" type="number" min="1" value="1" required><br>

		<input type="submit" value="Aggiungi"><input type="reset"
			value="Reset">

	</form>





</body>
</html>