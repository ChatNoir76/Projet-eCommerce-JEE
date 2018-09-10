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
			<table class="table table-dark" style="width:90%;opacity:0.75;filter: alpha(opacity=75);">
			  <thead>
			    <tr>
			      <th scope="col"><span ><c:out value="Nom Produit" /></span></th>
			      <th scope="col"><span >Prix HT</span></th>
			      <th scope="col"><span class="badge badge-secondary badge-pill">Quantité</span></th>
			      <th scope="col"><span >remise</span></th>
			      <th scope="col"><span >TVA</span></th>
			      <th scope="col"><span >Soit TTC</span></th>
			    </tr>
			  </thead>
			  <tbody>
  				<c:forEach var="lc" items="${ panier.articles }">
					 <tr>
					    <td><span ><c:out value="${ lc.get_produit().get_nomProduit() }" /></span></td>
						<td><span ><fmt:formatNumber type = "number" minFractionDigits = "2" value = "${ lc.get_produit().get_prixHT() }"/></span></td>
						<td><span class="badge badge-secondary badge-pill"><c:out value="${ lc.get_quantite() }" /></span></td>
						<td><span ><fmt:formatNumber type = "number" minFractionDigits = "2" value = "${ lc.get_remise()*100 }"/></span></td>
						<td><span ><fmt:formatNumber type = "number" minFractionDigits = "2" value = "${ lc.get_tva() *100 }"/></span></td>
						<td><span ><fmt:formatNumber type = "number" minFractionDigits = "2" value = "${ lc.get_prix_TTC() }"/></span></td>
					</tr>
				</c:forEach>
			    <tr>
			      <td></td>
			      <td></td>
			      <td></td>
			      <td></td>
			      <td><strong><span class="text-primary">Total Panier</span></strong></td>
			      <td>
			      	<strong><span class="text-primary">
						<fmt:formatNumber type = "number" minFractionDigits = "2" value = "${ panier.getSommeAPayer() }"/>
					</span></strong>
			      </td>
			    </tr>
			  </tbody>
			</table>
		</section>
	</section>
</body>
</html>