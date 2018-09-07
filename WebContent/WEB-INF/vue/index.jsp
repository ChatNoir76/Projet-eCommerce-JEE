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
		<section id='cadreBlanc' class='d-flex flex-xl-wrap'>
			<p>Bienvenue sur le site eCommerce</p>
				<c:forEach var="lp" items="${ listproduit }">
					<div class="card" style="width: 150px;border: solid Black 1px">
					  <div class="card-body">
					    <h5 class="card-title"><c:out value="${ lp.get_nomProduit() }" /></h5>
					    <h6 class="card-subtitle mb-2 text-muted"><c:out value="${ lp.get_prixHT() }" /></h6>
					    <p class="card-text"><c:if test="${ lp._stockInventaire > 0 }"><c:out value="En stock" /></c:if></p>
					    <button class="card-link" onClick="ajoutPanier(${ lp._id })">ajout panier</button>
						<button class="card-link" onClick="voirProduit(${ lp._id })">voir</button>
					  </div>
					</div>
				</c:forEach>
		</section>
	</section>
</body>
</html>
