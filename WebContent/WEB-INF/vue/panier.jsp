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
			<p>ceci est le test du listing du paniers</p>
			<ul class="list-group">
				<c:forEach var="lc" items="${ panier.articles }">
					  <li class="list-group-item d-flex justify-content-between align-items-center">
					    <c:out value="${ lc.get_produit().get_nomProduit() }" />
					    <span class="badge badge-secondary badge-pill">Soit TTC : <c:out value="${ lc.get_prix_TTC() * lc.get_quantite()}" /></span>
						<span class="badge badge-secondary badge-pill">TVA : <c:out value="${ lc.get_tva() *100 }" /></span>
						<span class="badge badge-secondary badge-pill">remise : <c:out value="${ lc.get_remise()*100 }" /></span>
						<span class="badge badge-secondary badge-pill">Quantité : <c:out value="${ lc.get_quantite() }" /></span>
						<span class="badge badge-primary badge-pill">Prix HT : <c:out value="${ lc.get_produit().get_prixHT() }" /></span>
				</c:forEach>
			</ul>
			Total Panier : <c:out value="${ panier.getSommeAPayer() }" />
		</section>
	</section>
</body>
</html>