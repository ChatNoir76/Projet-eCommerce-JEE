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
			<c:if
				test="${empty sessionScope.client || sessionScope.clientStatut < 2}">
				<p>
					Mon panier - commande n°
					<c:out value="${ panier.get_idCommande() }"></c:out>
				</p>
			</c:if>
			<c:if
				test="${empty sessionScope.client || sessionScope.clientStatut >= 2}">
				<p>
					Le panier de
					<c:out value="${ client.get_nom() }"></c:out>
					(
					<c:out value="${ client.get_mail() }"></c:out>
					) - commande n°
					<c:out value="${ panier.get_idCommande() }"></c:out>
				</p>
			</c:if>
			<table class="table table-dark"
				style="width: 90%; opacity: 0.75; filter: alpha(opacity = 75);">
				<thead>
					<tr>
						<th scope="col"><span><c:out value="Nom Produit" /></span></th>
						<th scope="col"><span>Prix HT</span></th>
						<th scope="col"><span
							class="badge badge-secondary badge-pill">Quantité</span></th>
						<th scope="col"><span>remise</span></th>
						<th scope="col"><span>TVA</span></th>
						<th scope="col"><span>Soit TTC</span></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="lc" items="${ panier.articles }">
						<tr>
							<td><span><c:out
										value="${ lc.get_produit().get_nomProduit() }" /></span></td>
							<td><span><fmt:formatNumber type="number"
										minFractionDigits="2" maxFractionDigits="2"
										value="${ lc.get_produit().get_prixHT() }" /></span></td>
							<td><span class="badge badge-secondary badge-pill"><input
									type="number" min="0"
									max="${ lc.get_produit().get_stockInventaire() }"
									onChange="modificationQuantityPanier(${ lc.get_produit().get_id() }, this.value)"
									value="<c:out value="${ lc.get_quantite() }" ></c:out>"
									style="color: white; background-color: grey; width: 50px" /></span></td>
							<td><span><fmt:formatNumber type="number"
										minFractionDigits="2" maxFractionDigits="2" value="${ lc.get_remise()*100 }" />%</span></td>
							<td><span><fmt:formatNumber type="number"
										minFractionDigits="2" maxFractionDigits="2" value="${ lc.get_tva() *100 }" />%</span></td>
							<td><span><fmt:formatNumber type="number"
										minFractionDigits="2" maxFractionDigits="2" value="${ lc.get_prix_TTC() }" /></span></td>
						</tr>
					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><strong><span class="text-warning">Remise
									Panier</span></strong></td>
						<td><strong><span class="text-warning"> <fmt:formatNumber
										type="number" minFractionDigits="2" maxFractionDigits="2"
										value="${ panier.get_commande().get_remiseGlobale() * 100}" />%
							</span></strong></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><strong><span class="text-primary">Total
									Panier</span></strong></td>
						<td><strong><span class="text-primary"> <fmt:formatNumber
										type="number" minFractionDigits="2" maxFractionDigits="2"
										value="${ panier.getSommeAPayer() }" />
							</span></strong></td>
					</tr>
				</tbody>
			</table>
			<div style="display: flex; flex-direction: center;">
				<c:if
					test="${empty sessionScope.client || sessionScope.clientStatut >= 2}">
					<!-- <label for="email" class="alert alert-primary">code reduction : </label>  -->
					<input type="text" id="codereduction" value="" maxlength="20"
						placeholder="code de reduction" />
					<button type="button" style="margin-right: 35px;"
						class="btn btn-secondary" onClick="codereduction()">ok</button>
				</c:if>
				<button type="button" style="margin-right: 35px;"
					class="btn btn-info" onClick="refreshPanier()">Mettre à
					jour mon panier</button>
				<c:if
					test="${empty sessionScope.client || sessionScope.clientStatut < 2}">
					<button type="button" class="btn btn-danger"
						onClick="document.location.href='/eCommerce/connexion'">se
						connecter</button>
				</c:if>
				<c:if
					test="${empty sessionScope.client || sessionScope.clientStatut >= 2}">
					<button type="button" class="btn btn-success"
						onClick="validationPanier()">valider mon panier</button>
				</c:if>
			</div>
		</section>
	</section>
</body>
</html>