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
			<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item active"><a class="nav-link" href="#">CD/Vinyl/Music</a>
						</li>
						<li class="nav-item active"><a class="nav-link" href="#">DVD/Film</a>
						</li>
						<li class="nav-item active"><a class="nav-link" href="#">Jeux</a>
						</li>
						<li class="nav-item active"><a class="nav-link" href="#">Autres</a>
						</li>
					</ul>
				</div>
			</nav>
			<div class="row justify-content-md-center align-items-start"
				style="width: 90%">
				<c:forEach var="lp" items="${ listproduit }">
					<div class="col-sm">
						<div class="card text-dark"
							style="opacity: 0.75; border: solid Black 1px; width: 200px; height: 300px; margin: 20px">
							<div class="card-body">
								<h5 class="card-title" onClick="voirProduit(${ lp._id })">
									<c:out value="${ lp.get_nomProduit() }" />
								</h5>
								<h6 class="card-subtitle mb-2 text-muted">
									Prix HT :
									<fmt:formatNumber type="number" minFractionDigits="2"
										value="${ lp.get_prixHT() }" />
									e
								</h6>
								<p class="card-text">
									<c:if test="${ lp._stockInventaire > 0 }">
										<c:out value="${ lp._stockInventaire }ex" />
									</c:if>
								</p>
								<c:if test="${ lp._stockInventaire > 0 }">
									<button class="btn btn-primary"
										onClick="ajoutPanier(${ lp._id })">ajout panier</button>
								</c:if>
								<c:if test="${ lp._stockInventaire <= 0 }">
									<div class="alert alert-danger" role="alert">Rupture !!!
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
	</section>
</body>
</html>
