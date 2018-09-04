<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INTRO - Liste des Clients</title>
</head>
<body>
	<section id='contenu' class='contenu'>
		<section id='cadreBlanc' class='cadreBlanc'>
			<p>Bienvenue sur le site eCommerce</p>
			<c:forEach var="lc" items="${ listproduit }">
					<c:out value="${ lc}" />
					<button onClick="voirProduit(${ lc._id })">voir</button>
			</c:forEach>
		</section>
	</section>
</body>
</html>
