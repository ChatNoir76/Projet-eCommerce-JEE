<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INTRO - Liste des Clients</title>
</head>
<body>
	<section id='contenu'>
		<section id='cadreBlanc' class="container">
			<p>Bienvenue sur le site eCommerce</p>
			<div class="row justify-content-md-center align-items-start" style="width: 90%">
				<c:forEach var="lp" items="${ listproduit }">
					<div class="col-sm">
						<div class="card text-dark"  style="opacity:0.75;border: solid Black 1px;width:200px;height:300px;margin:20px">
						  <div class="card-body">
						    <h5 class="card-title" onClick="voirProduit(${ lp._id })"><c:out value="${ lp.get_nomProduit() }" /></h5>
						    <h6 class="card-subtitle mb-2 text-muted">Prix HT : <fmt:formatNumber type = "number" minFractionDigits = "2" value = "${ lp.get_prixHT() }"/>e</h6>
						    <p class="card-text"><c:if test="${ lp._stockInventaire > 0 }"><c:out value="En stock" /></c:if></p>
						    <button class="btn btn-primary" onClick="ajoutPanier(${ lp._id })">ajout panier</button>
						  </div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
	</section>
</body>
</html>
