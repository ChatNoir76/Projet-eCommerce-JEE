<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Historique des commandes</title>
</head>
<body>
	<section id='contenu'>
		<section id='cadreBlanc' class="container">
			<h1>Historique des commandes</h1>
			<div class="row justify-content-md-center align-items-start"
				style="width: 90%">
				<c:forEach var="monpanier" items="${ listePanier }">
					<div class="card text-dark"
						style="opacity: 0.75; border: solid Black 1px; width: 90%;margin-bottom: 30px">
						<div class="card-body">
							<h3 class="card-title">
								Commande n°<c:out value="${ monpanier.get_idCommande() }" />
							</h3>
							<h4 class="card-subtitle mb-2 text-muted">
								<c:out value="${ monpanier.getDateCommande() }"></c:out>
							</h4>
							<p class="card-text">
								<c:forEach var="monArticle" items="${ monpanier.getArticles() }">
									<p>
										<strong>${ monArticle.get_produit().get_nomProduit() }</strong>
										 (x${ monArticle.get_quantite() })
										  au prix unitaire de <fmt:formatNumber type="number"
										minFractionDigits="2" maxFractionDigits="2" value="${ monArticle.get_prix_TTC_unitaire() }" />
										  soit en tout : <span class="strong"><fmt:formatNumber type="number"
										minFractionDigits="2" maxFractionDigits="2" value="${ monArticle.get_prix_TTC() }" /></span>
									</p>
								</c:forEach>
								<fieldset style="border: 1px solid green">
								Prix TTC de la commande (remise incluse) : <span class="faireRessortir strong"><fmt:formatNumber type="number"
										minFractionDigits="2" maxFractionDigits="2" value="${ monpanier.getSommeAPayer() }" />€</span>
								</fieldset>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
	</section>
</body>
</html>