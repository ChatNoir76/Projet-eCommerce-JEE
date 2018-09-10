<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <a class="navbar-brand" href="/eCommerce/index">AFPA eCommerce</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
   	      <li class="nav-item">
	      	<c:if test="${!empty sessionScope.client && sessionScope.clientStatut >= 4}">
				<a class="nav-link" href="/eCommerce/listeClient">liste client</a>
			</c:if>
	      </li>
	      <li class="nav-item">
   			<c:if test="${!empty sessionScope.client}">
				<a class="nav-link" href="/eCommerce/panier">Panier (<c:out value="${ panier.count() }"></c:out>)</a>
			</c:if>
	      </li>
	      <li class="nav-item dropdown">
		    	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          	<c:if test="${empty sessionScope.client || sessionScope.clientStatut < 2}">
						<c:out value="Connexion"></c:out>
					</c:if>
					<c:if test="${!empty sessionScope.client && sessionScope.clientStatut >= 2}">
						<c:out value="${sessionScope.client.get_mail()}"></c:out>
					</c:if>
		        </a>
		        <c:if test="${empty sessionScope.client || sessionScope.clientStatut < 2}">
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="/eCommerce/connexion">Connexion</a>
			          <a class="dropdown-item" href="/eCommerce/inscription">Créer un compte</a>
			        </div>
				</c:if>
				<c:if test="${!empty sessionScope.client}">
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="#">Mon Compte Client</a>
			          <a class="dropdown-item" href="/eCommerce/deconnexion">Déconnexion</a>
			        </div>
				</c:if>
			</li>
	    </ul>
			
	  </div>
	</nav>
</header>