<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<!-- <div id="header_recherche"></div> -->
	<!-- <input type="search" id='search' name='search' value="rien" /> -->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<div class="navbar-collapse">
				<ul class="nav navbar-nav">
					<li>
						<a class="navbar-brand" href="/eCommerce/index">Accueil</a>
					</li>
					<li>
						<c:if test="${!empty panier}">
							<a class="navbar-brand" href="/eCommerce/panier">Panier (${ panier.count() })</a>
						</c:if>
					</li>
					<li>
						<c:if test="${!empty sessionScope.client && sessionScope.clientStatut >= 4}">
							<a class="navbar-brand" href="/eCommerce/listeClient">liste client</a>
						</c:if>
					</li>
				</ul>
				<div class="navbar-right">
					<c:if
						test="${empty sessionScope.client || sessionScope.clientStatut < 2}">
						<a class="navbar-brand" href="/eCommerce/connexion">Connexion</a>
					</c:if>
					<c:if
						test="${!empty sessionScope.client}">
						<a class="navbar-brand" href="/eCommerce/deconnexion">
							Déconnexion(<span class="succes">${sessionScope.client.get_mail()}</span>)
						</a>
					</c:if>
				</div>
			</div>
		</div>


	</nav>
</header>